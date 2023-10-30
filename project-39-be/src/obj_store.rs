use std::{env, fs, path::Path};

use once_cell::sync::Lazy;
use serde::{Deserialize, Serialize};
use uuid::Uuid;

use crate::project_39_pb::{DisplayObject, GetDisplayObjectBatchResponse};

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

pub const SIMPLE_LOCAL_STORE_URL: &str = "../data/objs";

fn scan_objs_id(path: &Path) -> usize {
    let path = fs::canonicalize(path).unwrap();
    log::info!("scan_objs_id: path = `{path:?}`");
    let dir = path.read_dir().unwrap();
    dir.count() - 1
}

#[derive(Serialize, Deserialize)]
struct MetaObj {
    obj_name: String,
    category: String,
    desc: String,
    location: String,
}

pub fn simple_local_batch(url: &str) -> GetDisplayObjectBatchResponse {
    let path = Path::new(url);
    let path = fs::canonicalize(path).unwrap();
    let objs = (1..scan_objs_id(&path))
        .map(|i| {
            let path = path.join(format!("{i}")).join("meta.json");
            log::info!("read_to_string: `{path:?}`");
            let json = fs::read_to_string(path).unwrap();
            let MetaObj {
                obj_name,
                category,
                desc,
                location,
            } = serde_json::from_str(&json).unwrap();

            DisplayObject {
                obj_id: i as i64,
                obj_profile_picture_url: format!("{url}/profile.png"),
                obj_profile_picture_bin: String::new(),
                obj_name,
                category,
                desc,
                location,
            }
        })
        .collect();

    GetDisplayObjectBatchResponse { objs }
}

#[cfg(test)]
mod tests {
    use super::simple_local_batch;
    use super::SIMPLE_LOCAL_STORE_URL;

    #[test]
    fn test_simple_local_batch() {
        assert!(!simple_local_batch(SIMPLE_LOCAL_STORE_URL).objs.is_empty())
    }
}
