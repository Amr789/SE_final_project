import sys
sys.path.append(r'C:\Users\20101\Downloads')  # Add the directory containing App.py to Python path

from updatedmoot import create_connection, hash_password, register_user, authenticate_user, book_ticket, cancel_booking

# Test database connection
def test_create_connection():
    """
    Test if the database connection is successfully created.
    """
    conn = create_connection()
    assert conn is not None, "Database connection failed"

# # Test password hashing
# def test_hash_password():
#     """
#     Test if the password is hashed correctly.
#     """
#     password = "testpassword123"
#     hashed = hash_password(password)
#     assert hashed == "b55c8792d1ce458e279308835f8a97b580263503e76e1998e279703e35ad0c2e", "Password hashing failed"  

# # Test user registration
# def test_register_user_success():
#     """
#     Test successful user registration.
#     """
#     # Use a unique phone number to avoid conflicts
#     success, message = register_user("TestU", "test345", "01020838080")
#     assert success is True, "User registration failed"
#     assert message == "User registered successfully!", "Unexpected registration message"

# # Test user authentication
# def test_authenticate_user_success():
#     """
#     Test successful user authentication.
#     """
#     # Register a test user first
#     # register_user("AuthUser", "authpassword123", "01020837071")
#     # Authenticate the user
#     message, role, user_id = authenticate_user("amr", "Amr123")
#     assert message.startswith("Welcome, AuthUser!"), "Authentication failed"
#     assert role == "user", "Incorrect user role"
#     assert user_id is not None, "User ID not returned"

# # Test ticket booking
# def test_book_ticket_success():
#     """
#     Test successful ticket booking.
#     """
#     # Ensure the show_id and seat_no are valid in your database
#     success, message = book_ticket(1, 11, "A1")  
#     assert success is True, "Ticket booking failed"

# # Test booking cancellation
# def test_cancel_booking_success():
#     """
#     Test successful booking cancellation.
#     """
#     # First, book a ticket to get a valid booking_id
#     # Fetch the booking_id from the database (for simplicity, assume booking_id=1)
#     success, message = cancel_booking(35)
#     assert success is True, "Booking cancellation failed"

# # Test invalid user authentication
# def test_authenticate_user_failure():
#     """
#     Test authentication with invalid credentials.
#     """
#     message, role, user_id = authenticate_user("InvalidUser", "wrongpassword")
#     assert message == "Invalid username or password.", "Authentication should fail for invalid credentials"
#     assert role is None, "Role should be None for failed authentication"
#     assert user_id is None, "User ID should be None for failed authentication"

# # Test invalid ticket booking
# def test_book_ticket_failure():
#     """
#     Test booking with an invalid seat number.
#     """
#     # Attempt to book an invalid or already booked seat
#     success, message = book_ticket(80, 12, "A1")
#     assert success is False, "Booking should fail for invalid seat"
#     assert "Seat is already booked or invalid." in message, "Unexpected booking failure message"

# # Test invalid booking cancellation
# def test_cancel_booking_failure():
#     """
#     Test cancellation with an invalid booking ID.
#     """
#     success, message = cancel_booking(999)  # Assuming 999 is an invalid booking ID
#     assert success is False, "Cancellation should fail for invalid booking ID"
#     assert "Invalid Booking ID." in message, "Unexpected cancellation failure message"