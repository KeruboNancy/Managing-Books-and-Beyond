-- This file contains the SQL statements to create the necessary many-to-many relationships between books and authors, as well as any other relationships needed for the database.

-- Create a junction table for the many-to-many relationship between books and authors
CREATE TABLE book_authors (
    book_id INT NOT NULL,
    author_id INT NOT NULL,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE,
    FOREIGN KEY (author_id) REFERENCES authors(id) ON DELETE CASCADE
);

-- Create a junction table for the many-to-many relationship between books and languages
CREATE TABLE book_languages (
    book_id INT NOT NULL,
    language_id INT NOT NULL,
    PRIMARY KEY (book_id, language_id),
    FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE,
    FOREIGN KEY (language_id) REFERENCES languages(id) ON DELETE CASCADE
);

-- Create a junction table for the many-to-many relationship between orders and books
CREATE TABLE order_books (
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, book_id),
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE
);