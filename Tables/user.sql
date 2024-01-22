CREATE TABLE jmg.user(
    id                  SERIAL,
    user_name           CITEXT NOT NULL,
    password            TEXT NOT NULL,
    name                TEXT NOT NULL,
    lastname            TEXT NOT NULL,
    second_lastname     TEXT NOT NULL,
    created             TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    PRIMARY KEY (id)
);