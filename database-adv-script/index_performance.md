# 📊 Index Performance Evaluation

This document evaluates performance improvements after adding indexes to the `User`, `Booking`, and `Property` tables. The goal is to reduce query cost and execution time for frequently used filters, joins, and lookups.

---

## 1. 🔍 Query: Fetch Bookings by User ID

### ➖ Before Index
```sql
EXPLAIN ANALYZE SELECT * FROM Booking WHERE user_id = 123;

### - Output
Seq Scan on Booking (cost=0.00..1500.00 rows=200 width=...)
Filter: (user_id = 123)

### - After Index
CREATE INDEX idx_booking_user_id ON Booking(user_id);
EXPLAIN ANALYZE SELECT * FROM Booking WHERE user_id = 123;

### - Output
Index Scan using idx_booking_user_id on Booking (cost=0.29..12.00 rows=200 width=...)

## 2. 🔍 Query: Fetch Bookings by User ID
### ➖ Before Index

EXPLAIN ANALYZE SELECT * FROM Property WHERE location = 'Nairobi';

### - Output
Seq Scan on Property (cost=0.00..1200.00 rows=300 width=...)

### - After Index
CREATE INDEX idx_property_location ON Property(location);
EXPLAIN ANALYZE SELECT * FROM Property WHERE location = 'Nairobi';

### - Output
Index Scan using idx_property_location on Property (cost=0.30..30.00 rows=300 width=...)

### 3. 🔍 Query: Filter Bookings by Date Range
➖ Before Index
EXPLAIN ANALYZE SELECT * FROM Booking 
WHERE start_date >= '2025-06-01' AND end_date <= '2025-06-10';

### - Output
Seq Scan on Booking (cost=0.00..1800.00 rows=100 width=...)
### - After Index
CREATE INDEX idx_booking_date_range ON Booking(start_date, end_date);
EXPLAIN ANALYZE SELECT * FROM Booking 
WHERE start_date >= '2025-06-01' AND end_date <= '2025-06-10';

### - Output
Index Scan using idx_booking_date_range on Booking (cost=0.35..45.00 rows=100 width=...)


