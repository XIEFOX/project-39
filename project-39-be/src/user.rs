use std::io;

use sqlx::{Pool, Sqlite};

use crate::{
    obj_store::save_user_profile_picture_bin, project_39_pb::*, token::new_token,
    utils::hash_password,
};

pub async fn get_user_info(
    sql_executor: &Pool<Sqlite>,
    user_id: i64,
) -> anyhow::Result<GetUserInfoResponse> {
    let user_info = sqlx::query!("select * from users where user_id = ?", user_id)
        .fetch_one(sql_executor)
        .await?;
    Ok(GetUserInfoResponse {
        user_id: user_info.user_id,
        user_name: user_info.user_name.unwrap(),
        user_email: user_info.user_email.unwrap(),
        user_profile_picture_url: user_info.user_profile_picture_url.unwrap(),
    })
}

pub async fn put_user_info(
    sql_executor: &Pool<Sqlite>,
    user_name: String,
    user_email: String,
    profile_picture_bin: Option<Vec<u8>>,
    password: String,
) -> anyhow::Result<PutUserInfoResponse> {
    let user_password_salted: String = hash_password(password);
    let user_profile_picture_url: String = match profile_picture_bin {
        Some(profile_picture_bin) => save_user_profile_picture_bin(profile_picture_bin),
        None => "".into(),
    };

    sqlx::query!(
        "insert into users \
(user_password_salted, user_name, user_email, user_profile_picture_url) values \
(?, ?, ?, ?)",
        user_password_salted,
        user_name,
        user_email,
        user_profile_picture_url
    )
    .execute(sql_executor)
    .await?;
    let user_id = sqlx::query!("select last_insert_rowid() as user_id")
        .fetch_one(sql_executor)
        .await?;
    Ok(PutUserInfoResponse {
        user_id: user_id.user_id as i64,
    })
}

pub async fn log_in(
    sql_executor: &Pool<Sqlite>,
    redis_conn: &mut redis::Connection,
    user_id: i64,
    password: String,
) -> anyhow::Result<LogInResponse> {
    let user_password_salted = sqlx::query!(
        "select user_password_salted from users where user_id = ?",
        user_id
    )
    .fetch_one(sql_executor)
    .await?
    .user_password_salted
    .unwrap();

    let hash_password = hash_password(password);
    if user_password_salted != hash_password {
        log::error!("`{user_password_salted}` != `{hash_password}`");
        return Err(io::Error::new(
            std::io::ErrorKind::PermissionDenied,
            "user_password_salted != hash_password",
        )
        .into());
    }

    log::info!("log in: `{user_id}`");
    Ok(LogInResponse {
        user_id,
        token: new_token(redis_conn, user_id).unwrap(),
    })
}

#[cfg(test)]

mod tests {
    use crate::{
        project_39_pb::GetUserInfoResponse,
        test_utils::{new_test_redis_client, new_test_sqlite_connection},
    };

    use super::{get_user_info, log_in, put_user_info};

    #[tokio::test(flavor = "multi_thread")]
    async fn test() {
        env_logger::init();

        let r_user_name = "test_01";
        let r_user_email = "test@test.com";
        let password = "abc123";

        let sql_executor = new_test_sqlite_connection().await;
        let redis_conn = new_test_redis_client();

        let r_user_id = put_user_info(
            &sql_executor,
            r_user_name.into(),
            r_user_email.into(),
            None,
            password.into(),
        )
        .await
        .unwrap()
        .user_id;
        let GetUserInfoResponse {
            user_id,
            user_name,
            user_email,
            user_profile_picture_url,
        } = get_user_info(&sql_executor, r_user_id).await.unwrap();

        assert!(r_user_id == user_id);
        assert!(r_user_name == user_name);
        assert!(r_user_email == user_email);
        assert!(user_profile_picture_url.is_empty());

        log_in(
            &sql_executor,
            &mut redis_conn.get_connection().unwrap(),
            user_id,
            password.into(),
        )
        .await
        .unwrap();
    }
}
