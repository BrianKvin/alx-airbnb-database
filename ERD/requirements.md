#### Airbnb Clone Backend

### Define relationships:
- **One-to-many**:
- User ↔ Property
- User ↔ Booking
- Property ↔ Booking
- Booking ↔ Payment
- Property ↔ Review
- User ↔ Review
- User ↔ Message (sender/recipient)

### Core Features
1. User Management
- **Registration**: Guests or hosts register with secure password hashing.
- **Login**: Email/password or OAuth (Google, Facebook).
- **Authentication**: JWT-based session management.
- **Profile Management**: Update name, photo, contact, and preferences.

2. Property Listings
- **Hosts can**:
- Add properties with title, description, location, price, amenities, and availability.
- Edit or delete existing listings.

3. Search & Filtering
- **Search by**:
- Location
- Price range
- Guest capacity
- Amenities (Wi-Fi, pool, pet-friendly, etc.)
- Pagination for large result sets

4. Booking Management
**Guests can**:
- Book properties for specific dates.
- Cancel bookings under policy rules.
- Booking Status: Pending, confirmed, canceled, completed.

5. Payment Integration
- Supported Platforms: Stripe, PayPal, Credit Cards.
- Upfront guest payment and host payouts.
- Multiple currency support.

6. Reviews and Ratings
- Guests can review properties.
- Hosts can respond to reviews.
- Reviews linked to verified bookings only.

7. Notifications System
- Email and in-app notifications for:
- Booking confirmation
- Cancellations
- Payment events

8. Admin Dashboard
**Admins can manage**:
- Users
- Listings
- Bookings
- Payments

### Technical Requirements
## Database
- **Type: Relational (PostgreSQL or MySQL)**
- Core Tables:
- Users
- Properties
- Bookings
- Payments
- Reviews
- Messages

## API
- Architecture: RESTful
- HTTP Methods: GET, POST, PUT, PATCH, DELETE
- Optional: GraphQL for nested queries
- Authentication & Authorization
- JWT-based sessions
- Role-Based Access Control (RBAC):
- Guest: Search, book, review
- Host: Manage listings, respond to reviews
- Admin: Full control

## File Storage
- Property images and profile photos stored locally or via cloud (e.g., AWS S3).
- Third-Party Services
- Email Notifications: SendGrid or Mailgun
- Error Handling & Logging
- Global API error handling
- Application logs for debugging and security

## 🚀 Non-Functional Requirements
- Scalability
- Modular code structure
- Load balancers for horizontal scaling
- Security
- Passwords hashed with bcrypt
- Sensitive data encryption
- Rate limiting and input validation
- Performance
- Redis for caching search/filter results
- Optimized DB queries and indexes
- Testing
- Unit and integration tests with pytest
- Automated API tests

## 🧱 Database Schema Overview
- Entities & Relationships
## User
-**Attributes**: 
- user_id (PK),
- first_name,
- last_name,
- email (unique), 
- password_hash,
- phone_number,
- role, 
- created_at

- **Relationships**:
- One-to-many with Property (as host)
- One-to-many with Booking
- One-to-many with Review
- One-to-many with Message (as sender or recipient)

## Property
-**Attributes**: 
- property_id (PK),
- host_id (FK → User),
- name, description, 
- location, 
- price_per_night, 
- created_at, 
- updated_at

- **Relationships**:
- One-to-many with Booking
- One-to-many with Review

## Booking
- **Attributes**: 
- booking_id (PK), 
- property_id (FK → Property), 
- user_id (FK → User), 
- start_date, 
- end_date, 
- total_price, 
- status, 
- created_at

- **Relationships**:
- One-to-one with Payment

## Payment
- **Attributes**: 
- payment_id (PK), 
- booking_id (FK → Booking), 
- amount, 
- payment_date, 
- payment_method

- **Relationships**: 
- Linked to Booking

## Review
- **Attributes**: 
- review_id (PK), 
- property_id (FK → Property), 
- user_id (FK → User), 
- rating, 
- comment, 
- created_at

- **Relationships**: 
- Linked to Property and User

## Message
- **Attributes**: 
- message_id (PK), 
- sender_id (FK → User), 
- recipient_id (FK → User), 
- message_body, 
- sent_at

- **Relationships**: 
- Linked to User (sender and recipient)


