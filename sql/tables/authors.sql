-- filepath: /bookstore-database/bookstore-database/sql/tables/authors.sql

CREATE TABLE authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    biography TEXT,
    date_of_birth DATE
);