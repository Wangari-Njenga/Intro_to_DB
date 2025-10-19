-- Create and select the database
CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

-- Table: authors
DROP TABLE IF EXISTS authors;
CREATE TABLE authors (
  author_id INT NOT NULL AUTO_INCREMENT,
  author_name VARCHAR(215) NOT NULL,
  PRIMARY KEY (author_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Sample data for authors
INSERT INTO authors (author_name) VALUES ('Ngũgĩ wa Thiong’o'), ('Chinua Achebe');

-- Table: books
DROP TABLE IF EXISTS books;
CREATE TABLE books (
  book_id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(130) NOT NULL,
  author_id INT NOT NULL,
  price DOUBLE DEFAULT NULL,
  publication_date DATE DEFAULT NULL,
  PRIMARY KEY (book_id),
  FOREIGN KEY (author_id) REFERENCES authors(author_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Sample data for books
INSERT INTO books (title, author_id, price, publication_date)
VALUES ('Petals of Blood', 1, 15.99, '1977-01-01'),
       ('Things Fall Apart', 2, 12.99, '1958-06-17');

-- Table: customers
DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
  customer_id INT NOT NULL AUTO_INCREMENT,
  customer_name VARCHAR(215) NOT NULL,
  email VARCHAR(215) NOT NULL,
  address TEXT,
  PRIMARY KEY (customer_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Sample data for customers
INSERT INTO customers (customer_name, email, address)
VALUES ('Amina Otieno', 'amina@example.com', 'Nairobi, Kenya'),
       ('John Mwangi', 'john@example.com', 'Mombasa, Kenya');

-- Table: orders
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  order_id INT NOT NULL AUTO_INCREMENT,
  order_date DATE DEFAULT NULL,
  customer_id INT NOT NULL,
  PRIMARY KEY (order_id),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Sample data for orders
INSERT INTO orders (order_date, customer_id)
VALUES ('2025-10-18', 1), ('2025-10-19', 2);

-- Table: order_details
DROP TABLE IF EXISTS order_details;
CREATE TABLE order_details (
  orderdetailid INT NOT NULL AUTO_INCREMENT,
  quantity DOUBLE DEFAULT NULL,
  order_id INT NOT NULL,
  book_id INT NOT NULL,
  PRIMARY KEY (orderdetailid),
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (book_id) REFERENCES books(book_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Sample data for order_details
INSERT INTO order_details (quantity, order_id, book_id)
VALUES (2, 1, 1), (1, 2, 2);
