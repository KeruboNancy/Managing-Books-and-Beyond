CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    publication_date DATE,
    price DECIMAL(10, 2) NOT NULL,
    language_id INT,
    publisher_id INT,
    FOREIGN KEY (language_id) REFERENCES languages(id),
    FOREIGN KEY (publisher_id) REFERENCES publishers(id)
);