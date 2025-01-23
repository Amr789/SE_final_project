--Amr side note to file grader: This queries were extracted from our python system
--The function name where the query was used in the python system is included in a comment above for reference
--The question marks represent the input variables in python following its syntax not sql syntax

--1. Check if Phone Number is Already Registered
SELECT * FROM Customer WHERE Phone_No = ?;

--2. Register a New User
INSERT INTO Customer (Name, Password, Phone_No, IsAdministrator) 
VALUES (?, ?, ?, 0);

--3. Authenticate User
SELECT Name, IsAdministrator, User_ID 
FROM Customer 
WHERE LOWER(TRIM(Name)) = ? AND Password = ?;

--4. Fetch Showtimes for a Movie
SELECT CS.Show_ID, CS.Show_Time, TR.Type, CS.Seat_Matrix 
FROM Cinema_Shows CS 
JOIN Theatre_Rooms TR ON CS.Room_ID = TR.Room_ID 
WHERE CS.Show_ID = ?;

--5. Fetch Seat Matrix and Price
SELECT CS.Seat_Matrix, TR.Price_Per_Seat, CS.Movie_ID 
FROM Cinema_Shows CS 
JOIN Theatre_Rooms TR ON CS.Room_ID = TR.Room_ID 
WHERE CS.Show_ID = ?;

--6. Update Seat Matrix
UPDATE Cinema_Shows 
SET Seat_Matrix = ?, Available_Seats = Available_Seats - 1 
WHERE Show_ID = ?;

--7. Insert Booking Record
INSERT INTO Booking (User_ID, Show_ID, Movie_ID, Seat_No, Total_Amount) 
VALUES (?, ?, ?, ?, ?);

--8. Cancel a Booking
DELETE FROM Booking 
WHERE Booking_ID = ?;

--9. Fetch All Movies
SELECT * FROM Movies;

--10. Fetch All Snacks
SELECT * FROM Snacks;

--11. Add a New Movie
INSERT INTO Movies (Title, Genre, Duration, Description, Status, Image_Path) 
VALUES (?, ?, ?, ?, ?, ?);

--12. Fetch All Bookings
SELECT * FROM Booking;

--13. Fetch All Users
SELECT * FROM Customer;

--14. Fetch Latest Booking ID
SELECT MAX(Booking_ID) FROM Booking;
