CREATE TABLE Customer (
    User_ID INT PRIMARY KEY IDENTITY(1,1), 
    Name VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL, 
    Phone_No VARCHAR(20) NOT NULL
);

CREATE TABLE Movie (
    Movie_ID INT PRIMARY KEY IDENTITY(1,1),
    Title VARCHAR(255) NOT NULL, 
    Genre VARCHAR(100) NOT NULL,
    Duration INT NOT NULL, 
    Description TEXT NULL, 
    Status VARCHAR(100) DEFAULT 'Available'
);

CREATE TABLE Booking (
    Booking_ID INT PRIMARY KEY IDENTITY(1,1),
    User_ID INT NOT NULL, 
    Movie_ID INT NOT NULL, 
    Seat_No VARCHAR(10)  NOT NULL,
    Booking_Time DATETIME DEFAULT GETDATE(),
    Total_Amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (User_ID) REFERENCES Customer(User_ID),
    FOREIGN KEY (Movie_ID) REFERENCES Movie(Movie_ID)
);


CREATE TABLE Snack_Beverage (
    Item_ID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(255) NOT NULL,
    Price DECIMAL(7, 2) NOT NULL
);

CREATE TABLE Theatre_Rooms (
    Room_ID INT PRIMARY KEY IDENTITY(1,1),
    Number_Of_Seats INT NOT NULL,
    Type VARCHAR(100) NOT NULL,
    Price_Per_Seat DECIMAL(7, 2) NOT NULL
);


CREATE TABLE Cinema_Shows (
    Show_ID INT PRIMARY KEY IDENTITY(1,1),
    Movie_ID INT NOT NULL,
    Movie_Name VARCHAR(255) NOT NULL,
    Room_ID INT NOT NULL,
    Available_Seats INT NOT NULL, -- Total number of available seats
    Seat_Matrix NVARCHAR(MAX) NOT NULL, -- Stores the 2D array as JSON
    Show_Time DATETIME NOT NULL,
    FOREIGN KEY (Movie_ID) REFERENCES Movie(Movie_ID),
    FOREIGN KEY (Room_ID) REFERENCES Theatre_Rooms(Room_ID)
);


