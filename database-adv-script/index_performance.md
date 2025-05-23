## Craete indexes
-- File: database_index.sql
-- Create a composite index on Booking for user_id and status
CREATE INDEX idx_user_status ON Booking (user_id, status);

-- Create an index on Property for name (for partial text searches)
CREATE INDEX idx_property_name ON Property (name);

## Measure Performance
SELECT user_id, COUNT(*) as booking_count
FROM Booking
WHERE status = 'confirmed'
GROUP BY user_id;

## Before Index
EXPLAIN SELECT user_id, COUNT(*) as booking_count
FROM Booking
WHERE status = 'confirmed'
GROUP BY user_id;

## After Index
EXPLAIN SELECT user_id, COUNT(*) as booking_count
FROM Booking
WHERE status = 'confirmed'
GROUP BY user_id;

## Report (index_performance.md)
# Index Performance Report

## Query Tested
```sql
SELECT user_id, COUNT(*) as booking_count
FROM Booking
WHERE status = 'confirmed'
GROUP BY user_id;