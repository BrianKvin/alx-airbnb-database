## Partitioning Large Tables
-- Drop existing Booking table (if needed, backup data first)
DROP TABLE IF EXISTS Booking;

-- Create partitioned Booking table
CREATE TABLE Booking (
    booking_id INT AUTO_INCREMENT,
    property_id INT NOT NULL,
    user_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status ENUM('pending', 'confirmed', 'cancelled', 'completed') NOT NULL DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (booking_id, start_date),
    FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE,
    CHECK (end_date > start_date),
    INDEX idx_property_id (property_id),
    INDEX idx_user_id (user_id),
    INDEX idx_status (status)
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION p2025 VALUES LESS THAN (2026),
    PARTITION p_future VALUES LESS THAN MAXVALUE
);


-- test query
SELECT * 
FROM Booking 
WHERE start_date BETWEEN '2025-01-01' AND '2025-12-31';

-- performance
EXPLAIN SELECT * 
FROM Booking 
WHERE start_date BETWEEN '2025-01-01' AND '2025-12-31';

-- Report
# Partition Performance Report

## Partitioning Strategy
- Table: `Booking`
- Partition Key: `YEAR(start_date)`
- Partitions: `p2023 (<2024)`, `p2024 (<2025)`, `p2025 (<2026)`, `p_future (MAXVALUE)`

## Test Query
```sql
SELECT * 
FROM Booking 
WHERE start_date BETWEEN '2025-01-01' AND '2025-12-31';