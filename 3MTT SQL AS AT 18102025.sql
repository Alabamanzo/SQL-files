create schema Alabamanzo;
use Alabamanzo;
drop table if exists branch;
create table branch
 (
  branch_id varchar(20) primary key,
        manager_id varchar(20),
        branch_address varchar(50),
        contact_no varchar(20)
 );
alter table branch
modify column contact_no varchar(20);

drop table if exists employees;    
create table employees
 (
  emp_id varchar(10) primary key,
        emp_name varchar(25),
        position varchar(15),
        salary int,
        branch_id varchar(25)
    );
    
drop table if exists books;
create table books
 (
  isbn varchar(25) primary key,
        book_title varchar(75),
        category varchar(20),
        rental_price float,
        status varchar(10),
        author varchar(35),
        publisher varchar(50)
	
    );
    
drop table if exists members;
create table members
 (
  member_id varchar(10) primary key,
        member_name varchar(35),
        member_address varchar(75),
        reg_date date
        
    );
    

drop table if exists issued_status;
create table issued_status
 (
  issued_id varchar(20) primary key,
        issued_member_id varchar(10),
        issued_book_name varchar(75),
        issued_date date,
        issued_book_isbn varchar(25),
        issued_emp_id varchar(10)
        
    );

drop table if exists return_status;
create table return_status
 (
  return_id varchar(10) primary key,
        issued_id varchar(10),
        return_book_name varchar(75),
        return_date date,
        ruturn_book_isbn varchar(25)
    );
    
-- Foreign Key Constraints

alter table issued_status
add constraint fk_members
foreign key (issued_member_id)
references members(member_id);

alter table issued_status
add constraint fk_books
foreign key (issued_book_isbn)
references books(isbn);

alter table issued_status
add constraint fk_employees
foreign key (issued_emp_id)
references employees(emp_id);

alter table return_status
add constraint fk_issued_status
foreign key (issued_id)
references issued_status(issued_id);

alter table employees
add constraint fk_branch
foreign key (branch_id)
references branch(branch_id);

INSERT INTO members(member_id, member_name, member_address, reg_date) 
VALUES
('C101', 'Alice Johnson', '123 Main St', '2021-05-15'),
('C102', 'Bob Smith', '456 Elm St', '2021-06-20'),
('C103', 'Carol Davis', '789 Oak St', '2021-07-10'),
('C104', 'Dave Wilson', '567 Pine St', '2021-08-05'),
('C105', 'Eve Brown', '890 Maple St', '2021-09-25'),
('C106', 'Frank Thomas', '234 Cedar St', '2021-10-15'),
('C107', 'Grace Taylor', '345 Walnut St', '2021-11-20'),
('C108', 'Henry Anderson', '456 Birch St', '2021-12-10'),
('C109', 'Ivy Martinez', '567 Oak St', '2022-01-05'),
('C110', 'Jack Wilson', '678 Pine St', '2022-02-25'),
('C118', 'Sam', '133 Pine St', '2024-06-01'),    
('C119', 'John', '143 Main St', '2024-05-01');
SELECT * FROM members;


-- Insert values into each branch table
INSERT INTO branch(branch_id, manager_id, branch_address, contact_no) 
VALUES
('B001', 'E109', '123 Main St', '+919099988676'),
('B002', 'E109', '456 Elm St', '+919099988677'),
('B003', 'E109', '789 Oak St', '+919099988678'),
('B004', 'E110', '567 Pine St', '+919099988679'),
('B005', 'E110', '890 Maple St', '+919099988680');
SELECT * FROM branch;


-- Insert values into each employees table
INSERT INTO employees(emp_id, emp_name, position, salary, branch_id) 
VALUES
('E101', 'John Doe', 'Clerk', 60000.00, 'B001'),
('E102', 'Jane Smith', 'Clerk', 45000.00, 'B002'),
('E103', 'Mike Johnson', 'Librarian', 55000.00, 'B001'),
('E104', 'Emily Davis', 'Assistant', 40000.00, 'B001'),
('E105', 'Sarah Brown', 'Assistant', 42000.00, 'B001'),
('E106', 'Michelle Ramirez', 'Assistant', 43000.00, 'B001'),
('E107', 'Michael Thompson', 'Clerk', 62000.00, 'B005'),
('E108', 'Jessica Taylor', 'Clerk', 46000.00, 'B004'),
('E109', 'Daniel Anderson', 'Manager', 57000.00, 'B003'),
('E110', 'Laura Martinez', 'Manager', 41000.00, 'B005'),
('E111', 'Christopher Lee', 'Assistant', 65000.00, 'B005');
SELECT * FROM employees;


-- Inserting into books table 
INSERT INTO books(isbn, book_title, category, rental_price, status, author, publisher) 
VALUES
('978-0-553-29698-2', 'The Catcher in the Rye', 'Classic', 7.00, 'yes', 'J.D. Salinger', 'Little, Brown and Company'),
('978-0-330-25864-8', 'Animal Farm', 'Classic', 5.50, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-14-118776-1', 'One Hundred Years of Solitude', 'Literary Fiction', 6.50, 'yes', 'Gabriel Garcia Marquez', 'Penguin Books'),
('978-0-525-47535-5', 'The Great Gatsby', 'Classic', 8.00, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
('978-0-141-44171-6', 'Jane Eyre', 'Classic', 4.00, 'yes', 'Charlotte Bronte', 'Penguin Classics'),
('978-0-307-37840-1', 'The Alchemist', 'Fiction', 2.50, 'yes', 'Paulo Coelho', 'HarperOne'),
('978-0-679-76489-8', 'Harry Potter and the Sorcerers Stone', 'Fantasy', 7.00, 'yes', 'J.K. Rowling', 'Scholastic'),
('978-0-7432-4722-4', 'The Da Vinci Code', 'Mystery', 8.00, 'yes', 'Dan Brown', 'Doubleday'),
('978-0-09-957807-9', 'A Game of Thrones', 'Fantasy', 7.50, 'yes', 'George R.R. Martin', 'Bantam'),
('978-0-393-05081-8', 'A Peoples History of the United States', 'History', 9.00, 'yes', 'Howard Zinn', 'Harper Perennial'),
('978-0-19-280551-1', 'The Guns of August', 'History', 7.00, 'yes', 'Barbara W. Tuchman', 'Oxford University Press'),
('978-0-307-58837-1', 'Sapiens: A Brief History of Humankind', 'History', 8.00, 'no', 'Yuval Noah Harari', 'Harper Perennial'),
('978-0-375-41398-8', 'The Diary of a Young Girl', 'History', 6.50, 'no', 'Anne Frank', 'Bantam'),
('978-0-14-044930-3', 'The Histories', 'History', 5.50, 'yes', 'Herodotus', 'Penguin Classics'),
('978-0-393-91257-8', 'Guns, Germs, and Steel: The Fates of Human Societies', 'History', 7.00, 'yes', 'Jared Diamond', 'W. W. Norton & Company'),
('978-0-7432-7357-1', '1491: New Revelations of the Americas Before Columbus', 'History', 6.50, 'no', 'Charles C. Mann', 'Vintage Books'),
('978-0-679-64115-3', '1984', 'Dystopian', 6.50, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-14-143951-8', 'Pride and Prejudice', 'Classic', 5.00, 'yes', 'Jane Austen', 'Penguin Classics'),
('978-0-452-28240-7', 'Brave New World', 'Dystopian', 6.50, 'yes', 'Aldous Huxley', 'Harper Perennial'),
('978-0-670-81302-4', 'The Road', 'Dystopian', 7.00, 'yes', 'Cormac McCarthy', 'Knopf'),
('978-0-385-33312-0', 'The Shining', 'Horror', 6.00, 'yes', 'Stephen King', 'Doubleday'),
('978-0-451-52993-5', 'Fahrenheit 451', 'Dystopian', 5.50, 'yes', 'Ray Bradbury', 'Ballantine Books'),
('978-0-345-39180-3', 'Dune', 'Science Fiction', 8.50, 'yes', 'Frank Herbert', 'Ace'),
('978-0-375-50167-0', 'The Road', 'Dystopian', 7.00, 'yes', 'Cormac McCarthy', 'Vintage'),
('978-0-06-025492-6', 'Where the Wild Things Are', 'Children', 3.50, 'yes', 'Maurice Sendak', 'HarperCollins'),
('978-0-06-112241-5', 'The Kite Runner', 'Fiction', 5.50, 'yes', 'Khaled Hosseini', 'Riverhead Books'),
('978-0-06-440055-8', 'Charlotte''s Web', 'Children', 4.00, 'yes', 'E.B. White', 'Harper & Row'),
('978-0-679-77644-3', 'Beloved', 'Fiction', 6.50, 'yes', 'Toni Morrison', 'Knopf'),
('978-0-14-027526-3', 'A Tale of Two Cities', 'Classic', 4.50, 'yes', 'Charles Dickens', 'Penguin Books'),
('978-0-7434-7679-3', 'The Stand', 'Horror', 7.00, 'yes', 'Stephen King', 'Doubleday'),
('978-0-451-52994-2', 'Moby Dick', 'Classic', 6.50, 'yes', 'Herman Melville', 'Penguin Books'),
('978-0-06-112008-4', 'To Kill a Mockingbird', 'Classic', 5.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.'),
('978-0-553-57340-1', '1984', 'Dystopian', 6.50, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-7432-4722-5', 'Angels & Demons', 'Mystery', 7.50, 'yes', 'Dan Brown', 'Doubleday'),
('978-0-7432-7356-4', 'The Hobbit', 'Fantasy', 7.00, 'yes', 'J.R.R. Tolkien', 'Houghton Mifflin Harcourt');
select * from books;

-- inserting into issued table
INSERT INTO issued_status(issued_id, issued_member_id, issued_book_name, issued_date, issued_book_isbn, issued_emp_id) 
VALUES
('IS106', 'C106', 'Animal Farm', '2024-03-10', '978-0-330-25864-8', 'E104'),
('IS107', 'C107', 'One Hundred Years of Solitude', '2024-03-11', '978-0-14-118776-1', 'E104'),
('IS108', 'C108', 'The Great Gatsby', '2024-03-12', '978-0-525-47535-5', 'E104'),
('IS109', 'C109', 'Jane Eyre', '2024-03-13', '978-0-141-44171-6', 'E105'),
('IS110', 'C110', 'The Alchemist', '2024-03-14', '978-0-307-37840-1', 'E105'),
('IS111', 'C109', 'Harry Potter and the Sorcerers Stone', '2024-03-15', '978-0-679-76489-8', 'E105'),
('IS112', 'C109', 'A Game of Thrones', '2024-03-16', '978-0-09-957807-9', 'E106'),
('IS113', 'C109', 'A Peoples History of the United States', '2024-03-17', '978-0-393-05081-8', 'E106'),
('IS114', 'C109', 'The Guns of August', '2024-03-18', '978-0-19-280551-1', 'E106'),
('IS115', 'C109', 'The Histories', '2024-03-19', '978-0-14-044930-3', 'E107'),
('IS116', 'C110', 'Guns, Germs, and Steel: The Fates of Human Societies', '2024-03-20', '978-0-393-91257-8', 'E107'),
('IS117', 'C110', '1984', '2024-03-21', '978-0-679-64115-3', 'E107'),
('IS118', 'C101', 'Pride and Prejudice', '2024-03-22', '978-0-14-143951-8', 'E108'),
('IS119', 'C110', 'Brave New World', '2024-03-23', '978-0-452-28240-7', 'E108'),
('IS120', 'C110', 'The Road', '2024-03-24', '978-0-670-81302-4', 'E108'),
('IS121', 'C102', 'The Shining', '2024-03-25', '978-0-385-33312-0', 'E109'),
('IS122', 'C102', 'Fahrenheit 451', '2024-03-26', '978-0-451-52993-5', 'E109'),
('IS123', 'C103', 'Dune', '2024-03-27', '978-0-345-39180-3', 'E109'),
('IS124', 'C104', 'Where the Wild Things Are', '2024-03-28', '978-0-06-025492-6', 'E110'),
('IS125', 'C105', 'The Kite Runner', '2024-03-29', '978-0-06-112241-5', 'E110'),
('IS126', 'C105', 'Charlotte''s Web', '2024-03-30', '978-0-06-440055-8', 'E110'),
('IS127', 'C105', 'Beloved', '2024-03-31', '978-0-679-77644-3', 'E110'),
('IS128', 'C105', 'A Tale of Two Cities', '2024-04-01', '978-0-14-027526-3', 'E110'),
('IS129', 'C105', 'The Stand', '2024-04-02', '978-0-7434-7679-3', 'E110'),
('IS130', 'C106', 'Moby Dick', '2024-04-03', '978-0-451-52994-2', 'E101'),
('IS131', 'C106', 'To Kill a Mockingbird', '2024-04-04', '978-0-06-112008-4', 'E101'),
('IS132', 'C106', 'The Hobbit', '2024-04-05', '978-0-7432-7356-4', 'E106'),
('IS133', 'C107', 'Angels & Demons', '2024-04-06', '978-0-7432-4722-5', 'E106'),
('IS134', 'C107', 'The Diary of a Young Girl', '2024-04-07', '978-0-375-41398-8', 'E106'),
('IS135', 'C107', 'Sapiens: A Brief History of Humankind', '2024-04-08', '978-0-307-58837-1', 'E108'),
('IS136', 'C107', '1491: New Revelations of the Americas Before Columbus', '2024-04-09', '978-0-7432-7357-1', 'E102'),
('IS137', 'C107', 'The Catcher in the Rye', '2024-04-10', '978-0-553-29698-2', 'E103'),
('IS138', 'C108', 'The Great Gatsby', '2024-04-11', '978-0-525-47535-5', 'E104'),
('IS139', 'C109', 'Harry Potter and the Sorcerers Stone', '2024-04-12', '978-0-679-76489-8', 'E105'),
('IS140', 'C110', 'Animal Farm', '2024-04-13', '978-0-330-25864-8', 'E102');
select * from issued_status;

-- inserting into return table
INSERT INTO return_status(return_id, issued_id, return_date) 
VALUES
('RS101', 'IS106', '2023-06-06'),
('RS102', 'IS107', '2023-06-07'),
('RS103', 'IS108', '2023-08-07'),
('RS104', 'IS109', '2024-05-01'),
('RS105', 'IS110', '2024-05-03'),
('RS106', 'IS111', '2024-05-05'),
('RS107', 'IS112', '2024-05-07'),
('RS108', 'IS113', '2024-05-09'),
('RS109', 'IS114', '2024-05-11'),
('RS110', 'IS115', '2024-05-13'),
('RS111', 'IS116', '2024-05-15'),
('RS112', 'IS117', '2024-05-17'),
('RS113', 'IS118', '2024-05-19'),
('RS114', 'IS119', '2024-05-21'),
('RS115', 'IS120', '2024-05-23'),
('RS116', 'IS121', '2024-05-25'),
('RS117', 'IS122', '2024-05-27'),
('RS118', 'IS123', '2024-05-29');
SELECT * FROM return_status;

 select b.branch_address, e.position
 from branch b
 inner join employees e
 on b.branch_id= e.branch_id;
 
 select b.branch_address, e.position
 from branch b
 left join employees e
 on b.branch_id= e.branch_id;
 
 --- right join
 select ist.issued_date as issued_date,
		ist.issued_book_name as book_name,
        mem.member_name as member_name
 from issued_status ist
 right join members mem
 on ist.issued_member_id= mem.member_id
 
 union
 -- full join
  select ist.issued_date as issued_date,
		ist.issued_book_name as book_name,
        mem.member_name as member_name
 from issued_status ist
 left join members mem
 on ist.issued_member_id= mem.member_id
 
  --- right join
 select ist.issued_date as issued_date,
		ist.issued_book_name as book_name,
        mem.member_name as member_name
 from issued_status ist
 right join members mem
 on ist.issued_member_id= mem.member_id
 
 intercept
 
 -- full join
  select ist.issued_date as issued_date,
		ist.issued_book_name as book_name,
        mem.member_name as member_name
 from issued_status ist
 left join members mem
 on ist.issued_member_id= mem.member_id
 
 -- subquery 
 -- find all employee who worked in 
 -- subquery in where 
 
 SELECT e.emp_id,e. emp_name
 FROM employees e
 WHERE branch_id=(
      SELECT branch_id
	  FROM branch
      WHERE branch_address= '123 Main st'
      );
-- subquery in from 
SELECT b.branch_address, emp_counts.total_employees
FROM branch b
INNER JOIN(
SELECT branch_id, COUNT(*) AS total_employees
FROM employees
GROUP BY branch_id
) AS emp_counts
ON b.branch_id= emp_counts.branch_id;

SELECT mem.member_id,
      issued_book_counts.total_book_issued
FROM members mem
INNER JOIN (
     SELECT issued_id,
     issued_member_id,
      COUNT(*) AS total_book_issued
	FROM issued_status
    GROUP BY issued_id
    ) AS issued_book_counts
    ON mem.member_id= issued_book_counts.issued_member_id;
    
    INSERT INTO members(member_id, member_name, member_address, reg_date) 
VALUES
('C101', 'Alice Johnson', '123 Main St', '2021-05-15'),
('C102', 'Bob Smith', '456 Elm St', '2021-06-20'),
('C103', 'Carol Davis', '789 Oak St', '2021-07-10'),
('C104', 'Dave Wilson', '567 Pine St', '2021-08-05'),
('C105', 'Eve Brown', '890 Maple St', '2021-09-25'),
('C106', 'Frank Thomas', '234 Cedar St', '2021-10-15'),
('C107', 'Grace Taylor', '345 Walnut St', '2021-11-20'),
('C108', 'Henry Anderson', '456 Birch St', '2021-12-10'),
('C109', 'Ivy Martinez', '567 Oak St', '2022-01-05'),
('C110', 'Jack Wilson', '678 Pine St', '2022-02-25'),
('C118', 'Sam', '133 Pine St', '2024-06-01'),    
('C119', 'John', '143 Main St', '2024-05-01');
SELECT * FROM members;


-- Insert values into each branch table
INSERT INTO branch(branch_id, manager_id, branch_address, contact_no) 
VALUES
('B001', 'E109', '123 Main St', '+919099988676'),
('B002', 'E109', '456 Elm St', '+919099988677'),
('B003', 'E109', '789 Oak St', '+919099988678'),
('B004', 'E110', '567 Pine St', '+919099988679'),
('B005', 'E110', '890 Maple St', '+919099988680');
SELECT * FROM branch;


-- Insert values into each employees table
INSERT INTO employees(emp_id, emp_name, position, salary, branch_id) 
VALUES
('E101', 'John Doe', 'Clerk', 60000.00, 'B001'),
('E102', 'Jane Smith', 'Clerk', 45000.00, 'B002'),
('E103', 'Mike Johnson', 'Librarian', 55000.00, 'B001'),
('E104', 'Emily Davis', 'Assistant', 40000.00, 'B001'),
('E105', 'Sarah Brown', 'Assistant', 42000.00, 'B001'),
('E106', 'Michelle Ramirez', 'Assistant', 43000.00, 'B001'),
('E107', 'Michael Thompson', 'Clerk', 62000.00, 'B005'),
('E108', 'Jessica Taylor', 'Clerk', 46000.00, 'B004'),
('E109', 'Daniel Anderson', 'Manager', 57000.00, 'B003'),
('E110', 'Laura Martinez', 'Manager', 41000.00, 'B005'),
('E111', 'Christopher Lee', 'Assistant', 65000.00, 'B005');
SELECT * FROM employees;


-- Inserting into books table 
INSERT INTO books(isbn, book_title, category, rental_price, status, author, publisher) 
VALUES
('978-0-553-29698-2', 'The Catcher in the Rye', 'Classic', 7.00, 'yes', 'J.D. Salinger', 'Little, Brown and Company'),
('978-0-330-25864-8', 'Animal Farm', 'Classic', 5.50, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-14-118776-1', 'One Hundred Years of Solitude', 'Literary Fiction', 6.50, 'yes', 'Gabriel Garcia Marquez', 'Penguin Books'),
('978-0-525-47535-5', 'The Great Gatsby', 'Classic', 8.00, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
('978-0-141-44171-6', 'Jane Eyre', 'Classic', 4.00, 'yes', 'Charlotte Bronte', 'Penguin Classics'),
('978-0-307-37840-1', 'The Alchemist', 'Fiction', 2.50, 'yes', 'Paulo Coelho', 'HarperOne'),
('978-0-679-76489-8', 'Harry Potter and the Sorcerers Stone', 'Fantasy', 7.00, 'yes', 'J.K. Rowling', 'Scholastic'),
('978-0-7432-4722-4', 'The Da Vinci Code', 'Mystery', 8.00, 'yes', 'Dan Brown', 'Doubleday'),
('978-0-09-957807-9', 'A Game of Thrones', 'Fantasy', 7.50, 'yes', 'George R.R. Martin', 'Bantam'),
('978-0-393-05081-8', 'A Peoples History of the United States', 'History', 9.00, 'yes', 'Howard Zinn', 'Harper Perennial'),
('978-0-19-280551-1', 'The Guns of August', 'History', 7.00, 'yes', 'Barbara W. Tuchman', 'Oxford University Press'),
('978-0-307-58837-1', 'Sapiens: A Brief History of Humankind', 'History', 8.00, 'no', 'Yuval Noah Harari', 'Harper Perennial'),
('978-0-375-41398-8', 'The Diary of a Young Girl', 'History', 6.50, 'no', 'Anne Frank', 'Bantam'),
('978-0-14-044930-3', 'The Histories', 'History', 5.50, 'yes', 'Herodotus', 'Penguin Classics'),
('978-0-393-91257-8', 'Guns, Germs, and Steel: The Fates of Human Societies', 'History', 7.00, 'yes', 'Jared Diamond', 'W. W. Norton & Company'),
('978-0-7432-7357-1', '1491: New Revelations of the Americas Before Columbus', 'History', 6.50, 'no', 'Charles C. Mann', 'Vintage Books'),
('978-0-679-64115-3', '1984', 'Dystopian', 6.50, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-14-143951-8', 'Pride and Prejudice', 'Classic', 5.00, 'yes', 'Jane Austen', 'Penguin Classics'),
('978-0-452-28240-7', 'Brave New World', 'Dystopian', 6.50, 'yes', 'Aldous Huxley', 'Harper Perennial'),
('978-0-670-81302-4', 'The Road', 'Dystopian', 7.00, 'yes', 'Cormac McCarthy', 'Knopf'),
('978-0-385-33312-0', 'The Shining', 'Horror', 6.00, 'yes', 'Stephen King', 'Doubleday'),
('978-0-451-52993-5', 'Fahrenheit 451', 'Dystopian', 5.50, 'yes', 'Ray Bradbury', 'Ballantine Books'),
('978-0-345-39180-3', 'Dune', 'Science Fiction', 8.50, 'yes', 'Frank Herbert', 'Ace'),
('978-0-375-50167-0', 'The Road', 'Dystopian', 7.00, 'yes', 'Cormac McCarthy', 'Vintage'),
('978-0-06-025492-6', 'Where the Wild Things Are', 'Children', 3.50, 'yes', 'Maurice Sendak', 'HarperCollins'),
('978-0-06-112241-5', 'The Kite Runner', 'Fiction', 5.50, 'yes', 'Khaled Hosseini', 'Riverhead Books'),
('978-0-06-440055-8', 'Charlotte''s Web', 'Children', 4.00, 'yes', 'E.B. White', 'Harper & Row'),
('978-0-679-77644-3', 'Beloved', 'Fiction', 6.50, 'yes', 'Toni Morrison', 'Knopf'),
('978-0-14-027526-3', 'A Tale of Two Cities', 'Classic', 4.50, 'yes', 'Charles Dickens', 'Penguin Books'),
('978-0-7434-7679-3', 'The Stand', 'Horror', 7.00, 'yes', 'Stephen King', 'Doubleday'),
('978-0-451-52994-2', 'Moby Dick', 'Classic', 6.50, 'yes', 'Herman Melville', 'Penguin Books'),
('978-0-06-112008-4', 'To Kill a Mockingbird', 'Classic', 5.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.'),
('978-0-553-57340-1', '1984', 'Dystopian', 6.50, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-7432-4722-5', 'Angels & Demons', 'Mystery', 7.50, 'yes', 'Dan Brown', 'Doubleday'),
('978-0-7432-7356-4', 'The Hobbit', 'Fantasy', 7.00, 'yes', 'J.R.R. Tolkien', 'Houghton Mifflin Harcourt');
select * from books;

-- inserting into issued table
INSERT INTO issued_status(issued_id, issued_member_id, issued_book_name, issued_date, issued_book_isbn, issued_emp_id) 
VALUES
('IS106', 'C106', 'Animal Farm', '2024-03-10', '978-0-330-25864-8', 'E104'),
('IS107', 'C107', 'One Hundred Years of Solitude', '2024-03-11', '978-0-14-118776-1', 'E104'),
('IS108', 'C108', 'The Great Gatsby', '2024-03-12', '978-0-525-47535-5', 'E104'),
('IS109', 'C109', 'Jane Eyre', '2024-03-13', '978-0-141-44171-6', 'E105'),
('IS110', 'C110', 'The Alchemist', '2024-03-14', '978-0-307-37840-1', 'E105'),
('IS111', 'C109', 'Harry Potter and the Sorcerers Stone', '2024-03-15', '978-0-679-76489-8', 'E105'),
('IS112', 'C109', 'A Game of Thrones', '2024-03-16', '978-0-09-957807-9', 'E106'),
('IS113', 'C109', 'A Peoples History of the United States', '2024-03-17', '978-0-393-05081-8', 'E106'),
('IS114', 'C109', 'The Guns of August', '2024-03-18', '978-0-19-280551-1', 'E106'),
('IS115', 'C109', 'The Histories', '2024-03-19', '978-0-14-044930-3', 'E107'),
('IS116', 'C110', 'Guns, Germs, and Steel: The Fates of Human Societies', '2024-03-20', '978-0-393-91257-8', 'E107'),
('IS117', 'C110', '1984', '2024-03-21', '978-0-679-64115-3', 'E107'),
('IS118', 'C101', 'Pride and Prejudice', '2024-03-22', '978-0-14-143951-8', 'E108'),
('IS119', 'C110', 'Brave New World', '2024-03-23', '978-0-452-28240-7', 'E108'),
('IS120', 'C110', 'The Road', '2024-03-24', '978-0-670-81302-4', 'E108'),
('IS121', 'C102', 'The Shining', '2024-03-25', '978-0-385-33312-0', 'E109'),
('IS122', 'C102', 'Fahrenheit 451', '2024-03-26', '978-0-451-52993-5', 'E109'),
('IS123', 'C103', 'Dune', '2024-03-27', '978-0-345-39180-3', 'E109'),
('IS124', 'C104', 'Where the Wild Things Are', '2024-03-28', '978-0-06-025492-6', 'E110'),
('IS125', 'C105', 'The Kite Runner', '2024-03-29', '978-0-06-112241-5', 'E110'),
('IS126', 'C105', 'Charlotte''s Web', '2024-03-30', '978-0-06-440055-8', 'E110'),
('IS127', 'C105', 'Beloved', '2024-03-31', '978-0-679-77644-3', 'E110'),
('IS128', 'C105', 'A Tale of Two Cities', '2024-04-01', '978-0-14-027526-3', 'E110'),
('IS129', 'C105', 'The Stand', '2024-04-02', '978-0-7434-7679-3', 'E110'),
('IS130', 'C106', 'Moby Dick', '2024-04-03', '978-0-451-52994-2', 'E101'),
('IS131', 'C106', 'To Kill a Mockingbird', '2024-04-04', '978-0-06-112008-4', 'E101'),
('IS132', 'C106', 'The Hobbit', '2024-04-05', '978-0-7432-7356-4', 'E106'),
('IS133', 'C107', 'Angels & Demons', '2024-04-06', '978-0-7432-4722-5', 'E106'),
('IS134', 'C107', 'The Diary of a Young Girl', '2024-04-07', '978-0-375-41398-8', 'E106'),
('IS135', 'C107', 'Sapiens: A Brief History of Humankind', '2024-04-08', '978-0-307-58837-1', 'E108'),
('IS136', 'C107', '1491: New Revelations of the Americas Before Columbus', '2024-04-09', '978-0-7432-7357-1', 'E102'),
('IS137', 'C107', 'The Catcher in the Rye', '2024-04-10', '978-0-553-29698-2', 'E103'),
('IS138', 'C108', 'The Great Gatsby', '2024-04-11', '978-0-525-47535-5', 'E104'),
('IS139', 'C109', 'Harry Potter and the Sorcerers Stone', '2024-04-12', '978-0-679-76489-8', 'E105'),
('IS140', 'C110', 'Animal Farm', '2024-04-13', '978-0-330-25864-8', 'E102');
select * from issued_status;

-- inserting into return table
INSERT INTO return_status(return_id, issued_id, return_date) 
VALUES
('RS101', 'IS106', '2023-06-06'),
('RS102', 'IS107', '2023-06-07'),
('RS103', 'IS108', '2023-08-07'),
('RS104', 'IS109', '2024-05-01'),
('RS105', 'IS110', '2024-05-03'),
('RS106', 'IS111', '2024-05-05'),
('RS107', 'IS112', '2024-05-07'),
('RS108', 'IS113', '2024-05-09'),
('RS109', 'IS114', '2024-05-11'),
('RS110', 'IS115', '2024-05-13'),
('RS111', 'IS116', '2024-05-15'),
('RS112', 'IS117', '2024-05-17'),
('RS113', 'IS118', '2024-05-19'),
('RS114', 'IS119', '2024-05-21'),
('RS115', 'IS120', '2024-05-23'),
('RS116', 'IS121', '2024-05-25'),
('RS117', 'IS122', '2024-05-27'),
('RS118', 'IS123', '2024-05-29');
SELECT * FROM return_status;

-- 2.  RANK () and DENSE_RANK ()
-- RANK() - gives ranking with gapsif there are ties.
-- DENSE_RANK() - sazme as rank but no gaps.

-- Rank books by how many times they were borrowed:
Select issue_id, count(*) as total_borrows,
rank() over(order by count(*) desc) as row_num
from issued_status
group by issued_id;

SELECT COUNT(*) FROM branch;
SELECT COUNT(*) FROM employees;
SELECT COUNT(*) FROM books;
SELECT COUNT(*) FROM members;
SELECT COUNT(*) FROM issued_status;
SELECT COUNT(*) FROM return_status;

CREATE TABLE branch (
branch_id VARCHAR(10) PRIMARY KEY,
manager_id VARCHAR(10),
branch_address VARCHAR(50),
contact_no VARCHAR(10)
);
ALTER TABLE branch MODIFY COLUMN contact_no VARCHAR(20);

SELECT
issued_member_id,
issued_id,
issued_date,
issued_book_name,
ROW_NUMBER() OVER (PARTITION BY issued_member_id ORDER BY issued_date) AS row_num
FROM issued_status;

ALTER TABLE return_status
ADD COLUMN return_book_name VARCHAR(75),
ADD COLUMN return_book_isbn VARCHAR(25);

SELECT
return_id,
issued_id,
return_book_name,
return_date,
return_book_isbn AS return_book_isbn,
ROW_NUMBER() OVER (PARTITION BY issued_id ORDER BY return_date) AS row_num
FROM return_status;

DESC return_status;

SELECT
issued_member_id,
issued_id,
issued_date,
issued_book_name,
ROW_NUMBER() OVER
(PARTITION BY issued_member_id ORDER BY issued_date) AS row_num
FROM issued_status;

-- 2. RANK() and DENSE_RANK()
-- RANK ()
-- DENSE_RANK () -> same as rank but no gaps

-- Rank books by how many times they were borrowed

select issued_id, count(*) as total_borrows,
rank () over (order by count(*) desc) as row_num
from issued_status
group by issued_id;

-- LEAD() AND LAG()
-- LAG() -> access the previous row's value.
-- LEAD() -> access the next row's value.

-- LEAD() and LAG()
-- LAG()- access the previous row's value.
-- LEAD()- access the next row's value. 

select issued_book_name, issued_id, count(*) as total_borrows,
rank() over (order by count(*) desc) as row_num
from issued_status
group by 1,2;

select issued_book_isbn, issued_book_name, count(*) as total_borrows,
rank() over (order by count(*) desc) as row_num
from issued_status
group by 1,2;

SELECT issued_book_isbn 

-- LEAD() AND LAG()
-- Track each member's borrowing history with the gap between book:

Select issued_member_id, issued_id, issued_date,
    LAG(issued_date)
    OVER (PARTITION BY issued_member_id
    ORDER BY issued_date) AS prev_issued_date,
    DATEDIFF(issued_date, LAG(issued_date)
    OVER (PARTITION BY issued_member_id
    ORDER BY issued_date)) AS days_since_last_issue
    FROM issued_status;
create schema Alabamanzo;
use Alabamanzo;

select * from books;
select * from branch;
select * from employees;
select * from issued_status;
select * from members;
select * from return_status;

-- inner join two tables branch and employee on branch id
-- create table employee_branch
-- as
select b.branch_address, e.position
from branch b
inner join employees e
on b.branch_id = e.branch_id;


-- outer join two tables

select ist.issued_date as issued_date,
	ist.issued_book_name as book_name,
	mem.member_name as member_name
from issued_status ist
left join members mem
on ist.issued_member_id = mem.member_id;

-- right join
select ist.issued_date as issued_date,
	ist.issued_book_name as book_name,
	mem.member_name as member_name
from issued_status ist
right join members mem
on ist.issued_member_id = mem.member_id; 

-- full join
select ist.issued_date as issued_date,
	ist.issued_book_name as book_name,
	mem.member_name as member_name
from issued_status ist
left join members mem

on ist.issued_member_id = mem.member_id

union

select ist.issued_date as issued_date,
	ist.issued_book_name as book_name,
	mem.member_name as member_name
from issued_status ist
right join members mem
on ist.issued_member_id = mem.member_id; 

-- Subquery 
-- find all employee who worked in 
-- subquery in where

SELECT e.emp_id, e.emp_name
FROM employees e
WHERE branch_id = (
    SELECT branch_id
    FROM branch
    WHERE branch_address = '123 Main st'
);


-- subquery in from
SELECT b.branch_address, emp_counts.total_employees
FROM branch b
INNER JOIN (
    SELECT branch_id, COUNT(*) AS total_employees
    FROM employees
    GROUP BY branch_id
) AS emp_counts
ON b.branch_id = emp_counts.branch_id;

SELECT mem.member_id,  
    issued_book_counts.total_book_issued
FROM members mem
INNER JOIN (
    SELECT issued_id, 
        issued_member_id, 
        COUNT(*) AS total_book_issued
    FROM issued_status
    GROUP BY 1
) AS issued_book_counts
ON mem.member_id = issued_book_counts.issued_member_id;

-- subquery in select

SELECT 
	b.branch_id, 
    b.branch_address,
       (SELECT COUNT(*) FROM employees e WHERE e.branch_id = b.branch_id) AS employee_count
FROM branch b;



-- 2. Apply set operations (UNION, INTERSECT, EXCEPT) for data analysis.


-- Returns only the rows that are present in both queries.

-- MySQL does not support INTERSECT directly, 
-- but you can simulate it with an INNER JOIN or IN.


-- Find All book issued that have been returned
SELECT issued_id
FROM issued_status
WHERE issued_id IN (SELECT issued_id FROM return_status);

-- List of employees that has issued a book and their salaries 
select e.emp_id, e.emp_name, e.salary,e.branch_id  from employees e
where e.emp_id in (select emp_id from issued_status);


-- Returns rows from the first query that are not in the second.
-- MySQL does not support EXCEPT directly,
-- but you can simulate it with LEFT JOIN + WHERE NULL or NOT IN.

-- Find all books that have been issued but not returned yet
SELECT issued_id, issued_book_name
FROM issued_status
WHERE issued_id NOT IN (SELECT issued_id FROM return_status);

SELECT i.issued_id, i.issued_book_name
FROM issued_status i
LEFT JOIN return_status r ON i.issued_id = r.issued_id
WHERE r.issued_id IS NULL;

select * from return_status;

-- <--> Use window functions (ROW_NUMBER, RANK, LEAD, LAG) for advanced data analysis.

-- List all issued books with a row number per member (to see the order of their borrowings):
SELECT 
	issued_member_id, 
    issued_id,
    issued_date,
    issued_book_name,
       ROW_NUMBER() OVER 
       (PARTITION BY issued_member_id ORDER BY issued_date) 
       AS row_num
FROM issued_status;


-- 2. RANK() and DENSE_RANK() 
-- RANK() → gives ranking with gaps if there are ties.
-- DENSE_RANK() → same as rank but no gaps.

-- Rank books by how many times they were borrowed:
select issued_book_isbn,issued_book_name, count(*) as total_borrows,
rank() over (order by count(*) desc) as row_num
from issued_status
group by 1,2;
select * FROM BOOKS; 

select * from issued_status;

-- LEAD() and LAG()
-- LAG() → access the previous row’s value.
-- LEAD() → access the next row’s value.

-- Track each member’s borrowing history with the gap between books:
SELECT issued_member_id, issued_id, issued_date,
       LAG(issued_date) 
       OVER (PARTITION BY issued_member_id 
       ORDER BY issued_date) AS prev_issue_date,
       DATEDIFF(issued_date, LAG(issued_date) 
       OVER (PARTITION BY issued_member_id 
       ORDER BY issued_date)) AS days_since_last_issue
FROM issued_status;

SELECT return_id, issued_id, return_date,
       LAG(return_date) OVER (PARTITION BY return_id ORDER BY return_date) AS previous_return,
       LEAD(return_date) OVER (PARTITION BY return_id ORDER BY return_date) AS next_return
FROM return_status;


-- A CTE (introduced with WITH) is like a temporary named result set you can reuse inside your query.
-- It makes complex queries more readable than using nested subqueries.
 
 -- count borrows per books and rank them
 
WITH borrow_counts AS (
    SELECT issued_id, COUNT(*) AS total_borrows
    FROM issued_status
    GROUP BY issued_id
)
SELECT issued_id, total_borrows,
       RANK() OVER (ORDER BY total_borrows DESC) AS borrow_rank
FROM borrow_counts;

-- 2. Find members who borrowed more than 5 books
WITH member_borrows AS (
    SELECT issued_member_id, COUNT(*) AS total_borrows
    FROM issued_status
    GROUP BY issued_member_id
)
SELECT issued_member_id, total_borrows
FROM member_borrows
WHERE total_borrows > 5;

-- OLAP-style queries in SQL:
--  GROUPING SETS, ROLLUP, and CUBE allow multidimensional aggregations without writing multiple queries.

-- 1. GROUPING SETS
-- Lets you define exactly which groupings you want.
-- Think of it as multiple GROUP BY queries combined into one.
-- Example: Count books borrowed per branch, per member, and overall:

-- Borrow count per member + per book + grand total
-- Borrow count per member
SELECT issued_member_id, NULL AS issued_book_isbn, COUNT(*) AS total_borrows
FROM issued_status
GROUP BY issued_member_id

UNION ALL

-- Borrow count per book
SELECT NULL AS issued_member_id, issued_book_isbn, COUNT(*) AS total_borrows
FROM issued_status
GROUP BY issued_book_isbn

UNION ALL

-- Grand total
SELECT NULL AS issued_member_id, NULL AS issued_book_isbn, COUNT(*) AS total_borrows
FROM issued_status;


-- Borrow count per member (with subtotals & grand total)
SELECT issued_member_id, COUNT(*) AS total_borrows
FROM issued_status
GROUP BY issued_member_id WITH ROLLUP;

-- Borrow count hierarchy: Member → Book → Total (using ROLLUP)
SELECT issued_member_id, issued_book_isbn, COUNT(*) AS total_borrows
FROM issued_status
GROUP BY issued_member_id, issued_book_isbn WITH ROLLUP;

-- string manipulation and date functions in SQL, 
-- which are very useful for data cleansing before doing deeper analysis.

-- String Functions for Data Cleansing
-- MySQL provides many functions to clean and format text data.
-- removing white spaces

SELECT TRIM('   Odey Philip   ') AS cleaned_name;
-- Result: 'Odey Philip'

-- removing left trim
SELECT LTRIM('   Odey Philip   ') AS cleaned_name;
-- Result: 'Odey Philip '

-- removing right trim
SELECT RTRIM('   Odey Philip   ') AS cleaned_name;
-- Result: ' Odey Philip'

-- Substring Extraction
SELECT SUBSTRING(issued_book_isbn, 1, 3) AS isbn_prefix
FROM issued_status;

-- replace unwanted characters
SELECT REPLACE('LIB-001-OLD', 'OLD', 'NEW') AS fixed_code;

-- concatenate 
SELECT CONCAT(issued_member_id, '-', issued_book_isbn) AS member_book_key
FROM issued_status;

-- Extract year, month, day
SELECT 
    YEAR(issued_date) AS issue_year,
    MONTH(issued_date) AS issue_month,
    DAY(issued_date) AS issue_day
FROM issued_status;



-- Format dates consistently
SELECT DATE_FORMAT(issued_date, '%Y-%m-%d') AS formatted_date
FROM issued_status;


SELECT DATEDIFF(return_date, issued_date) AS days_borrowed
FROM issued_status i
JOIN return_status r ON i.issued_id = r.return_id;

-- Book due date = issue date + 14 days
SELECT issued_date, 
       DATE_ADD(issued_date, INTERVAL 14 DAY) AS due_date
FROM issued_status;

-- Categorize members into "Heavy Borrower" vs "Light Borrower"
SELECT 
    issued_member_id,
    COUNT(*) AS total_borrows,
    CASE 
        WHEN COUNT(*) >= 20 THEN 'Heavy Borrower'
        WHEN COUNT(*) BETWEEN 10 AND 19 THEN 'Moderate Borrower'
        ELSE 'Light Borrower'
    END AS borrower_category
FROM issued_status
GROUP BY issued_member_id;

-- You can check how many books of each category have been issued
SELECT 
    b.category,
    COUNT(*) AS total_issued,
    COUNT(CASE WHEN b.status = 'available' THEN 1 END) AS available_books,
    COUNT(CASE WHEN b.status = 'issued' THEN 1 END) AS issued_books
FROM books b
LEFT JOIN issued_status i 
       ON b.isbn = i.issued_book_isbn
GROUP BY b.category;

-- Employee performance — total books issued by each staff
SELECT 
    e.emp_id,
    e.emp_name,
    COUNT(i.issued_id) AS total_books_issued,
    CASE 
        WHEN COUNT(i.issued_id) >= 30 THEN 'Excellent'
        WHEN COUNT(i.issued_id) BETWEEN 15 AND 29 THEN 'Good'
        WHEN COUNT(i.issued_id) BETWEEN 1 AND 14 THEN 'Low Activity'
        ELSE 'No Activity'
    END AS performance_rating
FROM employees e
LEFT JOIN issued_status i
       ON e.emp_id = i.issued_emp_id
GROUP BY e.emp_id, e.emp_name;

-- Userstanding indexing
SELECT * 
FROM issued_status 
WHERE issued_member_id = 'C102';
CREATE INDEX idx_issued_member ON issued_status(issued_member_id);

-- We have difference types of index 
-- Single column index

CREATE INDEX idx_book_isbn ON books(isbn);

-- Composite (Multi-column) index
CREATE INDEX idx_member_date ON issued_status(issued_member_id, issued_date);
SELECT * FROM issued_status 
WHERE issued_member_id = 'M102' 
or issued_date BETWEEN '2024-01-01' AND '2024-12-31';

-- unique index 
-- Automatically created when you declare a column as PRIMARY KEY or UNIQUE.
ALTER TABLE members 
ADD CONSTRAINT unique_member_name UNIQUE (member_name);


-- Fulltext Index (for searching text)
-- If you search through long text fields (like book titles):

CREATE FULLTEXT INDEX idx_book_title ON books(book_title);
SELECT * FROM books
WHERE MATCH(book_title) AGAINST ('the');

-- Viewing and Removing Indexes
-- View all indexes:
SHOW INDEXES FROM issued_status;

-- Drop an index:
DROP INDEX idx_issued_member ON issued_status;


-- Meaning of columns:
-- table → which table is being accessed
-- type → access method (e.g., ALL, ref, eq_ref, index, etc.)
-- key → index actually used
-- rows → estimated rows scanned
-- Extra → notes like “Using where”, “Using temporary”, “Using filesort”

-- you’re now entering the query optimization stage, which is where professionals really make SQL fly
EXPLAIN SELECT * 
FROM issued_status
WHERE issued_member_id = 'C102';

-- EXPLAIN ANALYZE actually runs the query and shows real execution time, not just an estimate.


EXPLAIN analyze select * 
FROM issued_status
WHERE issued_member_id = 'C102';

CREATE INDEX idx_issued_member ON issued_status(issued_member_id);
CREATE INDEX idx_issued_book ON issued_status(issued_book_isbn);
EXPLAIN 
SELECT m.member_name, b.book_title 
FROM members m
JOIN issued_status i ON m.member_id = i.issued_member_id
JOIN books b ON i.issued_book_isbn = b.isbn;

EXPLAIN 
SELECT m.member_name, b.book_title 
FROM members m
JOIN issued_status i ON m.member_id = i.issued_member_id
JOIN books b ON i.issued_book_isbn = b.isbn;

-- count borrowsper books and rank them
WITH borrow_counts AS(
SELECT issued_id, COUNT(*) AS total_borrows
FROM issued_status
group by issued_id
)
SELECT issued_id, total_borrows,
  RANK() OVER(ORDER BY total_borrows DESC) AS borrow_rank
  From borrow_counts;
-- 2. Find members who borrowed more than 5 books 
WITH members_borrows AS(
Select issued_member_id, COUNT(*) AS total_borrows
FROM isssued_status 
GROUP BY issued_member_id 
)
SELECT issued_member_id, total_borrows
FROM member_borrows
WHERE total_borrows >5;


