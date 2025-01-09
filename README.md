# SE_final_project

Overview
The Cinema Management System is a desktop application built using Python and customtkinter for managing movie bookings, user registrations, and cinema operations. It provides functionalities for users to book tickets, cancel bookings, and view available movies, while administrators can add and update movie details.

Features
User Registration and Authentication: Users can register and log in securely with hashed passwords.

Movie Management: Admins can add and update movie details (title, genre, duration, etc.).

Ticket Booking: Users can book tickets for available movies and receive confirmation.

Booking Cancellation: Users can cancel their bookings, freeing up seats.

Seat Availability: Displays the total number of available seats for each showtime.

Snack List: Displays a static list of available snacks.

Feedback Form: Allows users to submit feedback after watching a movie.

Technologies Used
Python: Core programming language.

customtkinter: Modern GUI library for creating the user interface.

SQL Server: Database for storing user, movie, booking, and showtime data.

pyodbc: Python library for connecting to the SQL Server database.

PIL (Pillow): For handling images (e.g., movie posters).

Database Schema
The system uses the following tables:

Customer: Stores user information (name, password, phone number).

Movie: Stores movie details (title, genre, duration, description, status).

Booking: Stores booking details (user ID, movie ID, seat number, total amount).

Cinema_Shows: Stores showtime details (movie ID, room ID, seat matrix, available seats).

Snack_Beverage: Stores snack details (name, price).

Theatre_Rooms: Stores room details (number of seats, type, price per seat).
