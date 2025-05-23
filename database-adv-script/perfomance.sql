-- initial query that retrieves all bookings along with the user details, property details, and payment details
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    p.price_per_night,
    pay.payment_id,
    pay.amount,
    pay.payment_method,
    pay.payment_date
FROM 
    Booking b
INNER JOIN 
    User u ON b.user_id = u.user_id
INNER JOIN 
    Property p ON b.property_id = p.property_id
LEFT JOIN 
    Payment pay ON b.booking_id = pay.booking_id
WHERE 
    b.status = 'confirmed';

-- Analyze performance # Possible full table scan on Booking if start_date and status aren't optimally indexed together.

EXPLAIN SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    p.price_per_night,
    pay.payment_id,
    pay.amount,
    pay.payment_method,
    pay.payment_date
FROM 
    Booking b
INNER JOIN 
    User u ON b.user_id = u.user_id
INNER JOIN 
    Property p ON b.property_id = p.property_id
LEFT JOIN 
    Payment pay ON b.booking_id = pay.booking_id
WHERE 
    b.status = 'confirmed';

+----+-------------+-------+------------+--------+-----------------+---------------+---------+----------------------+------+----------+-------------+
| id | select_type | table | partitions | type   | possible_keys   | key           | key_len | ref                  | rows | filtered | Extra       |
+----+-------------+-------+------------+--------+-----------------+---------------+---------+----------------------+------+----------+-------------+
|  1 | SIMPLE      | b     | NULL       | ref    | idx_status      | idx_status    | 1       | const                | 1000 |   100.00 | Using where |
|  1 | SIMPLE      | u     | NULL       | eq_ref | PRIMARY,idx_user_id | PRIMARY   | 4       | b.user_id            |    1 |   100.00 | NULL        |
|  1 | SIMPLE      | p     | NULL       | eq_ref | PRIMARY         | PRIMARY       | 4       | b.property_id        |    1 |   100.00 | NULL        |
|  1 | SIMPLE      | pay   | NULL       | eq_ref | idx_booking_id  | idx_booking_id| 4       | b.booking_id         |    1 |   100.00 | NULL        |
+----+-------------+-------+------------+--------+-----------------+---------------+---------+----------------------+------+----------+-------------+

-- Optimized query

-- Add a composite index to optimize the query
CREATE INDEX idx_booking_status_covering ON Booking (status, booking_id, user_id, property_id, start_date, end_date, total_price);

-- Optimized query
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    p.price_per_night,
    pay.payment_id,
    pay.amount,
    pay.payment_method,
    pay.payment_date
FROM 
    Booking b
INNER JOIN 
    User u ON b.user_id = u.user_id
INNER JOIN 
    Property p ON b.property_id = p.property_id
LEFT JOIN 
    Payment pay ON b.booking_id = pay.booking_id
WHERE 
    b.status = 'confirmed'
    AND b.start_date >= '2025-01-01'
ORDER BY 
    b.start_date;

# Query Optimization Report

## Initial Query
```sql
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.first_name,
    u.last_name,
    p.name AS property_name,
    p.location,
    pay.amount,
    pay.payment_method
FROM 
    Booking b
INNER JOIN 
    User u ON b.user_id = u.user_id
INNER JOIN 
    Property p ON b.property_id = p.property_id
LEFT JOIN 
    Payment pay ON b.booking_id = pay.booking_id
WHERE 
    b.status = 'confirmed'
    AND b.start_date >= '2025-01-01';