# Library Management System

This project involves the creation of a database schema for a library management system, allowing users to manage books, authors, categories, publishers, patron accounts, checkouts, holds, waitlists, and notifications.

## Database Schema

The database schema includes the following tables:

1. **Author:** Stores information about authors.
2. **Book:** Stores information about books.
3. **Book_Author:** Represents the many-to-many relationship between books and authors.
4. **Category:** Stores categories of books.
5. **Book_Category:** Represents the one-to-many relationship between books and categories.
6. **Publisher:** Stores information about publishers.
7. **Book_Copy:** Stores information about copies of books.
8. **Patron_Account:** Stores information about patron accounts.
9. **Checkout:** Tracks book checkouts by patrons.
10. **Hold:** Tracks book holds by patrons.
11. **Waitlist:** Tracks patrons' waitlists for books.
12. **Notifications:** Stores notifications sent to patrons.

## Tables and Relationships

- The **Book** table is related to the **Author** table through the **Book_Author** table, representing a many-to-many relationship.
- The **Book** table is related to the **Category** table through the **Book_Category** table, representing a one-to-many relationship.
- The **Book_Copy** table is related to the **Book** table and the **Publisher** table.
- The **Checkout** table tracks book checkouts by patrons, while the **Hold** table tracks book holds.
- The **Waitlist** table tracks patrons' waitlists for books.
- The **Notifications** table stores notifications sent to patrons.

## Usage

This database schema can be used to build a library management system where users can manage books, authors, categories, publishers, patron accounts, and track book checkouts, holds, waitlists, and notifications.


