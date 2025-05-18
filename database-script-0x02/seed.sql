-- Populate User table
INSERT INTO User (first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES 
('John', 'Smith', 'john.smith@email.com', '$2a$12$1tJP5Dgk9DGiVVy6q7PpI.XYaqfu9g3R6IYG9gQ9XJnhM1QqBDnSC', '555-123-4567', 'host', '2024-01-05 08:30:00'),
('Emily', 'Johnson', 'emily.j@email.com', '$2a$12$BGjLRuOz2mzxK.eAi9FUROVnR7J/xLNyHkB0fiyQIgbYO4AqYE.Hm', '555-234-5678', 'host', '2024-01-10 14:45:00'),
('Michael', 'Williams', 'mwilliams@email.com', '$2a$12$qbITJC8J7TW2OvpBXr4ZH.CQZcwgkE/lXO8wGgnPCnITcGqb/wVnW', '555-345-6789', 'guest', '2024-01-15 11:20:00'),
('Sarah', 'Brown', 'sarahb@email.com', '$2a$12$B0FjNyvTWVySxFfYUnIoY.xmLQmWx/JhPS9YadxQHlsNKHKCqTLVm', '555-456-7890', 'guest', '2024-01-20 16:15:00'),
('David', 'Jones', 'davidj@email.com', '$2a$12$3L1sYPs0LZifK/qbwFIf7OcS.UB3CZpqAJdQG3lyvfN4bkXdv9P8S', '555-567-8901', 'guest', '2024-02-01 09:45:00'),
('Jennifer', 'Garcia', 'jennyg@email.com', '$2a$12$wFB7hWC8Z7ByJ4q5H6UgC.P7Vew9FtHTmrNWzXQvFr3bVLUZcRQO2', '555-678-9012', 'host', '2024-02-10 13:30:00'),
('Robert', 'Miller', 'robm@email.com', '$2a$12$LF5qCNQwXRANf8CIV0OjD.ogAK.hwv9B8M9yl5ZsXjZpSa.BYfJE2', '555-789-0123', 'guest', '2024-02-15 10:00:00'),
('Lisa', 'Davis', 'lisad@email.com', '$2a$12$Wn9uRoX.HbQH3IFHmCVQb.uyZNaXMUbJN2eIpX5GzSxJ4sEkFGYnS', '555-890-1234', 'guest', '2024-03-01 15:20:00'),
('James', 'Rodriguez', 'jamesr@email.com', '$2a$12$ZhwVnrE2KN4M5HEKXsKMWuP4HHPqHxS.ufgDN5ZM7Jq2kP5gZvVGa', '555-901-2345', 'admin', '2024-03-05 08:45:00'),
('Michelle', 'Wilson', 'michellew@email.com', '$2a$12$Xr9cPYo1nRXZbZHNJfknUuTe0pHxAEuEPXLxDNIRHpTCgLNXc4OPu', '555-012-3456', 'host', '2024-03-10 11:30:00');

-- Populate Property table
INSERT INTO Property (host_id, name, description, location, price_per_night, created_at, updated_at)
VALUES 
(1, 'Seaside Villa', 'Beautiful villa with ocean views and private beach access', 'Malibu, CA', 350.00, '2024-01-08 10:15:00', '2024-01-08 10:15:00'),
(1, 'Downtown Loft', 'Modern loft in the heart of downtown with city views', 'Los Angeles, CA', 175.00, '2024-01-12 09:30:00', '2024-03-05 14:20:00'),
(2, 'Mountain Cabin', 'Cozy cabin with stunning mountain views', 'Aspen, CO', 225.00, '2024-01-18 13:45:00', '2024-01-18 13:45:00'),
(2, 'Lakefront Cottage', 'Peaceful cottage on the lake with private dock', 'Lake Tahoe, NV', 195.00, '2024-01-25 11:00:00', '2024-02-10 08:45:00'),
(6, 'Urban Apartment', 'Stylish apartment in a trendy neighborhood', 'San Francisco, CA', 180.00, '2024-02-15 16:20:00', '2024-02-15 16:20:00'),
(6, 'Historic Townhouse', 'Renovated townhouse with original features', 'Boston, MA', 210.00, '2024-02-20 14:30:00', '2024-03-12 09:15:00'),
(10, 'Desert Oasis', 'Modern house with pool and desert views', 'Scottsdale, AZ', 265.00, '2024-03-15 12:00:00', '2024-03-15 12:00:00'),
(10, 'Beach Bungalow', 'Charming bungalow steps from the beach', 'Miami Beach, FL', 230.00, '2024-03-20 10:45:00', '2024-03-20 10:45:00'),
(1, 'Country Farmhouse', 'Renovated farmhouse on 5 acres with barn', 'Hudson Valley, NY', 245.00, '2024-04-01 09:00:00', '2024-04-15 11:30:00'),
(2, 'City Penthouse', 'Luxury penthouse with panoramic city views', 'Chicago, IL', 320.00, '2024-04-10 15:45:00', '2024-04-10 15:45:00');

-- Populate Booking table
INSERT INTO Booking (property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES 
(1, 3, '2024-02-10', '2024-02-15', 1750.00, 'completed', '2024-01-20 08:30:00'),
(3, 4, '2024-02-20', '2024-02-25', 1125.00, 'completed', '2024-01-25 14:15:00'),
(2, 5, '2024-03-05', '2024-03-10', 875.00, 'completed', '2024-02-10 16:45:00'),
(4, 7, '2024-03-15', '2024-03-20', 975.00, 'completed', '2024-02-20 09:30:00'),
(5, 8, '2024-04-01', '2024-04-05', 720.00, 'completed', '2024-03-01 11:00:00'),
(6, 3, '2024-04-10', '2024-04-15', 1050.00, 'completed', '2024-03-15 13:20:00'),
(7, 4, '2024-04-20', '2024-04-25', 1325.00, 'completed', '2024-03-25 10:45:00'),
(8, 5, '2024-05-01', '2024-05-06', 1150.00, 'completed', '2024-04-01 15:30:00'),
(9, 7, '2024-05-10', '2024-05-15', 1225.00, 'confirmed', '2024-04-10 12:15:00'),
(10, 8, '2024-05-20', '2024-05-25', 1600.00, 'confirmed', '2024-04-15 14:00:00'),
(1, 5, '2024-06-01', '2024-06-06', 1750.00, 'confirmed', '2024-05-01 09:45:00'),
(2, 7, '2024-06-10', '2024-06-15', 875.00, 'confirmed', '2024-05-05 11:30:00'),
(3, 8, '2024-06-20', '2024-06-25', 1125.00, 'pending', '2024-05-10 16:15:00'),
(4, 3, '2024-07-01', '2024-07-06', 975.00, 'pending', '2024-05-15 08:00:00');

-- Populate Payment table
INSERT INTO Payment (booking_id, amount, payment_date, payment_method)
VALUES 
(1, 1750.00, '2024-01-20 08:45:00', 'credit_card'),
(2, 1125.00, '2024-01-25 14:30:00', 'paypal'),
(3, 875.00, '2024-02-10 17:00:00', 'credit_card'),
(4, 975.00, '2024-02-20 09:45:00', 'debit_card'),
(5, 720.00, '2024-03-01 11:15:00', 'paypal'),
(6, 1050.00, '2024-03-15 13:35:00', 'credit_card'),
(7, 1325.00, '2024-03-25 11:00:00', 'bank_transfer'),
(8, 1150.00, '2024-04-01 15:45:00', 'credit_card'),
(9, 1225.00, '2024-04-10 12:30:00', 'paypal'),
(10, 1600.00, '2024-04-15 14:15:00', 'credit_card'),
(11, 1750.00, '2024-05-01 10:00:00', 'debit_card'),
(12, 875.00, '2024-05-05 11:45:00', 'paypal');

-- Populate Review table
INSERT INTO Review (property_id, user_id, rating, comment, created_at)
VALUES 
(1, 3, 5, 'Amazing property with breathtaking views! The private beach access was perfect for our family vacation.', '2024-02-16 10:30:00'),
(3, 4, 4, 'Cozy cabin with great mountain views. Kitchen was well-equipped and the fireplace was wonderful.', '2024-02-26 14:00:00'),
(2, 5, 4, 'Stylish loft with convenient location. A bit noisy at night due to downtown location but overall great stay.', '2024-03-11 09:15:00'),
(4, 7, 5, 'Perfect lakefront getaway! We loved the private dock and spent most evenings watching the sunset from the porch.', '2024-03-21 16:45:00'),
(5, 8, 3, 'Good location but apartment was smaller than expected. Cleanliness could have been better.', '2024-04-06 11:30:00'),
(6, 3, 5, 'Beautiful historic property with modern amenities. Walking distance to great restaurants and attractions.', '2024-04-16 13:00:00'),
(7, 4, 4, 'Lovely desert retreat! The pool was refreshing and the house had everything we needed.', '2024-04-26 15:15:00'),
(8, 5, 5, 'Perfect beach vacation! Bungalow was steps from the beach as advertised and very comfortable.', '2024-05-07 12:30:00');

-- Populate Message table
INSERT INTO Message (sender_id, recipient_id, message_body, sent_at, is_read)
VALUES 
(3, 1, 'Hi, I have a question about your Seaside Villa property. Is early check-in available?', '2024-01-15 09:00:00', TRUE),
(1, 3, 'Hello! Yes, early check-in is available if the property isn''t occupied the night before. Let me know what time you''d like to arrive.', '2024-01-15 10:30:00', TRUE),
(3, 1, 'Great! We''d like to arrive around 11 AM if possible.', '2024-01-15 11:15:00', TRUE),
(1, 3, 'That should work perfectly. I''ll make a note of it for your reservation.', '2024-01-15 13:00:00', TRUE),
(4, 2, 'Is the Mountain Cabin pet-friendly? We''d like to bring our small dog.', '2024-01-20 14:45:00', TRUE),
(2, 4, 'I''m sorry, but we don''t allow pets at the Mountain Cabin due to allergies.', '2024-01-20 16:30:00', TRUE),
(5, 1, 'Does the Downtown Loft have parking available?', '2024-02-01 08:15:00', TRUE),
(1, 5, 'Yes, there''s one dedicated parking spot in the garage below the building included with your stay.', '2024-02-01 09:45:00', TRUE),
(7, 2, 'Hi! Is there boat rental available near the Lakefront Cottage?', '2024-02-15 11:00:00', TRUE),
(2, 7, 'Yes! There''s a boat rental place just 5 minutes away. I can provide you with their contact information.', '2024-02-15 13:30:00', TRUE),
(8, 6, 'Is there a grocery store within walking distance from the Urban Apartment?', '2024-03-10 10:15:00', TRUE),
(6, 8, 'Yes, there''s a small grocery store just 2 blocks away and a larger supermarket about 5 blocks away.', '2024-03-10 11:30:00', TRUE),
(3, 6, 'What''s the WiFi speed like at the Historic Townhouse?', '2024-03-25 15:00:00', TRUE),
(6, 3, 'We have high-speed fiber internet with speeds of 500Mbps download and upload.', '2024-03-25 16:45:00', TRUE),
(4, 10, 'Is the pool at the Desert Oasis heated?', '2024-04-05 09:30:00', TRUE),
(10, 4, 'Yes, the pool is heated and can be adjusted to your preferred temperature.', '2024-04-05 10:45:00', TRUE),
(5, 10, 'How far is the Beach Bungalow from the nearest restaurant?', '2024-04-20 13:15:00', TRUE),
(10, 5, 'There are several restaurants within a 5-10 minute walk. I can provide recommendations based on your food preferences!', '2024-04-20 14:30:00', TRUE),
(7, 1, 'Do you have recommendations for hiking trails near the Country Farmhouse?', '2024-05-02 10:00:00', FALSE),
(5, 2, 'Is there a gym in the building where the City Penthouse is located?', '2024-05-10 11:45:00', FALSE);