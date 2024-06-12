Hotel Management Service Database
This repository contains the SQL schema and sample data for a hotel management service database. The database is designed to manage various aspects of a hotel's operations, including customer information, employee records, room details, reservations, payments, transactions, and reports. Below is a detailed description of the database schema, including table structures and relationships.

Database Schema
The database consists of the following tables:

customer_information
employees
payments
reports
reservation
room_class
room_information
transaction
Tables and Their Descriptions
1. customer_information
This table stores information about customers.

Column	Type	Description
cust_ID	int	Primary key, auto-incremented customer ID.
custfname	varchar(45)	First name of the customer.
custlname	varchar(45)	Last name of the customer.
address	varchar(100)	Customer's address.
status	varchar(50)	Status of the customer (e.g., Active, Inactive).
2. employees
This table stores information about employees.

Column	Type	Description
employee_ID	int	Primary key, employee ID.
fname	varchar(45)	First name of the employee.
lname	varchar(45)	Last name of the employee.
job_department	varchar(45)	Department where the employee works.
address	varchar(45)	Employee's address.
contact_add	varchar(45)	Contact address of the employee.
username	varchar(45)	Username for employee login.
password	varchar(45)	Password for employee login.
3. payments
This table stores payment records.

Column	Type	Description
payment_ID	int	Primary key, auto-incremented payment ID.
customer_ID	int	Foreign key to customer_information.
payment_date	datetime	Date and time of the payment.
4. reports
This table stores various reports generated by the system.

Column	Type	Description
reports_ID	int	Primary key, report ID.
transaction_ID	int	Foreign key to transaction.
information	varchar(45)	Description or information about the report.
date	datetime	Date and time the report was generated.
5. reservation
This table stores reservation details.

Column	Type	Description
reservation_ID	varchar(50)	Primary key, reservation ID.
customer_ID	int	Foreign key to customer_information.
room_ID	int	Foreign key to room_information.
reservation_date	date	Date when the reservation was made.
date_in	datetime	Check-in date and time.
date_out	datetime	Check-out date and time.
date_range	int	Duration of stay in days.
6. room_class
This table stores different room classifications.

Column	Type	Description
class_ID	int	Primary key, class ID.
name	varchar(45)	Name of the room class.
7. room_information
This table stores information about individual rooms.

Column	Type	Description
room_id	int	Primary key, room ID.
class_id	int	Foreign key to room_class.
description	varchar(150)	Description of the room.
price	int	Price per night for the room.
8. transaction
This table stores transaction details.

Column	Type	Description
transaction_ID	int	Primary key, transaction ID.
transaction_name	varchar(45)	Name or type of transaction.
customer_ID	int	Foreign key to customer_information.
payment_ID	int	Foreign key to payments.
employee_ID	int	Foreign key to employees.
reservation_ID	int	Foreign key to reservation.
transaction_date	datetime	Date and time of the transaction.
Relationships
payments.customer_ID is a foreign key referencing customer_information.cust_ID.
reports.transaction_ID is a foreign key referencing transaction.transaction_ID.
reservation.customer_ID is a foreign key referencing customer_information.cust_ID.
reservation.room_ID is a foreign key referencing room_information.room_id.
room_information.class_id is a foreign key referencing room_class.class_ID.
transaction.customer_ID is a foreign key referencing customer_information.cust_ID.
transaction.payment_ID is a foreign key referencing payments.payment_ID.
transaction.employee_ID is a foreign key referencing employees.employee_ID.
transaction.reservation_ID is a foreign key referencing reservation.reservation_ID.
Sample Data
The database includes sample data for each table to illustrate its structure and the relationships between tables. Here are a few examples:

customer_information
John Doe, 123 Main St, Active
Jane Smith, 456 Elm St, Active
employees
Employee ID: 1, John, Doe, IT, 1234 North St, johndoe, password123
room_class
1, Standard
2, Deluxe
room_information
Room ID: 123, Class ID: 3, Luxurious and expansive suites with separate living and sleeping areas., 455
reservation
Reservation ID: AJones10, Customer ID: 10, Room ID: 223, 2023-03-20 to 2023-03-25
payments
Payment ID: 1000, Customer ID: 1, 2023-02-20 15:30:43
transaction
Transaction ID: 1, Reservation ID: AJones10, Customer ID: 10, Payment ID: 1000, Employee ID: 1, 2023-03-20 09:00:00
How to Use
Create Database: Ensure MySQL is installed and running. Create the database by running the provided SQL script.
Load Schema and Data: The SQL script will create the tables and load the sample data into the database.
Modify or Extend: Feel free to modify or extend the schema and data as per your requirements.
This database provides a comprehensive structure to manage a hotel's operations efficiently. Use it as a starting point for your own hotel management system, ensuring to tailor it to your specific needs and business rules.
