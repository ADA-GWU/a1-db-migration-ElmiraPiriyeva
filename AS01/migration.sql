BEGIN TRANSACTION;

CREATE TABLE students_archived (
	st_id INT PRIMARY KEY,
	st_name VARCHAR(15) NOT NULL,
	st_last VARCHAR(15) NOT NULL
);


CREATE TABLE interests_archived(
	student_id INT NOT NULL,
	interest VARCHAR(15) NOT NULL,
	FOREIGN KEY (student_id) REFERENCES students(st_id)
);


INSERT INTO students_archived 
SELECT * FROM students;

INSERT INTO interests_archived 
SELECT * FROM interests;


ALTER TABLE students RENAME COLUMN st_id TO student_id;
ALTER TABLE students ALTER COLUMN st_name TYPE varchar(30);
ALTER TABLE students ALTER COLUMN st_last TYPE varchar(30);

DROP TABLE interests;

CREATE TABLE interests(
	student_id INT NOT NULL,
	interest TEXT[] NOT NULL,
	FOREIGN KEY (student_id) REFERENCES students(student_id)
);


INSERT INTO interests(student_id,interest)
SELECT student_id,array_agg(interest) FROM interests_archived
GROUP by student_id
ORDER by student_id ASC;


COMMIT;