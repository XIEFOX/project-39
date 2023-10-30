use redis::Commands;

fn set_token(conn: &mut redis::Connection, user_id: i64, token: String) -> anyhow::Result<()> {
    conn.set(token, user_id)?;
    Ok(())
}

pub(crate) fn new_token(conn: &mut redis::Connection, user_id: i64) -> anyhow::Result<String> {
    let token = uuid::Uuid::new_v4().to_string();
    set_token(conn, user_id, token.clone())?;
    Ok(token)
}

pub(crate) fn get_user_id(conn: &mut redis::Connection, token: String) -> anyhow::Result<i64> {
    let ret: i64 = conn.get(token)?;
    Ok(ret)
}
