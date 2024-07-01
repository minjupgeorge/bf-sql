# SQL (Structured Query Language)

## Overview

SQL (Structured Query Language) is a standardized programming language used for managing and manipulating relational databases. It is widely used in various applications, from simple data retrieval to complex data manipulation and database management. SQL is essential for developers, database administrators, and analysts who work with databases to store, retrieve, and manipulate data efficiently.

## Introduction to SQL

SQL is a domain-specific language designed for managing and querying data held in a relational database management system (RDBMS). Some of the most popular RDBMSs include MySQL, PostgreSQL, SQLite, Oracle Database, and Microsoft SQL Server.

### Key Features

- **Data Definition Language (DDL):** Used to define database schemas, including creating, altering, and dropping tables and other database objects.
- **Data Manipulation Language (DML):** Used for querying and updating data, including inserting, updating, deleting, and selecting records.
- **Data Control Language (DCL):** Used to control access to data within the database, including granting and revoking permissions.
- **Transaction Control Language (TCL):** Used to manage transactions within the database, including committing and rolling back transactions.

## SQL Basics

### Data Definition Language (DDL)

- **CREATE TABLE:** Defines a new table and its columns.
- **ALTER TABLE:** Modifies an existing table structure.
- **DROP TABLE:** Deletes a table from the database.

### Data Manipulation Language (DML)

- **SELECT:** Retrieves data from one or more tables.
- **INSERT:** Adds new rows of data to a table.
- **UPDATE:** Modifies existing data in a table.
- **DELETE:** Removes rows of data from a table.

### Data Control Language (DCL)

- **GRANT:** Gives a user access privileges to the database.
- **REVOKE:** Removes access privileges from a user.

### Transaction Control Language (TCL)

- **COMMIT:** Saves all changes made during the current transaction.
- **ROLLBACK:** Undoes all changes made during the current transaction.
- **SAVEPOINT:** Sets a point within a transaction to which you can later roll back.

## Advanced SQL

### Joins

Joins are used to combine rows from two or more tables based on a related column between them.

- **INNER JOIN:** Returns records with matching values in both tables.
- **LEFT (OUTER) JOIN:** Returns all records from the left table and matched records from the right table.
- **RIGHT (OUTER) JOIN:** Returns all records from the right table and matched records from the left table.
- **FULL (OUTER) JOIN:** Returns records when there is a match in one of the tables.

### Subqueries

A subquery is a query nested inside another query.

### Indexes

Indexes are used to speed up the retrieval of rows by using pointers. They can be created on one or more columns of a table.

### Views

A view is a virtual table based on the result of a SELECT query. It provides a way to simplify complex queries, enhance security, and improve readability.

## SQL Examples

### Creating a Table

```sql
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    hire_date DATE,
    salary DECIMAL(10, 2)
);
```

### Inserting Data

```sql
INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, salary)
VALUES (1, 'John', 'Doe', 'john.doe@example.com', '2020-01-15', 60000.00);
```

### Selecting Data

```sql
SELECT first_name, last_name, email
FROM employees
WHERE salary > 50000;
```

### Updating Data

```sql
UPDATE employees
SET salary = 65000.00
WHERE employee_id = 1;
```

### Deleting Data

```sql
DELETE FROM employees
WHERE employee_id = 1;
```

### Joining Tables

```sql
SELECT employees.first_name, employees.last_name, departments.department_name
FROM employees
INNER JOIN departments ON employees.department_id = departments.department_id;
```

### Creating an Index

```sql
CREATE INDEX idx_last_name ON employees (last_name);
```

### Creating a View

```sql
CREATE VIEW high_salary_employees AS
SELECT first_name, last_name, salary
FROM employees
WHERE salary > 70000;
```

## Best Practices

- **Use Descriptive Names:** Use clear, descriptive names for tables, columns, indexes, and other database objects.
- **Normalize Data:** Organize data to reduce redundancy and improve integrity.
- **Optimize Queries:** Use indexes, avoid unnecessary columns in SELECT statements, and write efficient join conditions.
- **Backup Regularly:** Regularly backup your database to prevent data loss.
- **Secure Your Database:** Use strong passwords, limit user privileges, and encrypt sensitive data.

## Resources

- **Books:**

  - _SQL in 10 Minutes, Sams Teach Yourself_ by Ben Forta
  - _Learning SQL_ by Alan Beaulieu
  - _SQL Cookbook_ by Anthony Molinaro

- **Online Courses:**

  - [Coursera SQL for Data Science](https://www.coursera.org/learn/sql-for-data-science)
  - [edX Databases: Advanced Topics in SQL](https://www.edx.org/course/databases-advanced-topics-in-sql)

- **Websites:**
  - [W3Schools SQL Tutorial](https://www.w3schools.com/sql/)
  - [SQLBolt](https://sqlbolt.com/)
