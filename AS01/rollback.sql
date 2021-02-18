BEGIN TRANSACTION;

DROP TABLE students cascade;
DROP TABLE interests cascade;

ALTER TABLE students_archived RENAME TO students;
ALTER TABLE interests_archived RENAME TO interests;

COMMIT;
