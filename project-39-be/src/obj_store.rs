use std::env;

use once_cell::sync::Lazy;
use uuid::Uuid;

static STORE_PATH_PREFIX: Lazy<String> = Lazy::new(|| {
    let store_path_prefix = env::var("STORE_PATH_PREFIX").unwrap();
    log::info!("STORE_PATH_PREFIX: `{store_path_prefix}`");
    store_path_prefix
});

pub(crate) fn save_user_profile_picture_bin(user_profile_picture_bin: Vec<u8>) -> String {
    let file_name = Uuid::new_v4().to_string();
    let path = format!("{}/{file_name}", *STORE_PATH_PREFIX);
    log::info!("save user profile picture bin to `{path}`");
    std::fs::write(&path, user_profile_picture_bin).unwrap();
    path
}
