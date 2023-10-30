use argon2::Argon2;
use password_hash::{PasswordHasher, Salt};

pub(crate) fn hash_password(raw: String) -> String {
    let salt = Salt::from_b64("saltsaltsaltsaltsaltsaltsaltsalt").unwrap();
    Argon2::default()
        .hash_password(raw.as_bytes(), salt)
        .unwrap()
        .to_string()
}
