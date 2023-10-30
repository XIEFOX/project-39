mod obj_store;
mod user;
mod utils;

pub mod project_39_pb {
    tonic::include_proto!("project_39.v1");
}

#[cfg(test)]
mod test_utils {
    use sqlx::sqlite::SqlitePoolOptions;

    const DATABASE_URL: &str = "sqlite://../data/db/test_db.db";

    pub(crate) async fn new_test_sqlite_connection() -> sqlx::Pool<sqlx::Sqlite> {
        SqlitePoolOptions::new()
            .max_connections(1)
            .connect(DATABASE_URL)
            .await
            .unwrap()
    }
}
