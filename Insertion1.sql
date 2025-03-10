INSERT INTO department ( id,dept_name) VALUES
(1,'Computer Science'),
(2,'Information Technology'),
(3,'Software Engineering');



INSERT INTO Student (id, fname, lname, city, street, dept_id) VALUES
(101, 'Alice', 'Johnson', 'New York', '5th Ave', 1),
(102, 'Bob', 'Smith', 'Los Angeles', 'Sunset Blvd', 2),
(103, 'Charlie', 'Davis', 'Chicago', 'Michigan Ave', 1),
(104, 'David', 'Miller', 'Houston', 'Main St', 3),
(105, 'Eve', 'Wilson', 'Miami', 'Ocean Dr', 2);


INSERT INTO Topic (id, topic_name) VALUES
(1, 'Web Development'),
(2, 'Database Management'),
(3, 'Software Development'),
(4, 'Low-Level Programming'),
(5, 'OOP Principles');


INSERT INTO Course (id, c_name, topic_id) VALUES
(201, 'HTML', 1),
(202, 'Object-Oriented Programming (OOP)', 5),
(203, 'SQL Server', 2),
(204, 'C# Programming', 3),
(205, 'C Programming', 4);


INSERT INTO Instructor (id, fname, dept_id) VALUES
(301, 'Dr. Smith', 1),
(302, 'Dr. Taylor', 2),
(303, 'Dr. Brown', 3),
(304, 'Dr. White', 1),
(305, 'Dr. Green', 2);


INSERT INTO Instructor_Course (ins_id, c_id) VALUES
(301, 201),
(302, 202),
(303, 203),
(304, 204),
(305, 205),
(301, 204),
(302, 201);