CREATE TABLE students(
student_id SERIAL PRIMARY KEY,
student_name VARCHAR(50),
city VARCHAR(50)
);


CREATE TABLE courses(
course_id SERIAL PRIMARY KEY,
course_name VARCHAR(50),
price INT
);


CREATE TABLE enrollments(
enroll_id SERIAL PRIMARY KEY,
student_id INT,
course_id INT,
enroll_date DATE,
FOREIGN KEY(student_id) REFERENCES students(student_id),
FOREIGN KEY(course_id) REFERENCES courses(course_id)
);


INSERT INTO students(student_name,city) VALUES
('Ali','Karachi'),
('Sara','Lahore'),
('Ahmed','Islamabad'),
('John','Multan'),
('Mike','Karachi');


INSERT INTO courses(course_name,price) VALUES
('SQL',200),
('Python',300),
('Data Science',500),
('Machine Learning',600),
('Power BI',250);


INSERT INTO enrollments(student_id,course_id,enroll_date) VALUES
(1,1,'2025-01-01'),
(1,2,'2025-01-05'),
(2,1,'2025-01-10'),
(2,3,'2025-02-01'),
(3,2,'2025-02-10'),
(3,4,'2025-03-01'),
(4,1,'2025-03-05'),
(5,5,'2025-03-07'),
(1,5,'2025-03-08');


-- Task 1
-- Show student name , course name

SELECT s.student_name, c.course_name
FROM enrollments e
JOIN students s
ON e.student_id = s.student_id
JOIN courses c
ON e.course_id = c.course_id;


-- Task 2
-- Show total courses per student

SELECT s.student_name, COUNT(c.course_id) AS total_courses
FROM enrollments e
JOIN students s
ON e.student_id = s.student_id
JOIN courses c
ON e.course_id = c.course_id
GROUP BY s.student_name;



-- Task 3
-- Show total students per course


SELECT c.course_name, COUNT(s.student_id) total_students
FROM enrollments e
JOIN students s
ON e.student_id = s.student_id
JOIN courses c
ON e.course_id = c.course_id
GROUP BY c.course_name;



-- Task 4
-- Find students enrolled in more than 1 course

SELECT s.student_name, COUNT(e.course_id) AS total_courses
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id
GROUP BY s.student_name
HAVING COUNT(e.course_id) > 1;


-- Task 5
-- Find the most popular course


SELECT c.course_name, COUNT(e.student_id) AS total_students
FROM courses c
JOIN enrollments e
ON c.course_id = e.course_id
GROUP BY c.course_name
ORDER BY total_students DESC
LIMIT 1;



-- Task 6
-- Show total revenue per course


SELECT c.course_name, SUM(c.price) AS total_revenue
FROM enrollments e
JOIN courses c
ON e.course_id = c.course_id
GROUP BY c.course_name;


-- Task 7
-- Find students who enrolled in SQL


SELECT c.course_name,s.student_name
FROM enrollments e
JOIN courses c
ON c.course_id = e. course_id
JOIN students s
ON s.student_id = e.student_id
WHERE c.course_name = 'SQL';


-- Task 8
-- Find students not enrolled in any course


SELECT s.student_name
FROM students s
LEFT JOIN enrollments e
ON s.student_id = e.student_id
WHERE e.enroll_id IS NULL;



-- Task 9
-- Find the student who enrolled in the most courses



SELECT s.student_name, COUNT(e.course_id) AS total_courses
FROM students s
JOIN enrollments e
ON e.student_id = s.student_id
GROUP BY s.student_name
ORDER BY total_courses DESC
LIMIT 1;



-- Task 10 
-- Show:
-- student name
-- total money spent


SELECT s.student_name, SUM(c.price) AS total_spent
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id
JOIN courses c
ON c.course_id = e.course_id
GROUP BY s.student_name;

