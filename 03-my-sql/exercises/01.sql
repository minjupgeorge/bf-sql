-- CREATE DATABASE
CREATE DATABASE DatabaseName;

-- USE DATABASE
USE DatabaseName;

-- SHOW DATABASES
SHOW DATABASES;

-- CREATE TABLE
CREATE TABLE TableName (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- INSERT INTO TABLE

INSERT INTO TableName (name, email) VALUES ('John Doe', 'john@gmail.com');

-- SELECT FROM TABLE

SELECT * FROM TableName;

-- UPDATE TABLE

UPDATE TableName SET name = 'Jane Doe' WHERE id = 1;

-- DELETE FROM TABLE

DELETE FROM TableName WHERE id = 1;

-- DROP TABLE

DROP TABLE TableName;


-- DROP DATABASE
DROP DATABASE DatabaseName;


-- MYSQL DATA TYPES AND CONSTRAINTS

-- CREATING A TABLE TO DEMONSTRATE VARIOUS DATA TYPES AND CONSTRAINTS
CREATE TABLE data_types_constraints (
    -- Numeric Data Types
    int_col INT,  -- Standard integer type
    tinyint_col TINYINT,  -- Integer with a smaller range
    smallint_col SMALLINT,  -- Integer with a medium range
    mediumint_col MEDIUMINT,  -- Integer with a medium-large range
    bigint_col BIGINT,  -- Integer with a large range
    float_col FLOAT,  -- Floating point number with single precision
    double_col DOUBLE,  -- Floating point number with double precision
    decimal_col DECIMAL(10, 2),  -- Fixed-point number

    -- String Data Types
    char_col CHAR(10),  -- Fixed-length string
    varchar_col VARCHAR(255),  -- Variable-length string
    text_col TEXT,  -- Large variable-length string
    tinytext_col TINYTEXT,  -- Small variable-length string
    mediumtext_col MEDIUMTEXT,  -- Medium variable-length string
    longtext_col LONGTEXT,  -- Very large variable-length string
    binary_col BINARY(10),  -- Fixed-length binary data
    varbinary_col VARBINARY(255),  -- Variable-length binary data
    blob_col BLOB,  -- Binary large object
    tinyblob_col TINYBLOB,  -- Small binary large object
    mediumblob_col MEDIUMBLOB,  -- Medium binary large object
    longblob_col LONGBLOB,  -- Very large binary large object

    -- Date and Time Data Types
    date_col DATE,  -- Date value
    datetime_col DATETIME,  -- Date and time value
    timestamp_col TIMESTAMP,  -- Timestamp value
    time_col TIME,  -- Time value
    year_col YEAR,  -- Year value

    -- JSON Data Type
    json_col JSON,  -- JSON data

    -- ENUM and SET Data Types
    enum_col ENUM('value1', 'value2', 'value3'),  -- Enumeration type
    set_col SET('value1', 'value2', 'value3'),  -- Set type

    -- Constraints
    primary_key_col INT PRIMARY KEY,  -- Primary key constraint
    unique_col INT UNIQUE,  -- Unique constraint
    not_null_col INT NOT NULL,  -- Not null constraint
    default_col INT DEFAULT 100,  -- Default value constraint
    check_col INT CHECK (check_col > 0),  -- Check constraint

    -- Foreign Key Constraint
    foreign_key_col INT,
    FOREIGN KEY (foreign_key_col) REFERENCES other_table(other_column)
);

-- CREATING ANOTHER TABLE FOR THE FOREIGN KEY EXAMPLE
CREATE TABLE other_table (
    other_column INT PRIMARY KEY
);

-- INSERTING DATA TO DEMONSTRATE CONSTRAINTS
-- UNCOMMENTING THE FOLLOWING LINES WILL LEAD TO CONSTRAINT VIOLATIONS
INSERT INTO data_types_constraints (
    int_col, tinyint_col, smallint_col, mediumint_col, bigint_col, 
    float_col, double_col, decimal_col, 
    char_col, varchar_col, text_col, tinytext_col, mediumtext_col, longtext_col, 
    binary_col, varbinary_col, blob_col, tinyblob_col, mediumblob_col, longblob_col, 
    date_col, datetime_col, timestamp_col, time_col, year_col, 
    json_col, enum_col, set_col, 
    primary_key_col, unique_col, not_null_col, default_col, check_col, foreign_key_col
) VALUES (
    1, 127, 32767, 8388607, 9223372036854775807, 
    1.23, 1.23, 12345.67, 
    'char_val', 'varchar_val', 'text_val', 'tinytext_val', 'mediumtext_val', 'longtext_val', 
    BINARY('binary_val'), VARBINARY('varbinary_val'), BLOB('blob_val'), TINYBLOB('tinyblob_val'), MEDIUMBLOB('mediumblob_val'), LONGBLOB('longblob_val'), 
    '2024-01-01', '2024-01-01 12:00:00', CURRENT_TIMESTAMP, '12:00:00', 2024, 
    JSON_OBJECT('key', 'value'), 'value1', 'value1,value2', 
    1, 2, 3, 4, 5, 1
);

-- Uncomment to violate UNIQUE constraint
-- INSERT INTO data_types_constraints (unique_col) VALUES (2);

-- Uncomment to violate NOT NULL constraint
-- INSERT INTO data_types_constraints (primary_key_col, not_null_col) VALUES (2, NULL);

-- Uncomment to violate CHECK constraint
-- INSERT INTO data_types_constraints (primary_key_col, check_col) VALUES (3, -1);

-- Uncomment to violate FOREIGN KEY constraint
-- INSERT INTO data_types_constraints (primary_key_col, foreign_key_col) VALUES (4, 999);
