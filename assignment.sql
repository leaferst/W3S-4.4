CREATE TABLE users (
    id SERIAL NOT NULL,
    username VARCHAR(15) NOT NULL,
    password VARCHAR NOT NULL,
    email VARCHAR,
    firstName VARCHAR,
    lastName VARCHAR,
    PRIMARY KEY (id)
);

CREATE TABLE countries (
    id SERIAL NOT NULL,
    name VARCHAR NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE addresses (
    id SERIAL,
    user_id INT,
    country_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id)
        REFERENCES users(id),
    FOREIGN KEY (country_id)
        REFERENCES countries(id)
);

INSERT INTO
    users (username, password, email, firstName, lastName)
    VALUES
        ('leaflet', 'Passw0rd!23', 'leahforrest@none.com', 'Leah', 'Forrest'),
        ('gymcrush', 'Passw0rd32!', 'gymbro@none.com', 'Gym', 'Bro');

INSERT INTO countries (name) VALUES ('USA'), ('Japan'), ('Russia');

INSERT INTO addresses (user_id, country_id) VALUES (1,1);
INSERT INTO addresses (user_id, country_id) VALUES (2,1);
INSERT INTO addresses (user_id, country_id) VALUES (2,3);

SELECT * FROM countries;
SELECT email FROM users;
SELECT firstName FROM users WHERE firstName LIKE '%e%';
SELECT countries.name FROM addresses
JOIN countries ON addresses.country_id = countries.id
WHERE addresses.user_id = 2;