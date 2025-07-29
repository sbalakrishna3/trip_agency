-- Drop the database if it exists (run this separately in psql if needed)
DROP DATABASE IF EXISTS "M7619_trip_DB";

-- Create the database
CREATE DATABASE "M7619_trip_DB";

-- Switch to the new database
\c "M7619_trip_DB";

-- Drop tables if they already exist
DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS trips;
DROP TABLE IF EXISTS users;

-- USERS TABLE
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    profile_pic TEXT,
    role VARCHAR(20) DEFAULT 'user'  -- 'user' or 'admin'
);

-- Insert hardcoded admin user
INSERT INTO users (name, email, password, profile_pic, role)
VALUES ('Admin', 'alex@admin.com', 'alex', NULL, 'admin');

-- TRIPS TABLE
CREATE TABLE trips (
    id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    description TEXT NOT NULL,
    destination VARCHAR(100) NOT NULL,
    price NUMERIC(10,2) NOT NULL,
    duration VARCHAR(50),
    dates VARCHAR(100),
    activity_type VARCHAR(50),
    image_path TEXT
);

-- BOOKINGS TABLE
CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    trip_id INT REFERENCES trips(id) ON DELETE CASCADE,
    participants INT NOT NULL,
    booking_date DATE NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);