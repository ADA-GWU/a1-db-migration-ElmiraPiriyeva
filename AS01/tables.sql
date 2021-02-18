BEGIN TRANSACTION;

CREATE TABLE students (
	st_id INT PRIMARY KEY,
	st_name VARCHAR(15) NOT NULL,
	st_last VARCHAR(15) NOT NULL
);

insert into students (st_id,st_name,st_last) values (1,'Elmira','Piriyeva');
insert into students (st_id,st_name,st_last) values (2, 'Sabina', 'Mammadova');
insert into students (st_id,st_name,st_last) values (3, 'Aynur', 'Huseynova');

CREATE TABLE interests(
	student_id INT NOT NULL,
	interest VARCHAR(15) NOT NULL,
	FOREIGN KEY (student_id) REFERENCES students(st_id)
);

insert into interests (student_id,interest) values (1,'Tennis');
insert into interests (student_id,interest) values (1,'Literature');
insert into interests (student_id,interest) values (1,'Math');
insert into interests (student_id,interest) values (2,'Tennis');
insert into interests (student_id,interest) values (3,'Math');
insert into interests (student_id,interest) values (3,'Music');
insert into interests (student_id,interest) values (2,'Footbal');
insert into interests (student_id,interest) values (1,'Chemistry');
insert into interests (student_id,interest) values (3,'Chess');


COMMIT;