

CREATE DATABASE library_management_system;
-- Create the Author table
CREATE TABLE Author (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(255)
);

-- Create the Book table
CREATE TABLE Book (
    id INT IDENTITY(1,1) PRIMARY KEY,
    title VARCHAR(255)
);

-- Create the Book_Author table to represent the many-to-many relationship
CREATE TABLE Book_Author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES Book(id),
    FOREIGN KEY (author_id) REFERENCES Author(id)
);


-- Create Category Table
CREATE TABLE category (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Create Book_Category Table (One-to-Many Relationship)
CREATE TABLE book_category (
    book_id INTEGER REFERENCES book(id),
    category_id INTEGER REFERENCES category(id),
    PRIMARY KEY (book_id, category_id)
);

-- Create Publisher Table
CREATE TABLE publisher (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Create Book_Copy Table
CREATE TABLE book_copy (
    id INT IDENTITY(1,1) PRIMARY KEY,
    year_published INTEGER NOT NULL,
    book_id INTEGER REFERENCES book(id),
    publisher_id INTEGER REFERENCES publisher(id)
);

-- Create Patron_Account Table
CREATE TABLE patron_account (
    card_number INT IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    surname VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    status VARCHAR(50) CHECK (status IN ('active', 'blocked'))
);

-- Checkout Table
CREATE TABLE checkout (
    id INT IDENTITY(1,1) PRIMARY KEY,
    start_time DATETIME NOT NULL,
    end_time DATETIME,
    book_copy_id INT REFERENCES book_copy(id),
    patron_account_id INT REFERENCES patron_account (card_number),
    is_returned BIT
);
-- Hold table 
CREATE TABLE hold (
    id INT IDENTITY(1,1) PRIMARY KEY,
    start_time DATETIME NOT NULL,
    end_time DATETIME,
    book_copy_id INT REFERENCES book_copy(id),
    patron_account_id INT REFERENCES patron_account(card_number)
);

-- Waiting List (Waitlist) Table
CREATE TABLE waitlist (
    patron_id INT REFERENCES patron_account(card_number),
    book_id INT REFERENCES book(id),
    PRIMARY KEY (patron_id, book_id)
);

-- Notifications Table
CREATE TABLE notifications (
    id INT IDENTITY(1,1) PRIMARY KEY,
    sent_at DATETIME NOT NULL,
    type VARCHAR(50) CHECK (type IN ('return_reminder', 'book_available')),
    patron_account_id INT REFERENCES patron_account(card_number)
);