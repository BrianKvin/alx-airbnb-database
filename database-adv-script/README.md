- ### AirBnB Clone
- Write a query using an INNER JOIN to retrieve all bookings and the respective users who made those bookings.

- Write a query using aLEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews.

- Write a query using a FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.


# 📘 Advanced SQL: Complex Queries, Indexing, and Optimization

Welcome to **Advanced SQL**, a guide focused on enhancing your skills in complex queries, indexing, and performance optimization. Mastering these techniques will help you write efficient queries, improve database performance, and handle large datasets effectively.

---

## 🧠 Key Concepts

### 1. Complex Queries

**Definition:** Complex queries involve multiple operations—such as joins, subqueries, and aggregations—to retrieve and manipulate data across one or more tables.

#### 🔗 Types of Complex Queries

- **Joins:** Combine rows from two or more tables based on related columns.
  - `INNER JOIN`: Returns only matching rows in both tables.
  - `LEFT JOIN`: Returns all rows from the left table, and matched rows from the right table.
  - `RIGHT JOIN`: Returns all rows from the right table, and matched rows from the left table.
  - `FULL OUTER JOIN`: Returns all rows when there is a match in either table.

- **Subqueries:** A query nested within another SQL query.
  - **Correlated Subquery:** References a column from the outer query.
  - **Non-Correlated Subquery:** Executes independently from the outer query.

- **Aggregations:** Use functions like `COUNT`, `SUM`, `AVG`, `MAX`, `MIN` to summarize data.

- **Window Functions:** Perform calculations across a set of table rows related to the current row.
  - Examples: `ROW_NUMBER()`, `RANK()`, `PARTITION BY`.

#### 🛠 How to Write Complex Queries

- Understand the data structure and relationships.
- Break the problem into manageable parts (e.g., subqueries or joins).
- Use aliases and Common Table Expressions (CTEs) for clarity.
- Test, refine, and optimize step-by-step.

> Complex queries enable powerful data analysis and customized reporting.

---

### 2. Indexing

**Definition:** Indexes are data structures that improve the speed of data retrieval by providing fast access paths to rows.

#### 📚 Types of Indexes

- **Primary Index:** Automatically created for primary key columns.
- **Unique Index:** Ensures indexed columns have unique values.
- **Composite Index:** Index built on multiple columns.
- **Full-Text Index:** Supports efficient search in large text fields.
- **Clustered Index:** Data rows are sorted and stored based on key values.
- **Non-Clustered Index:** Separate structure that points to actual data rows.

#### 🛠 How to Use Indexing

- Identify columns frequently used in `WHERE`, `JOIN`, `ORDER BY`.
- Create indexes using `CREATE INDEX`.
- Monitor performance with tools like:
  - `EXPLAIN`, `SHOW PROFILE`
  - SolarWinds Database Performance Analyzer
  - New Relic

> ⚖️ Avoid over-indexing—it can slow down `INSERT`, `UPDATE`, and `DELETE` operations.

---

### 3. Optimization

**Definition:** Optimization means modifying SQL queries to minimize execution time and resource usage.

#### 🚀 Optimization Techniques

- **Query Refactoring:** Simplify complex queries.
- **Use of Indexes:** Ensure the right indexes are in place.
- **Execution Plans:** Analyze using `EXPLAIN` or `ANALYZE`.
- **Wildcard Use:** Avoid starting `LIKE` patterns with `%`.
- **Partitioning:** Split large tables for better access.
- **Limiting Results:** Use `LIMIT` or `TOP` to reduce row count.
- **Denormalization:** (When appropriate) for read-heavy systems.

#### 🔍 How to Optimize Queries

- Analyze performance with query execution plans.
- Refactor slow or complex queries.
- Tune the database schema—indexing, partitioning, and structure.
- Continuously monitor and iterate for performance improvements.

> Optimization is critical as your data and user base grow.

---

## 👨‍💻 Practical Steps for Learners

1. **Practice Complex Queries:** Start with joins, subqueries, and aggregations on sample datasets.
2. **Apply Indexing:** Identify key columns and test performance improvements.
3. **Optimize Regularly:** Profile and fine-tune queries and schema.
4. **Use the Right Tools:** SQL profilers, performance dashboards, and execution plans are essential.

---

## 📚 Additional Resources

- [🧩 How to Design Database Schema (Miro)](https://miro.com/diagramming/how-to-design-database-schema/)
- [📖 Understanding Database Performance (Medium)](https://kalemaedgar.medium.com/understanding-database-performance-a-guide-to-optimization-0188a4a1666c)
- [🔧 Tools & Methods for Performance Monitoring (LinkedIn)](https://www.linkedin.com/advice/3/what-best-tools-methods-database-performance-monitoring)

---


