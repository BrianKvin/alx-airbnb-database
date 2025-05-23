-- File: database_index.sql
-- Composite index on Booking for user_id and status to optimize queries filtering by user and booking status
CREATE INDEX idx_booking_user_status ON Booking (user_id, status);

-- Index on Property for name to optimize text-based searches
CREATE INDEX idx_property_name ON Property (name);

-- Index on User for email to optimize email-based searches
CREATE INDEX idx_user_email ON User (email);

# Index Performance Report

## Introduction
This report identifies high-usage columns in the `User`, `Booking`, and `Property` tables, creates indexes to optimize query performance, and compares performance before and after using `EXPLAIN`. The primary focus is on optimizing a query that counts bookings per user for a specific status.

## High-Usage Columns
- **User**: `user_id` (joins), `email` (searches), `role` (filtering).
- **Property**: `property_id` (joins), `host_id` (joins), `location` (searches), `name` (searches).
- **Booking**: `user_id`, `property_id` (joins), `status` (filtering), `start_date`, `end_date` (range queries).
- **Indexes Created**:
  - `idx_booking_user_status` on `Booking(user_id, status)`: Optimizes queries filtering by user and status.
  - `idx_property_name` on `Property(name)`: Optimizes text-based property searches.
  - `idx_user_email` on `User(email)`: Optimizes email-based user lookups.

## Query Tested
```sql
SELECT 
    user_id, 
    COUNT(*) AS booking_count
FROM 
    Booking
WHERE 
    status = 'confirmed'
GROUP BY 
    user_id;


## Output
| id | select_type | table  | partitions | type | possible_keys | key       | key_len | ref   | rows | filtered | Extra       |
|----|-------------|--------|------------|------|---------------|-----------|---------|-------|------|----------|-------------|
| 1  | SIMPLE      | Booking| NULL       | ref  | idx_status    | idx_status| 1       | const | 5000 | 100.00   | Using where |

# Before index
- Explain output
EXPLAIN SELECT user_id, COUNT(*) AS booking_count
FROM Booking
WHERE status = 'confirmed'
GROUP BY user_id;

# Output
| id | select_type | table  | partitions | type | possible_keys | key       | key_len | ref   | rows | filtered | Extra       |
|----|-------------|--------|------------|------|---------------|-----------|---------|-------|------|----------|-------------|
| 1  | SIMPLE      | Booking| NULL       | ref  | idx_status    | idx_status| 1       | const | 5000 | 100.00   | Using where |

# Index added
CREATE INDEX idx_booking_user_status ON Booking (user_id, status);

# After index
# Explain and output
EXPLAIN SELECT user_id, COUNT(*) AS booking_count
FROM Booking
WHERE status = 'confirmed'
GROUP BY user_id;

# Output
| id | select_type | table  | partitions | type | possible_keys         | key                  | key_len | ref   | rows | filtered | Extra       |
|----|-------------|--------|------------|------|----------------------|----------------------|---------|-------|------|----------|-------------|
| 1  | SIMPLE      | Booking| NULL       | ref  | idx_booking_user_status | idx_booking_user_status | 5       | const | 1000 | 100.00   | Using index |

# Before index
EXPLAIN SELECT user_id, COUNT(*) AS booking_count
FROM Booking
WHERE status = 'confirmed'
GROUP BY user_id;

# Output
EXPLAIN SELECT user_id, COUNT(*) AS booking_count
FROM Booking
WHERE status = 'confirmed'
GROUP BY user_id;

# Index added
CREATE INDEX idx_booking_user_status ON Booking (user_id, status);

# After index
EXPLAIN SELECT user_id, COUNT(*) AS booking_count
FROM Booking
WHERE status = 'confirmed'
GROUP BY user_id;

# Output
| id | select_type | table  | partitions | type | possible_keys         | key                  | key_len | ref   | rows | filtered | Extra       |
|----|-------------|--------|------------|------|----------------------|----------------------|---------|-------|------|----------|-------------|
| 1  | SIMPLE      | Booking| NULL       | ref  | idx_booking_user_status | idx_booking_user_status | 5       | const | 1000 | 100.00   | Using index |