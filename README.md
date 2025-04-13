# Bookstore Database Project

## Overview
This project is designed to implement a comprehensive database for a bookstore. It includes key tables to manage books, authors, languages, publishers, customers, addresses, and orders, along with their respective relationships.

## Database Schema

The following schema diagram visualizes the relationships between the database tables:

![Bookstore ER Diagram](./assets/bookstore-er-diagram.png) <!-- Update the path based on your project structure -->

The database consists of the following tables:

- **Books**: Contains details about each book, including title, ISBN, publication date, and price.
- **Authors**: Stores information about authors, including name, biography, and date of birth.
- **Languages**: Lists the languages available for the books.
- **Publishers**: Holds details about publishers, including name, address, and contact information.
- **Customers**: Contains customer details such as name, email, and phone number.
- **Addresses**: Stores address details including street, city, state, and postal code.
- **Orders**: Manages order details, including order date, total amount, and customer ID.
- **Relationships**: Defines many-to-many relationships between books and authors, as well as other necessary relationships.

## Setup Instructions
<pre> 
  1. Clone the repository: ```bash git clone https://github.com/KeruboNancy/Managing-Books-and-Beyond.git cd Managing-Books-and-Beyond ``` 
  2. Install PostgreSQL. 
  3. Create the database: ```bash psql -U your_username CREATE DATABASE bookstore; \c bookstore ``` 
  4. Run the schema: ```bash psql -U your_username -d bookstore -f schema.sql ``` 
  5. *(Optional)* Add sample data: ```bash psql -U your_username -d bookstore -f sample_data.sql ``` 
</pre>
## Additional Information
Ensure that you have the necessary database management system installed and configured to execute the SQL scripts. This project is designed to facilitate the management of a bookstore's operations efficiently.
