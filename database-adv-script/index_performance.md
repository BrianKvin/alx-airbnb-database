# 📊 Index Performance Evaluation

This document evaluates the performance improvements after adding indexes to the `User`, `Booking`, and `Property` tables. The goal is to reduce query cost and execution time for frequently used filters, joins, and lookups.

---

## 1. 🔍 Query: Fetch Bookings by User ID

### ➖ Before Adding Index
```sql
EXPLAIN ANALYZE SELECT * FROM Booking WHERE user_id = 123;

CREATE INDEX idx_booking_user_id ON Booking(user_id);
EXPLAIN ANALYZE SELECT * FROM Booking WHERE user_id = 123;

EXPLAIN ANALYZE SELECT * FROM Property WHERE location = 'Nairobi';

CREATE INDEX idx_property_location ON Property(location);
EXPLAIN ANALYZE SELECT * FROM Property WHERE location = 'Nairobi';

EXPLAIN ANALYZE SELECT * FROM Booking 
WHERE start_date >= '2025-06-01' AND end_date <= '2025-06-10';

CREATE INDEX idx_booking_date_range ON Booking(start_date, end_date);
EXPLAIN ANALYZE SELECT * FROM Booking 
WHERE start_date >= '2025-06-01' AND end_date <= '2025-06-10';
