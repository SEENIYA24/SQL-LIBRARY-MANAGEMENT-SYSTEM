
-- Topic : Library Management System

create database LIBRARY;
USE LIBRARY;

CREATE TABLE Branch (
  Branch_no INT PRIMARY KEY,
  Manager_Id INT,
  Branch_address VARCHAR(200),
  Contact_no VARCHAR(15));

desc Branch;

CREATE TABLE Employee (
  Emp_Id INT PRIMARY KEY,
  Emp_name VARCHAR(255),
  Position VARCHAR(100),
  Salary DECIMAL(10, 2),
  Branch_no INT,
  FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no));
  
desc employee ;

CREATE TABLE Books (
  ISBN VARCHAR(20) PRIMARY KEY,
  Book_title VARCHAR(255),
  Category VARCHAR(100),
  Rental_Price DECIMAL(10, 2),
  Status VARCHAR(5),
  Author VARCHAR(100),
  Publisher VARCHAR(100));

desc books;

CREATE TABLE Customer (
  Customer_Id INT PRIMARY KEY,
  Customer_name VARCHAR(255),
  Customer_address VARCHAR(255),
  Reg_date DATE);
desc customer ;

CREATE TABLE IssueStatus (
  Issue_Id INT PRIMARY KEY,
  Issued_cust INT,
  Issued_book_name VARCHAR(255),
  Issue_date DATE,
  Isbn_book VARCHAR(20),
  FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
  FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN));

desc issuestatus;
CREATE TABLE ReturnStatus (
  Return_Id INT PRIMARY KEY,
  Return_cust INT,
  Return_book_name VARCHAR(255),
  Return_date DATE,
  Isbn_book2 VARCHAR(20),
  FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
  FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN));
  
  desc returnstatus;

INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES
(1, 101, 'New Delhi', '1112345678'),
(2, 102, 'Mumbai', '2223456789'),
(3, 103, 'banglore', '2123756789'),
(4, 104, 'kochi', '1123236789'),
(5, 105, 'tamilnadu', '1298765432'),
(6, 106, 'andra', '2334567890'),
(7, 107, 'kerala', '2490876754'),
(8, 108, 'Mumbai', '2523456999'),
(9, 109, 'newdelhi', '2223333567'),
(10, 110, 'karnadaka', '2023498789'),
(11, 111, 'chenni', '2222343289'),
(12, 112, 'panjab', '2823090989'),
(13, 113, 'Mumbai', '2923498769'),
(14, 114, 'kerala', '2323234569'),
(15, 115, 'UP', '2529878967'),
(16, 116, 'Karnadaka', '4434870989');

select * from branch;

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES
(101, 'Rajesh Kumar', 'Manager', 50000, 1),
(102, 'Suresh TP', 'Assistant Manager', 40000, 1),
(103, 'Ramesh KP', 'Manager', 55000, 2),
(104, 'Mahesh KR', 'store keeper', 45000, 2),
(105, 'Mahesh GP', 'librarian', 45000, 2),
(106, 'Madhu KV', 'Assistant Manager', 45000, 3),
(107, 'Murali Kumar', 'librarian', 45000, 4),
(108, 'Sandeep Boss', 'Assistant Manager', 45000, 5),
(109, 'Syama Akhil', 'Assistant Manager', 45000, 6),
(110, 'Vasundara  Devi ', 'Assistant Manager', 45000, 7),
(111, 'Aadhi Nair', 'librarian', 45000, 2),
(112, 'Sachin tendukar', 'Assistant Manager', 45000, 8),
(113, 'Deleep KV', 'Assistant Manager', 45000, 9),
(114, 'Nayana Raj', 'Assistant Manager', 45000, 10),
(115, 'Josmi Jose', 'Assistant Manager', 45000, 11),
(116, 'Raghi Abraham', 'librarian', 45000, 12),
(117, 'Ramya george', 'librarian', 45000, 6),
(118, 'Praveen Kuriyan', ' Manager', 45000,7 ),
(119, 'Nishath KV', 'Manager', 60000, 8);

select * from employee;

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
('1234567890', 'History of India', 'History', 20, 'yes', 'Rajmohan Gandhi', 'Penguin Books'),
('2345678901', 'The Great Gatsby', ' Non Fiction', 25, 'yes', 'F Scott Fitzgerald', 'Charles Scribners Sons'),
('2345678902', 'to kill a mockingbird', ' classic Fiction', 25, 'yes', 'harper lee', 'j b lippincott and co'),
('2345678903', 'the hunger games', 'young adult dystopin', 25, 'yes', 'suzanne collins', 'scholastic press'),
('2345678904', 'the da vinci code', 'mystery thriller', 30, 'no', 'dan brown', 'doubleday'),
('2345678905', 'pride and prejudice', 'classic romance', 30, 'yes', 'jane austen', 't egerton'),
('2345678906', 'catcher in the rye', ' classic coming of age', 25, 'yes', 'j d salinger', 'little brown company'),
('2345678907', 'The handmaids tale', ' dystopian Fiction', 25, 'no', 'margaret atwood', 'mcclelland and stewart'),
('2345678908', 'the loard of the rings', 'Fantacy adventure', 25, 'yes', 'j.r.r tolkien', 'allen and unwin'),
('2345678909', 'The  picture of dorian gray', 'classic horror', 25, 'yes', 'oscar wilde', 'lippincotts magazine'),
('2345678910', '1984', 'classic dystopian', 25, 'no', 'george orwell', 'secker and warburg'),
('23456789011', 'The girl with the dragon tattoo', 'mystery thriller', 25, 'yes', 'stieg larsson', 'norstedts'),
('23456789012', 'The nightingale', ' historical Fiction', 25, 'yes', 'krisin hannah', 'st martins press'),
('23456789013', 'the hitchhiker guide to the galaxy', ' science Fiction comedy', 25, 'yes', 'douglas adams', 'pan books'),
('23456789014', 'The power', ' speculative Fiction', 25, 'yes', 'naomi alderman', ' little,brown and company'),
('2345678915', 'sapiensa brief history of humankind', ' non Fiction history', 25, 'yes', 'yuval noah harari', 'harvill secker'),
('23456789016', 'the immortal life of henrietta lacks', ' non Fiction science', 25, 'yes', 'rebecca skloot', 'crown publisher'),
('23456789017', 'The devil in the white city', ' non Fiction history', 25, 'yes', 'erik larson', 'crown publisher'),
('23456789018', 'The song of achilles', ' historical Fiction', 25, 'yes', 'madeline miller', 'ecco press'),
('23456789019', 'the seven husbands of evelyn hugo', ' contemporary Fiction', 25, 'no', 'taylor jenkins reid', 'atria books'),
('2345678920', 'The silent patient', 'phychological thriller', 25, 'yes', ' alex michaelides', 'celadon books'),
('3456789021', 'The Origin of Species', 'Science', 30, 'yes', 'Charles Darwin', 'John Murray');

select * from books;

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
(1, 'Amit Kumar', 'New Delhi 123', '2020-01-01'),
(2, 'Sumit Kumar', 'Mumbai 456', '2021-04-02'),
(3, 'Raj Kumar', 'panjab 876', '2024-06-02'),
(4, 'Muhammed KM', 'kerala 654', '2021-09-22'),
(5, 'Subina Rohith', 'up 890', '2022-02-22'),
(6, 'Vijay Das', 'Mumbai 654', '2023-02-12'),
(7, 'Pandit KA', 'chenni 432', '2024-02-10'),
(8, 'malavika praveen', 'newdelhi 457', '2020-02-09'),
(9, 'Sunil Kv', 'banglore 223', '2020-02-02'),
(10, 'syndhya george', 'kochi 678', '2020-03-03');

select * from customer ;

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES
(1, 1, 'History of India', '2020-01-01', '1234567890'),
(2, 2, 'The Great Gatsby', '2021-04-02', '2345678901'),
(3, 3, 'the girl with dragon tattoo', '2024-06-02', '23456789011'),
(4, 5, 'The hitchhiker guide to the galaxy', '2022-02-22', '23456789013'),
(5, 7, 'The  immoral life of henrietta lacks', '2024-02-10', '23456789016'),
(6, 8, 'The devil in the white city', '2020-02-09', '23456789017'),
(7, 4, 'The nightingale', '2021-09-22', '23456789012'),
(8, 6, 'The power', '2023-02-12', '23456789014'),
(9, 2, 'to kill a mockingbird', '2021-04-02', '2345678902');
select * from issuestatus;

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
(1, 1, 'History of India', '2020-01-15', '1234567890'),
(2, 2, 'The Great Gatsby', '2021-05-15', '2345678901'),
(3, 3, 'the girl with dragon tattoo', '2024-07-07', '23456789011'),
(4, 4, 'the hitchhiker guide to the galaxy', '2022-03-15', '23456789013'),
(5, 5, 'the devil in the white city ', '2020-02-15', '23456789017'),
(6, 6, 'the nightinggale', '2021-10-15', '23456789012'),
(7, 7, 'The power', '2023-02-12', '2345678902');

select * from returnstatus;


-- 1. Retrieve the book title, category, and rental price of all available books.

SELECT Book_title, Category, Rental_Price FROM Books WHERE Status = 'yes';

-- 2. List the employee names and their respective salaries in descending order of salary.

SELECT Emp_name, Salary FROM Employee ORDER BY Salary DESC;

-- 3. Retrieve the book titles and the corresponding customers who have issued those books. 

SELECT Book_title, Customer_name FROM Books
JOIN IssueStatus ON Books.ISBN = IssueStatus.Isbn_book
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id;

-- 4.Display the total count of books in each category.
 
SELECT Category, COUNT(*) as Total_Books FROM Books
GROUP BY Category;

-- 5.. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000. 

SELECT Emp_name, Position FROM Employee
WHERE Salary > 50000;

-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet

SELECT Customer_name FROM Customer
WHERE Reg_date < '2022-01-01'
AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);

-- 7.Display the branch numbers and the total count of employees in each branch. 

SELECT Branch_no, COUNT(*) as Total_Employees
FROM Employee
GROUP BY Branch_no;

-- 8.Display the names of customers who have issued books in the month of June 2023.

SELECT Customer_name
FROM Customer
JOIN IssueStatus ON Customer.Customer_Id = IssueStatus.Issued_cust
WHERE Issue_date BETWEEN '2023-06-01' AND '2023-06-30';

-- 9.Retrieve book_title from book table containing history. 

SELECT Book_title
FROM Books
WHERE Book_title LIKE '%history%';

-- 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees

SELECT Branch_no, COUNT(*) as Total_Employees
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;

-- 11. Retrieve the names of employees who manage branches and their respective branch addresses.

SELECT Emp_name, Branch_address
FROM Employee
JOIN Branch ON Employee.Branch_no = Branch.Branch_no
WHERE Position = 'Manager';

-- 12. Display the names of customers who have issued books with a rental price higher than Rs. 25.

SELECT Customer_name
FROM Customer
JOIN IssueStatus ON Customer.Customer_Id = IssueStatus.Issued_cust
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN
WHERE Rental_Price > 25;
