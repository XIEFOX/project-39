use sqlx::{Pool, Sqlite};

use crate::{obj_store::save_user_profile_picture_bin, project_39_pb::*, utils::hash_password};

async fn get_user_info(
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

async fn put_user_info(
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
    let user_id = sqlx::query!("select last_insert_rowid() as user_id;")
        .fetch_one(sql_executor)
        .await?;
    Ok(PutUserInfoResponse {
        user_id: user_id.user_id as i64,
    })
}

#[cfg(test)]

mod tests {
    use crate::{project_39_pb::GetUserInfoResponse, test_utils::new_test_sqlite_connection};

    use super::{get_user_info, put_user_info};

    #[tokio::test(flavor = "multi_thread")]
    async fn test() {
        let r_user_name = "test_01";
        let r_user_email = "test@test.com";
        let password = "abc123";

        let conn = new_test_sqlite_connection().await;
        let r_user_id = put_user_info(
            &conn,
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
        } = get_user_info(&conn, r_user_id).await.unwrap();

        assert!(r_user_id == user_id);
        assert!(r_user_name == user_name);
        assert!(r_user_email == user_email);
        assert!(user_profile_picture_url.is_empty());
    }
}
