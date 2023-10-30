CREATE TABLE users (
    user_id INTEGER PRIMARY KEY,
    user_password_salted TEXT,

    user_name TEXT,
    user_email TEXT,
    user_profile_picture_url TEXT
);

CREATE TABLE objs (
    obj_id INTEGER PRIMARY KEY,
    ownership TEXT
);
