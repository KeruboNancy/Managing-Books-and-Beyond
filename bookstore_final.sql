
-- Create the bookstore database
CREATE DATABASE IF NOT EXISTS bookstore;
USE bookstore;

-- Table: Countries
CREATE TABLE country (
    country_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

-- Table: Address Status
CREATE TABLE address_status (
    status_id INT PRIMARY KEY AUTO_INCREMENT,
    status_name VARCHAR(50) NOT NULL
);

-- Table: Addresses
CREATE TABLE addresses (
    address_id INT PRIMARY KEY AUTO_INCREMENT,
    street VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

-- Table: Authors
CREATE TABLE authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    biography TEXT,
    date_of_birth DATE
);

-- Table: Languages
CREATE TABLE languages (
    id INT PRIMARY KEY AUTO_INCREMENT,
    language_name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Table: Publishers
CREATE TABLE publishers (
    publisher_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    contact_info VARCHAR(255)
);

-- Table: Books
CREATE TABLE books (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    publication_date DATE,
    price DECIMAL(10, 2) NOT NULL,
    language_id INT,
    publisher_id INT,
    FOREIGN KEY (language_id) REFERENCES languages(id),
    FOREIGN KEY (publisher_id) REFERENCES publishers(publisher_id)
);

-- Table: Book Authors (junction)
CREATE TABLE book_authors (
    book_id INT NOT NULL,
    author_id INT NOT NULL,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE,
    FOREIGN KEY (author_id) REFERENCES authors(author_id) ON DELETE CASCADE
);

-- Table: Book Languages (optional junction)
CREATE TABLE book_languages (
    book_id INT NOT NULL,
    language_id INT NOT NULL,
    PRIMARY KEY (book_id, language_id),
    FOREIGN KEY (book_id) REFERENCES books(id),
    FOREIGN KEY (language_id) REFERENCES languages(id)
);

-- Table: Customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(15),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Table: Customer Addresses
CREATE TABLE customer_address (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    address_id INT,
    status_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (address_id) REFERENCES addresses(address_id),
    FOREIGN KEY (status_id) REFERENCES address_status(status_id)
);

-- Table: Orders
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATETIME NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Table: Order Status
CREATE TABLE order_status (
    status_id INT PRIMARY KEY AUTO_INCREMENT,
    status_name VARCHAR(50) NOT NULL
);

-- Table: Order History
CREATE TABLE order_history (
    history_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    status_id INT,
    change_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (status_id) REFERENCES order_status(status_id)
);

-- Table: Shipping Methods
CREATE TABLE shipping_method (
    method_id INT PRIMARY KEY AUTO_INCREMENT,
    method_name VARCHAR(100) NOT NULL
);

-- Table: Order Books (junction)
CREATE TABLE order_books (
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, book_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (book_id) REFERENCES books(id)
);

-- -------------------------------------------------------------
-- Sample Data Insertion (Truncated for brevity)
-- -------------------------------------------------------------

-- Languages
INSERT INTO languages (language_name) VALUES ('English'), ('Spanish'), ('French');

-- Countries
INSERT INTO country (name) VALUES ('USA'), ('UK');

-- Address Status
INSERT INTO address_status (status_name) VALUES ('Current'), ('Old');

-- Authors
INSERT INTO authors (name, biography, date_of_birth) VALUES
('J.K. Rowling', 'British author, best known for the Harry Potter series.', '1965-07-31'),
('George R.R. Martin', 'Known for A Song of Ice and Fire', '1948-09-20');

-- Publishers
INSERT INTO publishers (name, address, contact_info) VALUES
('Bloomsbury', 'London', 'info@bloomsbury.com'),
('Bantam Books', 'New York', 'contact@bantam.com');

-- Books
INSERT INTO books (title, isbn, publication_date, price, language_id, publisher_id) VALUES
('Harry Potter', '9780747532699', '1997-06-26', 19.99, 1, 1),
('Game of Thrones', '9780553103540', '1996-08-06', 22.99, 1, 2);

-- Book Authors
INSERT INTO book_authors (book_id, author_id) VALUES (1, 1), (2, 2);

-- Customers
INSERT INTO customers (name, email, phone_number) VALUES
('Alice Smith', 'alice@example.com', '1234567890'),
('Bob Johnson', 'bob@example.com', '0987654321');

-- Addresses
INSERT INTO addresses (street, city, state, postal_code, country_id) VALUES
('123 Main St', 'Springfield', 'IL', '62701', 1),
('456 Elm St', 'Metropolis', 'NY', '10001', 1);

-- Customer Addresses
INSERT INTO customer_address (customer_id, address_id, status_id) VALUES
(1, 1, 1),
(2, 2, 1);

-- Orders
INSERT INTO orders (order_date, total_amount, customer_id) VALUES
('2023-01-01', 19.99, 1),
('2023-01-02', 22.99, 2);

-- Order Books
INSERT INTO order_books (order_id, book_id, quantity) VALUES (1, 1, 1), (2, 2, 1);

-- Shipping Methods
INSERT INTO shipping_method (method_name) VALUES ('Standard'), ('Express');

-- Order Status
INSERT INTO order_status (status_name) VALUES ('Pending'), ('Shipped'), ('Delivered');

-- Order History
INSERT INTO order_history (order_id, status_id) VALUES (1, 1), (1, 3);

-- -------------------------------------------------------------
-- User Roles & Access (Basic Example)
-- -------------------------------------------------------------
CREATE USER 'book_admin'@'localhost' IDENTIFIED BY 'password123';
GRANT ALL PRIVILEGES ON bookstore.* TO 'book_admin'@'localhost';

-- -------------------------------------------------------------
-- Test Queries
-- -------------------------------------------------------------
SELECT * FROM books;
SELECT name FROM authors;
SELECT c.name, o.order_date FROM customers c JOIN orders o ON c.customer_id = o.customer_id;
