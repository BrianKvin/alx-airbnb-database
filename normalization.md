Database Design
📋 Key Concepts

1. ### Entity-Relationship (ER) Diagrams

- Definition: ER Diagrams are visual representations of the entities (tables) in a database and their relationships. They help in understanding how data is organized and how different entities interact with each other.

- ## Components:

- **Entities**: Represent objects or concepts, e.g., Users, Payment, Booking.
- **Attributes**: Properties or details of entities, e.g., User ID, Payment Date, Price.
- **Relationships**: Connections between entities, e.g., a User makes an Booking, an Booking includes a Payment.

- ## How to Create:

- **Identify Entities**: Determine the main objects that need to be represented.
- **Define Attributes**: List the attributes for each entity.
- **Establish Relationships**: Define how entities are related to each other.
- **Draw the Diagram**: Use diagramming tools to visualize entities, attributes, and relationships.
- ER Diagrams provide a clear overview of the database structure, facilitate communication between stakeholders, and help in designing a coherent schema.

2. ### Normalization

- Definition: Normalization is the process of organizing data to reduce redundancy and improve data integrity. It involves dividing a database into two or more tables and defining relationships between them.
  Normalization Forms:

- **First Normal Form (1NF)**: Ensure each column contains atomic values, and each record is unique.
- **Second Normal Form (2NF)**: Achieve 1NF and ensure all non-key attributes are fully functionally dependent on the primary key.
- **Third Normal Form (3NF)**: Achieve 2NF and ensure all attributes are functionally dependent only on the primary key.

- ## How to Normalize:

- **Identify Functional Dependencies**: Determine which attributes are dependent on others.
- **Decompose Tables**: Break tables into smaller tables to remove redundancy.
- **Define Relationships**: Use foreign keys to maintain relationships between decomposed tables.
- **Importance**: Normalization reduces data redundancy, prevents anomalies, and ensures data consistency. It simplifies data maintenance and improves database performance.

3. ### Schema Design
   Definition: Schema design involves creating the database schema, which defines the structure of tables, columns, data types, and constraints. It serves as the blueprint for the database.
   Components:

- **Tables**: Define the structure of data storage.
- **Columns**: Specify data types and constraints for each table.
- **Primary Keys**: Uniquely identify each record in a table.
- **Foreign Keys**: Maintain relationships between tables.
- **Constraints**: Define rules for data integrity (e.g., NOT NULL, UNIQUE).

- ## How to Design a Schema:

- **Define Requirements**: Understand the data requirements and relationships.
- **Create Tables**: Design tables based on entities and attributes.
- **Set Data Types**: Choose appropriate data types for each column.
- **Establish Keys**: Define primary and foreign keys to enforce relationships.
- **Apply Constraints**: Implement constraints to ensure data integrity.

-**Importance**: A well-designed schema ensures efficient data storage, retrieval, and integrity. It provides a foundation for building and scaling applications effectively.

🧑‍💻 Practical Steps for Learners

- **Create ER Diagrams**: Start by identifying entities, attributes, and relationships. Use tools like Lucidchart, draw.io, or ERDPlus to draw diagrams.
- **Normalize Your Data**: Apply normalization principles to your database design to minimize redundancy and maintain data integrity.
- **Design a Schema**: Define tables, columns, and constraints based on your ER diagram and normalization process.
- **Review and Refine**: Continuously review your database design for optimization and make necessary adjustments.

## 🧱 Database Schema Overview

- Entities & Relationships

## User

-**Attributes**:

- user_id (PK),
- first_name,
- last_name,
- email (unique),
- password_hash,
- phone_number,
- role,
- created_at

- **Relationships**:
- One-to-many with Property (as host)
- One-to-many with Booking
- One-to-many with Review
- One-to-many with Message (as sender or recipient)

## Property

-**Attributes**:

- property_id (PK),
- host_id (FK → User),
- name, description,
- location,
- price_per_night,
- created_at,
- updated_at

- **Relationships**:
- One-to-many with Booking
- One-to-many with Review

## Booking

- **Attributes**:
- booking_id (PK),
- property_id (FK → Property),
- user_id (FK → User),
- start_date,
- end_date,
- total_price,
- status,
- created_at

- **Relationships**:
- One-to-one with Payment

## Payment

- **Attributes**:
- payment_id (PK),
- booking_id (FK → Booking),
- amount,
- payment_date,
- payment_method

- **Relationships**:
- Linked to Booking

## Review

- **Attributes**:
- review_id (PK),
- property_id (FK → Property),
- user_id (FK → User),
- rating,
- comment,
- created_at

- **Relationships**:
- Linked to Property and User

## Message

- **Attributes**:
- message_id (PK),
- sender_id (FK → User),
- recipient_id (FK → User),
- message_body,
- sent_at

- **Relationships**:
- Linked to User (sender and recipient)
