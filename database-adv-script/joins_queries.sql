-- Inner join bookings
SELECT 
    Booking.booking_id,
    Booking.property_id,
    Booking.start_date,
    Booking.end_date,
    Booking.total_price,
    User.user_id,
    User.first_name,
    User.last_name,
    User.email
FROM 
    Booking
INNER JOIN 
    User ON Booking.user_id = User.user_id;

-- Left JOin, property and reviews
SELECT 
    Property.property_id,
    Property.name,
    Property.location,
    Review.review_id,
    Review.rating,
    Review.comment,
    Review.created_at
FROM 
    Property
LEFT JOIN 
    Review ON Property.property_id = Review.property_id
ORDER BY 
    Property.property_id ASC;


-- Full outer join - users and booking
SELECT 
    User.user_id,
    User.first_name,
    Booking.booking_id,
    Booking.property_id,
    Booking.start_date
FROM 
    User
FULL OUTER JOIN 
    Booking ON User.user_id = Booking.user_id;


-- Simulating FULL OUTER JOIN with UNION in MySQL
SELECT 
    User.user_id,
    User.first_name,
    Booking.booking_id,
    Booking.property_id,
    Booking.start_date
FROM 
    User
LEFT JOIN 
    Booking ON User.user_id = Booking.user_id

UNION

SELECT 
    User.user_id,
    User.first_name,
    Booking.booking_id,
    Booking.property_id,
    Booking.start_date
FROM 
    User
RIGHT JOIN 
    Booking ON User.user_id = Booking.user_id;

