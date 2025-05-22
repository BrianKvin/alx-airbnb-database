1. Identify High-Usage Columns
- User Table
- email (used for login or lookups)

- role (filtering by role)

- user_id (primary key and join column)

- Booking Table
- user_id (join with User)

- property_id (join with Property)

- status (filter by booking status)

- (start_date, end_date) (filter by date range)

- Property Table
- host_id (join with User)

- location (filter by property location)

- price_per_night (filter or sort by price)

-- 2. SQL: CREATE INDEX Commands (database_index.sql)

-- User table indexes
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_user_role ON User(role);

-- Booking table indexes
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_status ON Booking(status);
CREATE INDEX idx_booking_date_range ON Booking(start_date, end_date);

-- Property table indexes
CREATE INDEX idx_property_host_id ON Property(host_id);
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_price ON Property(price_per_night);

3. Measuring Query Performance
- EXPLAIN ANALYZE
- SELECT * FROM Booking WHERE user_id = 123;

- EXPLAIN ANALYZE
- SELECT * FROM Booking WHERE user_id = 123;

