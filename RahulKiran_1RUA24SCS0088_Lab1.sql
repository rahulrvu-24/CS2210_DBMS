-- Step 1: Create a new database
CREATE DATABASE db_lab;
-- Output
-- 1	11:44:28	CREATE DATABASE db_lab	1 row(s) affected	0.016 sec

-- Step 2: Use the newly created database
USE db_lab;
-- Output
-- 2	11:45:15	USE db_lab	0 row(s) affected	0.000 sec

-- Step 3: Create the Students table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,             
    FirstName VARCHAR(50),              
    LastName VARCHAR(50),                 
    Email VARCHAR(100) UNIQUE,            
    DateOfBirth DATE                      
);
-- Output
-- 3	11:46:22	CREATE TABLE Students (
--     StudentID INT PRIMARY KEY,             -- Unique identifier for each student
--     FirstName VARCHAR(50),                 -- First name of the student
--     LastName VARCHAR(50),                  -- Last name of the student
--     Email VARCHAR(100) UNIQUE,             -- Email of the student, must be unique
--     DateOfBirth DATE                       -- Date of birth of the student
-- )	0 row(s) affected	0.094 sec

-- Step 4: Create the Courses table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,              
    CourseName VARCHAR(100),               
    Credits INT                            
);
-- Output
-- 4	11:47:40	CREATE TABLE Courses (
--     CourseID INT PRIMARY KEY,              -- Unique identifier for each course
--     CourseName VARCHAR(100),               -- Name of the course
--     Credits INT                            -- Number of credits for the course
-- )	0 row(s) affected	0.078 sec

-- Step 5: Create the Enrollments table
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,          
    StudentID INT,                         
    CourseID INT,                         
    EnrollmentDate DATE,                   
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);
-- Output
-- 5	11:48:42	CREATE TABLE Enrollments (
--     EnrollmentID INT PRIMARY KEY,          -- Unique identifier for each enrollment
--     StudentID INT,                         -- Foreign key referencing Students(StudentID)
--     CourseID INT,                          -- Foreign key referencing Courses(CourseID)
--     EnrollmentDate DATE,                   -- Date when the student enrolled in the course
--     FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
--     FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
-- )	0 row(s) affected	0.094 sec

-- Step 6: Select all records from the Enrollments table
SELECT * FROM Enrollments;
-- Output
-- 6	11:49:35	SELECT * FROM Enrollments
-- LIMIT 0, 2000	0 row(s) returned	0.000 sec / 0.000 sec

-- Step 7: Select all records from the Students table
SELECT * FROM Students;
-- Output
-- 7	11:50:47	SELECT * FROM Students
-- LIMIT 0, 2000	0 row(s) returned	0.000 sec / 0.000 sec

-- Step 8: Select all records from the Courses table
SELECT * FROM Courses;
-- Output
-- 8	11:51:28	SELECT * FROM Courses
-- LIMIT 0, 2000	0 row(s) returned	0.000 sec / 0.000 sec

-- Step 9: Alter the Students table to add a PhoneNumber column
ALTER TABLE Students
ADD PhoneNumber VARCHAR(15);               -- Add a new column for storing phone numbers
-- Output
-- 9	11:52:14	ALTER TABLE Students ADD PhoneNumber VARCHAR(15)	0 row(s) affected Records: 0  Duplicates: 0  Warnings: 0	0.078 sec

-- Step 10: Alter the Courses table to modify the Credits column
ALTER TABLE Courses
MODIFY Credits DECIMAL(3, 1);              -- Modify the Credits column to allow decimal values
-- Output
-- 10	11:53:25	ALTER TABLE Courses MODIFY Credits DECIMAL(3, 1)	0 row(s) affected Records: 0  Duplicates: 0  Warnings: 0	0.125 sec

-- Step 11: Alter the Enrollments table to add a unique constraint
ALTER TABLE Enrollments
ADD CONSTRAINT UC_StudentCourse UNIQUE (StudentID, CourseID);  -- Ensure unique student-course combinations
-- Output
-- 11	11:54:02	ALTER TABLE Enrollments ADD CONSTRAINT UC_StudentCourse UNIQUE (StudentID, CourseID)	0 row(s) affected Records: 0  Duplicates: 0  Warnings: 0	0.078 sec

-- Step 12: Drop the Enrollments table
DROP TABLE Enrollments;                    -- Delete the Enrollments table
-- Output
-- 12	11:54:36	DROP TABLE Enrollments	0 row(s) affected	0.063 sec

-- Step 13: Drop the Courses table
DROP TABLE Courses;                        -- Delete the Courses table
-- Output
-- 13	11:54:50	DROP TABLE Courses	0 row(s) affected	0.016 sec