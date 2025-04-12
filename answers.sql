-- Create database for bookstore then use it
CREATE DATABASE bookstore;
USE bookstore;

-- CREATING TABLES


-- Create book table
CREATE TABLE book
(
    book_id INT
    AUTO_INCREMENT PRIMARY KEY,
title VARCHAR
    (255) NOT NULL,
isbn VARCHAR
    (20) UNIQUE NOT NULL,
price DECIMAL
    (10, 2) NOT NULL,
language_id INT,
publisher_id INT,
publication_date DATE,
FOREIGN KEY
    (language_id) REFERENCES book_language
    (language_id),
FOREIGN KEY
    (publisher_id) REFERENCES publisher
    (publisher_id)
);
    -- it creates a book table with the following columns:
    -- book_id (primary key, auto-incremented), title (not null), isbn (unique, not null), price (not null), language_id (foreign key referencing book_language), publisher_id (foreign key referencing publisher), and publication_date.
    -- The book_id is the primary key and is auto-incremented, meaning it will automatically generate a unique value for each new record.

    -- Create author table
    CREATE TABLE author
    (
        author_id INT
        AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR
        (100),
last_name VARCHAR
        (100) NOT NULL
);
        -- creates a table named author with the following columns:
        -- author_id (primary key, auto-incremented), first_name, and last_name (not null). The author_id is the primary key and is auto-incremented.



        -- Create book_author table
        CREATE TABLE book_author
        (
            book_id INT,
            author_id INT,
            PRIMARY KEY (book_id, author_id),
            FOREIGN KEY (book_id) REFERENCES book(book_id),
            FOREIGN KEY (author_id) REFERENCES author(author_id)
        );
        -- creates a table named book_author with the following columns:
        -- book_id (foreign key referencing book), author_id (foreign key referencing author), and a composite primary key consisting of book_id and author_id. This allows for a many-to-many relationship between books and authors.


        -- Create book_language table
        CREATE TABLE book_language
        (
            language_id INT
            AUTO_INCREMENT PRIMARY KEY,
language_name VARCHAR
            (50) NOT NULL
);
            -- creates a table named book_language with the following columns:
            -- language_id (primary key, auto-incremented) and language_name (not null). The language_id is the primary key and is auto-incremented.



            -- Create publisher table
            CREATE TABLE publisher
            (
                publisher_id INT
                AUTO_INCREMENT PRIMARY KEY,
publisher_name VARCHAR
                (255) NOT NULL
);

                -- creates a table named publisher with the following columns:
                -- publisher_id (primary key, auto-incremented) and publisher_name (not null). The publisher_id is the primary key and is auto-incremented.

                -- Create customer table
                CREATE TABLE customer
                (
                    customer_id INT
                    AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR
                    (100),
last_name VARCHAR
                    (100) NOT NULL,
email VARCHAR
                    (255) UNIQUE NOT NULL,
phone VARCHAR
                    (20)
);

                    -- creates a table named customer with the following columns:
                    -- customer_id (primary key, auto-incremented), first_name, last_name (not null), email (unique, not null), and phone. The customer_id is the primary key and is auto-incremented.



                    -- Create address_status table
                    CREATE TABLE address_status
                    (
                        status_id INT
                        AUTO_INCREMENT PRIMARY KEY,
status_name VARCHAR
                        (50) NOT NULL
);
                        -- creates a table named address_status with the following columns:
                        -- status_id (primary key, auto-incremented) and status_name (not null). The status_id is the primary key and is auto-incremented.



                        -- Create country table
                        CREATE TABLE country
                        (
                            country_id INT
                            AUTO_INCREMENT PRIMARY KEY,
country_name VARCHAR
                            (100) NOT NULL
);
                            -- creates a table named country with the following columns:
                            -- country_id (primary key, auto-incremented) and country_name (not null). The country_id is the primary key and is auto-incremented.

                            -- Create address table
                            CREATE TABLE address
                            (
                                address_id INT
                                AUTO_INCREMENT PRIMARY KEY,
street VARCHAR
                                (255),
city VARCHAR
                                (100),
state VARCHAR
                                (100),
postal_code VARCHAR
                                (20),
country_id INT,
FOREIGN KEY
                                (country_id) REFERENCES country
                                (country_id)
);
                                -- creates a table named address with the following columns:
                                -- address_id (primary key, auto-incremented), street, city, state, postal_code, and country_id (foreign key referencing country). The address_id is the primary key and is auto-incremented.
                                -- The country_id is a foreign key referencing the country table, establishing a relationship between addresses and countries.



                                -- Create customer_address table
                                CREATE TABLE customer_address
                                (
                                    customer_address_id INT
                                    AUTO_INCREMENT PRIMARY KEY,
customer_id INT,
address_id INT,
status_id INT,
FOREIGN KEY
                                    (customer_id) REFERENCES customer
                                    (customer_id),
FOREIGN KEY
                                    (address_id) REFERENCES address
                                    (address_id),
FOREIGN KEY
                                    (status_id) REFERENCES address_status
                                    (status_id)
);

                                    -- creates a table named customer_address with the following columns:
                                    -- customer_address_id (primary key, auto-incremented), customer_id (foreign key referencing customer), address_id (foreign key referencing address), and status_id (foreign key referencing address_status). The customer_address_id is the primary key and is auto-incremented.
                                    -- This table establishes a relationship between customers and their addresses, along with the status of the address.


                                    -- Create cust_order table
                                    CREATE TABLE cust_order
                                    (
                                        order_id INT
                                        AUTO_INCREMENT PRIMARY KEY,
customer_id INT,
order_date DATE NOT NULL,
shipping_method_id INT,
order_status_id INT,
FOREIGN KEY
                                        (customer_id) REFERENCES customer
                                        (customer_id),
FOREIGN KEY
                                        (shipping_method_id) REFERENCES shipping_method
                                        (shipping_method_id),
FOREIGN KEY
                                        (order_status_id) REFERENCES order_status
                                        (order_status_id)
);

                                        -- creates a table named cust_order with the following columns:
                                        -- order_id (primary key, auto-incremented), customer_id (foreign key referencing customer), order_date (not null), shipping_method_id (foreign key referencing shipping_method), and order_status_id (foreign key referencing order_status). The order_id is the primary key and is auto-incremented.
                                        -- This table represents customer orders and establishes relationships with customers, shipping methods, and order statuses.



                                        -- Create order_line table
                                        CREATE TABLE order_line
                                        (
                                            order_line_id INT
                                            AUTO_INCREMENT PRIMARY KEY,
order_id INT,
book_id INT,
quantity INT NOT NULL,
price DECIMAL
                                            (10, 2) NOT NULL,
FOREIGN KEY
                                            (order_id) REFERENCES cust_order
                                            (order_id),
FOREIGN KEY
                                            (book_id) REFERENCES book
                                            (book_id)
);
                                            -- creates a table named order_line with the following columns:
                                            -- order_line_id (primary key, auto-incremented), order_id (foreign key referencing cust_order), book_id (foreign key referencing book), quantity (not null), and price (not null). The order_line_id is the primary key and is auto-incremented.
                                            -- This table represents the line items of customer orders, including the quantity and price of each book in the order.



                                            -- Create shipping_method table
                                            CREATE TABLE shipping_method
                                            (
                                                shipping_method_id INT
                                                AUTO_INCREMENT PRIMARY KEY,
method_name VARCHAR
                                                (100) NOT NULL
);
                                                -- creates a table named shipping_method with the following columns:
                                                -- shipping_method_id (primary key, auto-incremented) and method_name (not null). The shipping_method_id is the primary key and is auto-incremented.
                                                -- This table represents different shipping methods available for orders.



                                                -- Create order_status table
                                                CREATE TABLE order_status
                                                (
                                                    order_status_id INT
                                                    AUTO_INCREMENT PRIMARY KEY,
status_name VARCHAR
                                                    (50) NOT NULL
);
                                                    -- creates a table named order_status with the following columns:
                                                    -- order_status_id (primary key, auto-incremented) and status_name (not null). The order_status_id is the primary key and is auto-incremented.
                                                    -- This table represents different statuses that an order can have.



                                                    -- Create order_history table
                                                    CREATE TABLE order_history
                                                    (
                                                        history_id INT
                                                        AUTO_INCREMENT PRIMARY KEY,
order_id INT,
status_id INT,
status_date DATETIME NOT NULL,
FOREIGN KEY
                                                        (order_id) REFERENCES cust_order
                                                        (order_id),
FOREIGN KEY
                                                        (status_id) REFERENCES order_status
                                                        (order_status_id)
);
                                                        -- creates a table named order_history with the following columns:
                                                        -- history_id (primary key, auto-incremented), order_id (foreign key referencing cust_order), status_id (foreign key referencing order_status), and status_date (not null). The history_id is the primary key and is auto-incremented.
                                                        -- This table tracks the history of order statuses, including the date when each status was applied.






                                                        -- TO SET UP USER GROUPS AND PERMISSIONS


                                                        -- Create an admin user
                                                        CREATE USER 'admin'@'localhost' IDENTIFIED BY 'securepassword';
                                                        GRANT ALL PRIVILEGES ON bookstore.* TO 'admin'@'localhost';

                                                        -- it creates a user named 'admin' with the password 'securepassword' and grants all privileges on the bookstore database to this user. The admin user has full control over the database, including the ability to create, modify, and delete tables and data.

                                                        -- Create a read-only user
                                                        CREATE USER 'readonly'@'localhost' IDENTIFIED BY 'readpassword';
                                                        GRANT SELECT ON bookstore.* TO 'readonly'@'localhost';

                                                        -- it creates a user named 'readonly' with the password 'readpassword' and grants read-only access (SELECT privileges) to the bookstore database. This user can only view data in the database but cannot modify it.


                                                        -- Create a write-access user
                                                        CREATE USER 'writer'@'localhost' IDENTIFIED BY 'writepassword';
                                                        GRANT INSERT, UPDATE, DELETE ON bookstore.* TO 'writer'@'localhost';
                                                        -- it creates a user named 'writer' with the password 'writepassword' and grants write access (INSERT, UPDATE, DELETE privileges) to the bookstore database. This user can modify data in the database but cannot perform administrative tasks like creating or dropping tables.







                                                        -- TESTING THE DATABASE AND USER PERMISSIONS

                                                        SELECT b.title
                                                        FROM book b
                                                            JOIN book_author ba ON b.book_id = ba.book_id
                                                            JOIN author a ON ba.author_id = a.author_id
                                                        WHERE a.first_name = 'John' AND a.last_name = 'Doe';

                                                        -- This query retrieves the titles of books written by an author named John Doe. It joins the book, book_author, and author tables to filter the results based on the author's name.
                                                        -- The query uses the JOIN clause to combine data from multiple tables based on related columns. It filters the results to include only books written by the specified author.
                                                        -- The WHERE clause specifies the conditions for filtering the results, in this case, the author's first and last name.

                                                        SELECT c.first_name, c.last_name, o.order_id
                                                        FROM customer c
                                                            JOIN cust_order o ON c.customer_id = o.customer_id
                                                        WHERE o.order_status_id = (SELECT order_status_id
                                                        FROM order_status
                                                        WHERE status_name = 'pending');

                                                        -- This query retrieves the first and last names of customers who have pending orders. It joins the customer and cust_order tables and filters the results based on the order status.
                                                        -- The subquery retrieves the order_status_id for the 'pending' status from the order_status table.
                                                        -- The main query uses this value to filter the results of the join between the customer and cust_order tables.
                                                        -- The WHERE clause specifies the condition for filtering the results, in this case, the order status.
                                                        -- The query uses the JOIN clause to combine data from multiple tables based on related columns. It filters the results to include only customers with pending orders.


                                                        SELECT title, publication_date
                                                        FROM book
                                                        WHERE YEAR(publication_date) = 2022;

-- This query retrieves the titles and publication dates of books published in the year 2022. It filters the results based on the publication_date column.
-- The WHERE clause specifies the condition for filtering the results, in this case, the year of publication.
-- The query uses the YEAR() function to extract the year from the publication_date column and compares it to 2022.
-- The query retrieves the title and publication date of books published in that year.