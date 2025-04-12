-- This file contains SQL statements to insert initial data into the tables for testing and development purposes.

-- Inserting data into authors table
INSERT INTO authors (name, biography, date_of_birth) VALUES
('J.K. Rowling', 'British author, best known for the Harry Potter series.', '1965-07-31'),
('George R.R. Martin', 'American novelist and short story writer, known for A Song of Ice and Fire.', '1948-09-20');

-- Inserting data into languages table
INSERT INTO languages (language) VALUES
('English'),
('Spanish'),
('French'),
('German');

-- Inserting data into publishers table
INSERT INTO publishers (name, address, contact_info) VALUES
('Bloomsbury', '50 Bedford Square, London, WC1B 3DP, UK', 'info@bloomsbury.com'),
('Bantam Books', '1745 Broadway, New York, NY 10019, USA', 'contact@bantam.com');

-- Inserting data into books table
INSERT INTO books (title, isbn, publication_date, price) VALUES
('Harry Potter and the Philosopher\'s Stone', '9780747532699', '1997-06-26', 19.99),
('A Game of Thrones', '9780553103540', '1996-08-06', 22.99);

-- Inserting data into customers table
INSERT INTO customers (name, email, phone_number) VALUES
('Alice Smith', 'alice@example.com', '123-456-7890'),
('Bob Johnson', 'bob@example.com', '098-765-4321');

-- Inserting data into addresses table
INSERT INTO addresses (street, city, state, postal_code) VALUES
('123 Main St', 'Springfield', 'IL', '62701'),
('456 Elm St', 'Metropolis', 'NY', '10001');

-- Inserting data into orders table
INSERT INTO orders (order_date, total_amount, customer_id) VALUES
('2023-01-15', 39.98, 1),
('2023-01-16', 22.99, 2);

-- Inserting data into relationships table (many-to-many between books and authors)
INSERT INTO relationships (book_id, author_id) VALUES
(1, 1),  -- Harry Potter and the Philosopher's Stone by J.K. Rowling
(2, 2);  -- A Game of Thrones by George R.R. Martin