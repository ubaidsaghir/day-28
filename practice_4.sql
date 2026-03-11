CREATE TABLE students(
std_id SERIAL PRIMARY KEY,
name VARCHAR(50)
);

CREATE TABLE courses(
c_id SERIAL PRIMARY KEY,
name VARCHAR(50),
fee NUMERIC
);

CREATE TABLE enrollment(
enroll_id SERIAL PRIMARY KEY,
std_id INT,
c_id INT,
enroll_date DATE,
FOREIGN KEY (std_id) REFERENCES students(std_id),
FOREIGN KEY (c_id) REFERENCES courses(c_id)
);

INSERT INTO students(name)
VALUES
('Ubaid'),
('Raheel'),
('Adeel');


INSERT INTO courses(name,fee)
VALUES
('Math',500),
('Bio',600),
('Physics',700);

INSERT INTO enrollment(std_id,c_id,enroll_date)
VALUES
(1,1,'2024-01-01'),
(1,2,'2024-01-15'),
(2,1,'2024-02-01'),
(2,3,'2024-02-15'),
(3,3,'2024-03-25');


SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollment;


SELECT s.name,c.name,e.enroll_date,c.fee
FROM enrollment e
JOIN students s 
ON s.std_id = e.std_id
JOIN courses c
ON c.c_id = e.c_id;