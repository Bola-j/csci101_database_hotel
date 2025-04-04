CREATE DATABASE IF NOT EXISTS HotelDB;
USE HotelDB;

CREATE TABLE Hotelinfo (
hotel_id INT PRIMARY KEY AUTO_INCREMENT,
hotel_name VARCHAR(100) NOT NULL,
location VARCHAR(200) NOT NULL,
rating DECIMAL(2,1) CHECK (rating BETWEEN 0 AND 5)
);
ALTER TABLE 
  Hotelinfo AUTO_INCREMENT = 1;


CREATE TABLE Supplier (
Supplier_id INT PRIMARY KEY AUTO_INCREMENT,
Supplier_name VARCHAR(100) NOT NULL,
address VARCHAR(200) NOT NULL,
email VARCHAR(50) NOT NULL,
contract_expiary_date DATE NOT NULL,
hotel_id INT NOT NULL,
FOREIGN KEY (hotel_id) REFERENCES Hotelinfo(hotel_id)
);

ALTER TABLE 
  Supplier AUTO_INCREMENT = 1;

CREATE TABLE Guest (
guest_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
phone_number VARCHAR(20) NOT NULL,
email VARCHAR(100),
address VARCHAR(200)
);
ALTER TABLE 
  Guest AUTO_INCREMENT = 1;


CREATE TABLE Room (
  room_id INT PRIMARY KEY AUTO_INCREMENT, 
  room_number INT NOT NULL, 
  room_type VARCHAR(50) NOT NULL, 
  room_rate DECIMAL(6, 2) NOT NULL, 
  room_status VARCHAR(20) NOT NULL,
  hotel_id INT,
  FOREIGN KEY (hotel_id) REFERENCES Hotelinfo(hotel_id)
);
ALTER TABLE 
  Room AUTO_INCREMENT = 1;


CREATE TABLE Reservation (
  reservation_id INT PRIMARY KEY AUTO_INCREMENT, 
  guest_id INT NOT NULL, 
  room_id INT NOT NULL, 
  hotel_id INT NOT NULL,
  check_in_date DATE NOT NULL, 
  check_out_date DATE NOT NULL, 
  status VARCHAR(20) NOT NULL, 
  FOREIGN KEY (room_id) REFERENCES Room(room_id),
  FOREIGN KEY (hotel_id) REFERENCES Hotelinfo(hotel_id),
  foreign key (guest_id) REFERENCES guest(guest_id)
);
ALTER TABLE 
  Reservation AUTO_INCREMENT = 1;

  
CREATE TABLE Payment (
payment_id INT PRIMARY KEY AUTO_INCREMENT,
reservation_id INT NOT NULL,
payment_date DATE NOT NULL,
amount DECIMAL(10,2) NOT NULL,
payment_method VARCHAR(20) NOT NULL,
FOREIGN KEY (reservation_id) REFERENCES Reservation(reservation_id)
);
ALTER TABLE 
  Payment AUTO_INCREMENT = 1;

CREATE TABLE Employee (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    hotel_id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    role VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    foreign key (hotel_id) references hotelinfo(hotel_id)
);

ALTER TABLE Employee AUTO_INCREMENT = 1;


CREATE TABLE Service (
    service_id INT PRIMARY KEY AUTO_INCREMENT,
    service_name VARCHAR(50) NOT NULL,
    description VARCHAR(200),
    service_fee DECIMAL(10, 2) NOT NULL
);

ALTER TABLE Service AUTO_INCREMENT = 1;



CREATE TABLE INVENTORY (
	inventory_id INT PRIMARY KEY AUTO_INCREMENT,
	item_name VARCHAR(100) NOT NULL,
    quantity_in_stock INT NOT NULL DEFAULT 0,
	supplier_id INT,
	reorder_level INT NOT NULL,
    FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id)
    );

ALTER TABLE
	INVENTORY AUTO_INCREMENT = 1;
    
CREATE TABLE Maintenance (
	maintenance_id INT PRIMARY KEY AUTO_INCREMENT,
	room_id INT NOT NULL,
	issue_description VARCHAR(200) NOT NULL,
	reported_date DATE NOT NULL,
	resolved_date DATE,
    status VARCHAR(20) NOT NULL,
    CHECK (status IN ('Open','In Progress','Resolved')),
     FOREIGN KEY (room_id) REFERENCES Room(room_id)
    );

ALTER TABLE
Maintenance	 AUTO_INCREMENT = 1;


CREATE TABLE FoodAndBeverage (
	item_id INT PRIMARY KEY AUTO_INCREMENT,
	item_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
	price DECIMAL(10,2) NOT NULL,
	availability_status VARCHAR(20) NOT NULL
);
ALTER TABLE
	FoodAndBeverage AUTO_INCREMENT = 1;
    
CREATE TABLE EventBooking (
	event_id INT PRIMARY KEY AUTO_INCREMENT,
	guest_id INT NOT NULL,
    event_date DATE NOT NULL,
	event_type VARCHAR(50) NOT NULL,
	no_of_attendees INT NOT NULL,
    FOREIGN KEY (guest_id) REFERENCES Guest(guest_id)
);
ALTER TABLE
	 EventBooking AUTO_INCREMENT = 1;


INSERT INTO hotelinfo (hotel_name, location, rating) VALUES
( 'Grand Hotel', 'New York', 4.5),
( 'Beach Resort', 'Miami', 4.2),
( 'Mountain Lodge', 'Aspen', 4.8),
( 'City View Inn', 'Chicago', 3.9),
( 'Sunset Palms', 'Los Angeles', 4.3),
('Riverfront Hotel', 'New Orleans', 4.1),
( 'Lakeside Retreat', 'Seattle', 4.6),
( 'Desert Oasis', 'Phoenix', 4.4),
( 'Tropical Paradise', 'Hawaii', 4.7),
( 'Historic Inn', 'Boston', 4.0);

-- Inserting records into the Room table
INSERT INTO Room (hotel_id, room_number, room_type, room_rate, room_status) VALUES
( 1, 101, 'Standard', 150.00, 'Available'),
( 1, 201, 'Suite', 300.00, 'Occupied'),
( 2, 102, 'Deluxe', 200.00, 'Available'),
( 2, 202, 'Standard', 180.00, 'Available'),
( 3, 103, 'Cabin', 250.00, 'Occupied'),
( 4, 104, 'Standard', 160.00, 'Available'),
( 4, 204, 'Suite', 320.00, 'Available'),
( 5, 105, 'Deluxe', 220.00, 'Occupied'),
( 6, 106, 'Standard', 170.00, 'Available'),
( 6, 206, 'Suite', 310.00, 'Available');

INSERT INTO Guest (guest_id, first_name, last_name, phone_number, email, address) VALUES
(101, 'Alice', 'Smith', '123-456-7890', 'alice@example.com', '123 Main St, Anytown, USA');
INSERT INTO Guest (first_name, last_name, phone_number, email, address) VALUES
( 'Bob', 'Johnson', '234-567-8901', 'bob@example.com', '456 Elm St, Othertown, USA'),
( 'Charlie', 'Brown', '345-678-9012', 'charlie@example.com', '789 Oak St, Another Town, USA'),
( 'Daisy', 'Taylor', '456-789-0123', 'daisy@example.com', '987 Pine St, Yet Another Town, USA'),
( 'Eva', 'Clark', '567-890-1234', 'eva@example.com', '654 Cedar St, Last Town, USA'),
( 'Frank', 'White', '678-901-2345', 'frank@example.com', '321 Birch St, Final Town, USA'),
( 'Grace', 'Martin', '789-012-3456', 'grace@example.com', '159 Maple St, End Town, USA'),
( 'Henry', 'Lee', '890-123-4567', 'henry@example.com', '852 Walnut St, Ultimate Town, USA'),
( 'Ivy', 'Adams', '901-234-5678', 'ivy@example.com', '369 Cherry St, Supreme Town, USA'),
( 'Jack', 'Moore', '012-345-6789', 'jack@example.com', '753 Sycamore St, Top Town, USA');
-- Inserting records into the Reservation table
INSERT INTO Reservation ( room_id, hotel_id, guest_id, check_out_date, status, check_in_date) VALUES
( 1, 1, 101, '2025-01-05', 'Confirmed', '2025-01-01'),
( 3, 2, 102, '2025-01-07', 'Unconfirmed', '2025-01-02'),
( 5, 3, 103, '2025-01-10', 'Confirmed', '2025-01-03'),
( 7, 4, 104, '2025-01-15', 'Unconfirmed', '2025-01-06'),
( 9, 5, 105, '2025-01-20', 'Confirmed', '2025-01-10'),
( 2, 1, 101, '2025-01-06', 'Unconfirmed', '2025-01-02'),
( 4, 2, 102, '2025-01-09', 'Confirmed', '2025-01-03'),
( 6, 3, 103, '2025-01-12', 'Unconfirmed', '2025-01-05'),
( 8, 4, 104, '2025-01-17', 'Confirmed', '2025-01-07'),
( 10, 5, 105, '2025-01-22', 'Confirmed', '2025-01-12');

-- Inserting records into the Supplier table
INSERT INTO Supplier ( hotel_id, Supplier_name, address, email, contract_expiary_date) VALUES
( 1, 'ABC Suppliers', '123 Main St, New York', 'abc@example.com', '2026-12-31'),
( 2, 'XYZ Suppliers', '456 Ocean Ave, Miami', 'xyz@example.com', '2027-06-30'),
( 3, '123 Suppliers', '789 Mountain Rd, Aspen', '123@example.com', '2026-09-30'),
( 4, '456 Suppliers', '246 City Blvd, Chicago', '456@example.com', '2027-03-31'),
( 5, '789 Suppliers', '369 Sunset Dr, Los Angeles', '789@example.com', '2026-11-30'),
( 6, 'MNO Suppliers', '579 Riverfront Ave, New Orleans', 'mno@example.com', '2027-08-31'),
( 7, 'PQR Suppliers', '753 Lakeside Ln, Seattle', 'pqr@example.com', '2026-10-31'),
( 8, 'STU Suppliers', '852 Desert Dr, Phoenix', 'stu@example.com', '2027-02-28'),
( 9, 'VWX Suppliers', '963 Tropical St, Hawaii', 'vwx@example.com', '2027-05-31'),
( 10, 'GHI Suppliers', '159 Historic Rd, Boston', 'ghi@example.com', '2026-08-31');

-- Inserting records into the Payment table
INSERT INTO Payment ( reservation_id, payment_date, amount, payment_method) VALUES
( 1, '2025-01-01', 150.00, 'Card'),
( 2, '2025-01-02', 200.00, 'Cash'),
( 3, '2025-01-03', 250.00, 'Card'),
( 4, '2025-01-04', 160.00, 'Cash'),
( 5, '2025-01-05', 220.00, 'Online'),
( 6, '2025-01-06', 300.00, 'Card'),
(7, '2025-01-07', 180.00, 'Online'),
( 8, '2025-01-08', 270.00, 'Online'),
( 9, '2025-01-09', 190.00, 'Cash'),
( 10, '2025-01-10', 280.00, 'Card');

-- Inserting records into the Maintenance table
INSERT INTO Maintenance (room_id, issue_description, reported_date, resolved_date, status) VALUES
( 1, 'Broken sink', '2025-01-01', '2025-01-02', 'Resolved'),
( 3, 'Leaky faucet', '2025-01-02', '2025-01-03', 'Resolved'),
( 5, 'Faulty AC', '2025-01-03', '2025-01-04', 'Resolved'),
( 7, 'Clogged toilet', '2025-01-04', '2025-01-05', 'Resolved'),
( 9, 'Broken window', '2025-01-05', '2025-01-06', 'Resolved'),
( 2, 'TV not working', '2025-01-06', '2025-01-07', 'Resolved'),
( 4, 'Light bulb out', '2025-01-07', '2025-01-08', 'Resolved'),
( 6, 'Shower leak', '2025-01-08', '2025-01-09', 'Resolved'),
( 8, 'Door jammed', '2025-01-09', '2025-01-10', 'Resolved'),
( 10, 'Carpet stain', '2025-01-10', '2025-01-11', 'Resolved');

-- Inserting records into the INVENTORY table
INSERT INTO INVENTORY ( supplier_id, item_name, quantity_in_stock, reorder_level) VALUES
( 1, 'Towels', 200, 50),
( 2, 'Toiletries', 300, 100),
(3, 'Linens', 150, 30),
( 4, 'Cleaning Supplies', 100, 20),
( 5, 'Furniture', 50, 10),
( 6, 'Electronics', 75, 15),
( 7, 'Kitchenware', 120, 25),
( 8, 'Decorations', 80, 18),
( 9, 'Outdoor Equipment', 40, 8),
( 10, 'Maintenance Tools', 60, 12);

-- Inserting records into the Employee table
INSERT INTO Employee (Employee_ID, hotel_id, first_name, last_name, role, salary) VALUES
(1, 1, 'John', 'Doe', 'Manager', 60000.00),
(2, 1, 'Jane', 'Smith', 'Receptionist', 30000.00),
(3, 2, 'Michael', 'Johnson', 'Chef', 45000.00),
(4, 3, 'Emily', 'Brown', 'Housekeeper', 25000.00),
(5, 4, 'David', 'Wilson', 'Maintenance Technician', 35000.00),
(6, 5, 'Laura', 'Martinez', 'Waiter', 20000.00),
(7, 6, 'Kevin', 'Garcia', 'Bartender', 22000.00),
(8, 7, 'Sarah', 'Lopez', 'Concierge', 28000.00),
(9, 8, 'Steven', 'Perez', 'Security Guard', 24000.00),
(10, 9, 'Rachel', 'Torres', 'Event Coordinator', 32000.00);

-- Inserting records into the Service table
INSERT INTO Service (Service_ID, service_name, description, service_fee) VALUES
(1, 'Room Cleaning', 'Daily cleaning of rooms', 50.00),
(2, 'Airport Shuttle', 'Transportation to and from the airport', 30.00),
(3, 'Spa Treatment', 'Relaxing spa services', 100.00),
(4, 'Room Service', 'In-room dining options', 20.00),
(5, 'Fitness Center', 'Access to gym facilities', 15.00),
(6, 'Concierge Assistance', 'Assistance with bookings and reservations', 10.00),
(7, 'Event Planning', 'Organizing events and special occasions', 200.00),
(8, 'Laundry Service', 'Professional laundry and dry cleaning', 25.00),
(9, 'Pool Maintenance', 'Maintenance and cleaning of pool area', 40.00),
(10, 'Valet Parking', 'Convenient parking service', 10.00);

-- Inserting records into the Event Booking table
INSERT INTO EventBooking (event_id, guest_id, event_date, event_type, no_of_attendees) VALUES
(1, 101, '2025-02-15', 'Wedding', 100),
(2, 103, '2025-03-20', 'Birthday Party', 50),
(3, 105, '2025-04-25', 'Corporate Event', 200),
(4, 107, '2025-05-30', 'Conference', 150),
(5, 109, '2025-06-10', 'Baby Shower', 30),
(6, 102, '2025-07-15', 'Anniversary', 80),
(7, 104, '2025-08-20', 'Graduation Party', 70),
(8, 106, '2025-09-25', 'Retirement Party', 40),
(9, 108, '2025-10-30', 'Holiday Celebration', 120),
(10, 110, '2025-11-10', 'Family Reunion', 60);

-- Inserting records into the Food And Beverage table
INSERT INTO FoodAndBeverage (item_id, item_name, category, price, availability_status) VALUES
(1, 'Steak', 'Main Course', 25.00, 'Available'),
(2, 'Salad', 'Appetizer', 10.00, 'Available'),
(3, 'Cake', 'Dessert', 15.00, 'Available'),
(4, 'Wine', 'Beverage', 20.00, 'Available'),
(5, 'Burger', 'Main Course', 12.00, 'Available'),
(6, 'Soup', 'Appetizer', 8.00, 'Out of Stock'),
(7, 'Ice Cream', 'Dessert', 10.00, 'Seasonal'),
(8, 'Beer', 'Beverage', 6.00, 'Out of Stock'),
(9, 'Pasta', 'Main Course', 18.00, 'Available'),
(10, 'Fries', 'Side Dish', 5.00, 'Available');