-- Drop database if exists
DROP DATABASE IF EXISTS example_db;

-- Create a new database
CREATE DATABASE example_db;
USE example_db;

-- Create a table for users
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert some data into the users table
INSERT INTO users (username, email) VALUES
('john_doe', 'john@example.com'),
('jane_smith', 'jane@example.com'),
('bob_jackson', 'bob@example.com');

-- Query all users
SELECT * FROM users;

-- Update a user's email
UPDATE users SET email = 'john.doe@example.com' WHERE username = 'john_doe';

-- Delete a user
DELETE FROM users WHERE username = 'bob_jackson';

-- Create a table for orders and establish a foreign key relationship
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    product_name VARCHAR(100),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Insert an order linked to a user
INSERT INTO orders (user_id, product_name) VALUES
(1, 'Product A'),
(2, 'Product B');

-- Query users and their orders using a JOIN
SELECT users.username, orders.product_name
FROM users
JOIN orders ON users.id = orders.user_id;

-- Create an index on the username column
CREATE INDEX idx_username ON users (username);

-- Start a transaction
START TRANSACTION;

-- Insert a new user and an order in a single transaction
INSERT INTO users (username, email) VALUES ('alice_smith', 'alice@example.com');
INSERT INTO orders (user_id, product_name) VALUES (LAST_INSERT_ID(), 'Product C');

-- Commit the transaction
COMMIT;

-- Create a stored procedure to get user's email by ID
DELIMITER //

CREATE PROCEDURE GetUserEmail(IN user_id INT)
BEGIN
    SELECT email FROM users WHERE id = user_id;
END //

DELIMITER ;

-- Call the stored procedure to get a user's email
CALL GetUserEmail(2);

-- Create a function to calculate the total orders for a user
DELIMITER //

CREATE FUNCTION TotalOrders(userId INT) RETURNS INT
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total FROM orders WHERE user_id = userId;
    RETURN total;
END //

DELIMITER ;

-- Call the function to get the total orders for a user
SELECT TotalOrders(1);

-- Create a trigger to log user deletions
DELIMITER //

CREATE TRIGGER log_user_deletion
BEFORE DELETE ON users
FOR EACH ROW
BEGIN
    INSERT INTO user_deletion_log (user_id, deleted_at)
    VALUES (OLD.id, NOW());
END //

DELIMITER ;

-- Create a view to see active users
CREATE VIEW active_users AS
SELECT * FROM users WHERE created_at > NOW() - INTERVAL 1 YEAR;

-- Query the active_users view
SELECT * FROM active_users;

-- Create a new MySQL user
CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'password';

-- Grant privileges to the new user
GRANT ALL PRIVILEGES ON example_db.* TO 'newuser'@'localhost';
FLUSH PRIVILEGES;

-- Drop the new user
DROP USER 'newuser'@'localhost';

-- Backup the database
mysqldump -u root -p example_db > example_db_backup.sql;

-- Restore the database (assuming example_db exists and is empty)
mysql -u root -p example_db < example_db_backup.sql;

-- Drop database if no longer needed
DROP DATABASE example_db;
