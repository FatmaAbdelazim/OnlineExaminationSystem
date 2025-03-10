create database ExaminationSystem

--1 department
create table department (
id int primary key,
dept_name varchar(200) not null
);
 
--2 topic
create table topic (
id int primary key,
topic_name varchar(200) not null 
);
 
--3 course
create table course (
id int primary key,
c_name varchar(200) not null,
topic_id int not null,
FOREIGN KEY (topic_id) REFERENCES topic(id) ON DELETE CASCADE ON UPDATE CASCADE
);
delete from course

--4 student
create table student (
id int primary key,
fname varchar(100) not null,
lname varchar(100),
city varchar(100),
street varchar(200),
dept_id int not null,
FOREIGN KEY (dept_id) REFERENCES department(id) ON DELETE CASCADE ON UPDATE CASCADE
);

--5 instructor
create table instructor (
id int primary key,
fname varchar(100) not null,
lname varchar(100),
dept_id int not null,
FOREIGN KEY (dept_id) REFERENCES department(id) ON DELETE CASCADE ON UPDATE CASCADE
);

--6 exam
create table exam (
id int primary key,
exam_date date not null,
duration time not null,
c_id int not null,
FOREIGN KEY (c_id) REFERENCES course(id) ON DELETE CASCADE ON UPDATE CASCADE
);
delete from exam
--7 questions
create table questions (
que_id int  primary key,
question_type varchar(100) not null,
que_content varchar(max) not null,
que_point int not null,
ans_content varchar(max) not null,
c_id int not null,
FOREIGN KEY (c_id) REFERENCES course(id) ON DELETE CASCADE ON UPDATE CASCADE
);

--8 choose
create table chooses (
id int primary key,
content varchar(max) not null,
que_id int not null,
FOREIGN KEY (que_id) REFERENCES questions(que_id) ON DELETE CASCADE ON UPDATE CASCADE
);
--9 exam_ques
CREATE TABLE exam_ques (
    ex_id INT NOT NULL,
    que_id INT NOT NULL,
    FOREIGN KEY (ex_id) REFERENCES exam(id) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (que_id) REFERENCES questions(que_id) ON DELETE NO ACTION ON UPDATE NO ACTION,
    PRIMARY KEY (ex_id, que_id)
);

--10 studentcourse
create table student_Course (
st_id int not null,
c_id int not null,
grade decimal not null,
FOREIGN KEY (st_id) REFERENCES student(id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (c_id) REFERENCES course(id) ON DELETE CASCADE ON UPDATE CASCADE,
primary key (st_id, c_id)
);

--11 instructorcourse 
create table instructor_Course (
ins_id int not null,
c_id int not null,
FOREIGN KEY (ins_id) REFERENCES instructor(id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (c_id) REFERENCES course(id) ON DELETE CASCADE ON UPDATE CASCADE,
primary key (ins_id, c_id)
);

--12 studentanswer 
CREATE TABLE student_Answer (
    id INT PRIMARY KEY,
    content VARCHAR(MAX) NOT NULL,
    st_id INT NOT NULL,
    ex_id INT NOT NULL,
    choose_id INT,
    FOREIGN KEY (st_id) REFERENCES student(id) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (ex_id) REFERENCES exam(id) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (choose_id) REFERENCES chooses(id) ON DELETE NO ACTION
);


--select department
CREATE PROC SelectDepartment
    @id INT = NULL
AS
BEGIN
    IF @id IS NULL
    BEGIN
        SELECT * FROM department;
    END
    ELSE
    BEGIN
        IF NOT EXISTS (SELECT 1 FROM department WHERE id = @id)
        BEGIN
            PRINT 'Department not found';
            RETURN;
        END
        SELECT * FROM department WHERE id = @id;
    END
END;


--insert
CREATE PROC InsertDepartment
    @id INT,
    @dept_name VARCHAR(200)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM department WHERE id = @id)
    BEGIN
        PRINT 'Department already exists';
        RETURN;
    END
    ELSE
    BEGIN
        INSERT INTO department(id, dept_name)
        VALUES (@id, @dept_name);
        PRINT 'Department inserted successfully';
    END
END;


--update
CREATE PROC UpdateDepartment
    @id INT,
    @dept_name VARCHAR(200)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM department WHERE id = @id)
    BEGIN
        PRINT 'Department not found';
        RETURN;
    END
	
    UPDATE department
    SET dept_name = @dept_name
    WHERE id = @id;
    PRINT 'Department updated successfully';
END;



--delete
CREATE PROC DeleteDepartment
    @id INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM department WHERE id = @id)
    BEGIN
        PRINT 'Department not found';
        RETURN;
    END

    DELETE FROM department WHERE id = @id;
    PRINT 'Department deleted successfully';
END;



--select topic
CREATE PROC SelectTopic
    @id INT = NULL
AS
BEGIN
    IF @id IS NULL
    BEGIN
        SELECT * FROM topic;
    END
    ELSE
    BEGIN
        IF NOT EXISTS (SELECT 1 FROM topic WHERE id = @id)
        BEGIN
            PRINT 'Topic not found';
            RETURN;
        END
        SELECT * FROM topic WHERE id = @id;
    END
END;



--insert
CREATE PROC InsertTopic
    @id INT,
    @topic_name VARCHAR(200)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM topic WHERE id = @id)
    BEGIN
        PRINT 'Topic already exists';
        RETURN;
    END

    INSERT INTO topic(id, topic_name)
    VALUES (@id, @topic_name);
    PRINT 'Topic inserted successfully';
END;



--update
CREATE PROC UpdateTopic
    @id INT,
    @topic_name VARCHAR(200)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM topic WHERE id = @id)
    BEGIN
        PRINT 'Topic not found';
        RETURN;
    END

    UPDATE topic
    SET topic_name = @topic_name
    WHERE id = @id;
    PRINT 'Topic updated successfully';
END;


--delete
CREATE PROC DeleteTopic
    @id INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM topic WHERE id = @id)
    BEGIN
        PRINT 'Topic not found';
        RETURN;
    END

    DELETE FROM topic WHERE id = @id;
    PRINT 'Topic deleted successfully';
END;


--select course
CREATE PROC SelectCourse
    @id INT = NULL
AS
BEGIN
    IF @id IS NULL
    BEGIN
        SELECT * FROM course;
    END
    ELSE
    BEGIN
        IF NOT EXISTS (SELECT 1 FROM course WHERE id = @id)
        BEGIN
            PRINT 'Course not found';
            RETURN;
        END
        SELECT * FROM course WHERE id = @id;
    END
END;



--insert
CREATE PROC InsertCourse
    @id INT,
    @c_name VARCHAR(200),
    @topic_id INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM course WHERE id = @id)
    BEGIN
        PRINT 'Course already exists';
        RETURN;
    END

    IF NOT EXISTS (SELECT 1 FROM topic WHERE id = @topic_id)
    BEGIN
        PRINT 'Topic not found';
        RETURN;
    END

    INSERT INTO course(id, c_name, topic_id)
    VALUES (@id, @c_name, @topic_id);
    PRINT 'Course inserted successfully';
END;



--update
CREATE PROC UpdateCourse
    @id INT,
    @c_name VARCHAR(200),
    @topic_id INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM course WHERE id = @id)
    BEGIN
        PRINT 'Course not found';
        RETURN;
    END

    IF NOT EXISTS (SELECT 1 FROM topic WHERE id = @topic_id)
    BEGIN
        PRINT 'Topic not found';
        RETURN;
    END

    UPDATE course
    SET c_name = @c_name, topic_id = @topic_id
    WHERE id = @id;
    PRINT 'Course updated successfully';
END;



--delete
CREATE PROC DeleteCourse
    @id INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM course WHERE id = @id)
    BEGIN
        PRINT 'Course not found';
        RETURN;
    END

    DELETE FROM course WHERE id = @id;
    PRINT 'Course deleted successfully';
END;



--select student
CREATE PROC SelectStudent
    @id INT = NULL
AS
BEGIN
    IF @id IS NULL
    BEGIN
        SELECT * FROM student;
    END
    ELSE
    BEGIN
        IF NOT EXISTS (SELECT 1 FROM student WHERE id = @id)
        BEGIN
            PRINT 'Student not found';
            RETURN;
        END
        SELECT * FROM student WHERE id = @id;
    END
END;


--insert student
CREATE PROC InsertStudent
    @id INT,
    @fname VARCHAR(100),
    @lname VARCHAR(100),
    @city VARCHAR(100),
    @street VARCHAR(200),
    @dept_id INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM student WHERE id = @id)
    BEGIN
        PRINT 'Student already exists';
        RETURN;
    END

    IF NOT EXISTS (SELECT 1 FROM department WHERE id = @dept_id)
    BEGIN
        PRINT 'Department not found';
        RETURN;
    END

    INSERT INTO student(id, fname, lname, city, street, dept_id)
    VALUES (@id, @fname, @lname, @city, @street, @dept_id);
    PRINT 'Student inserted successfully';
END;




--update 
CREATE PROC UpdateStudent
    @id INT,
    @fname VARCHAR(100),
    @lname VARCHAR(100),
    @city VARCHAR(100),
    @street VARCHAR(200),
    @dept_id INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM student WHERE id = @id)
    BEGIN
        PRINT 'Student not found';
        RETURN;
    END

    IF NOT EXISTS (SELECT 1 FROM department WHERE id = @dept_id)
    BEGIN
        PRINT 'Department not found';
        RETURN;
    END

    UPDATE student
    SET fname = @fname, lname = @lname, city = @city, street = @street, dept_id = @dept_id
    WHERE id = @id;
    PRINT 'Student updated successfully';
END;




--delete
CREATE PROC DeleteStudent
    @id INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM student WHERE id = @id)
    BEGIN
        PRINT 'Student not found';
        RETURN;
    END

    DELETE FROM student WHERE id = @id;
    PRINT 'Student deleted successfully';
END;









CREATE PROC GetExamQuestions
    @exam_id INT
AS
BEGIN
     
    IF NOT EXISTS (SELECT 1 FROM exam WHERE id = @exam_id)
    BEGIN
         PRINT 'Exam not found';
         RETURN;
    END

    SELECT 
         q.que_content
    FROM  questions q
    INNER JOIN exam_ques eq ON eq.que_id = q.que_id
    WHERE eq.ex_id = @exam_id;
END;

EXEC GetExamQuestions @exam_id = 4227;








 
alter PROC GetExamQuestAndStudAnswers
    @exam_id INT,
    @student_id INT
AS
BEGIN
     
    IF NOT EXISTS (SELECT 1 FROM exam WHERE id = @exam_id)
    BEGIN
        RAISERROR('Exam not found', 16, 1);
        RETURN;
    END

     
    IF NOT EXISTS (SELECT 1 FROM student WHERE id = @student_id)
    BEGIN
        RAISERROR('Student not found', 16, 1);
        RETURN;
    END
    
	    select q.que_id , q.que_content  ,  s.content
		from student_answer s  join  chooses c
		on c.id = s.choose_id 
		join questions q 
		on c.que_id = q.que_id
		join exam_ques ex on q.que_id = ex.que_id
		where ex.ex_id = @exam_id

END;

EXEC GetExamQuestAndStudAnswers @exam_id = 4227, @student_id = 105;

////////////////////////////////////////////////////////////////////////////////////////////


CREATE PROC ExamCorrection
    @exam_id INT,
    @student_id INT
AS
BEGIN
     
    IF NOT EXISTS (SELECT 1 FROM exam WHERE id = @exam_id)
    BEGIN
        PRINT 'Exam not found';
        RETURN;
    END

    
    IF NOT EXISTS (SELECT 1 FROM student WHERE id = @student_id)
    BEGIN
        PRINT 'Student not found';
        RETURN;
    END
	 
    SELECT 
         q.que_id,
         q.que_content,
         q.ans_content AS correct_answer,
         s.content AS student_answer,
         q.que_point,
         CASE 
             WHEN s.choose_id = ch.id AND ch.content = q.ans_content THEN q.que_point
             ELSE 0 
         END AS Grade
    INTO #TempResults 
    FROM exam_ques eq
    INNER JOIN questions q 
         ON eq.que_id = q.que_id
    INNER JOIN student_answer s
         ON s.ex_id = eq.ex_id 
         AND s.st_id = @student_id
    INNER JOIN chooses ch
         ON ch.id = s.choose_id AND ch.que_id = q.que_id  
    WHERE eq.ex_id = @exam_id;

   
    DECLARE @TotalScore INT;
    SELECT @TotalScore = SUM(
         CASE 
             WHEN s.choose_id = ch.id AND ch.content = q.ans_content THEN q.que_point
             ELSE 0 
         END
    ) 
    FROM exam_ques eq
    INNER JOIN questions q 
         ON eq.que_id = q.que_id
    INNER JOIN student_answer s 
         ON s.ex_id = eq.ex_id 
         AND s.st_id = @student_id
    INNER JOIN chooses ch
         ON ch.id = s.choose_id AND ch.que_id = q.que_id
    WHERE eq.ex_id = @exam_id;


	 
    DECLARE @MaxScore INT;
    SELECT @MaxScore = SUM(que_point) 
    FROM questions q
    INNER JOIN exam_ques eq ON eq.que_id = q.que_id
    WHERE eq.ex_id = @exam_id;

     
    DECLARE @Percentage DECIMAL(5,2);
    IF @MaxScore = 0 
        SET @Percentage = 0;
    ELSE
        SET @Percentage = (CAST(@TotalScore AS DECIMAL) / @MaxScore) * 100;


    DECLARE @course_id INT;
    SELECT @course_id = c_id FROM exam WHERE id = @exam_id;

	 SET @Percentage = ISNULL(@Percentage, 0);

    IF EXISTS (SELECT 1 FROM student_Course WHERE st_id = @student_id AND c_id = @course_id)
    BEGIN
       
        UPDATE student_Course
        SET grade = @Percentage
        WHERE st_id = @student_id AND c_id = @course_id;
    END
    ELSE
    BEGIN
       
        INSERT INTO student_Course (st_id, c_id, grade)
        VALUES (@student_id, @course_id, @Percentage);
    END


    
    SELECT @TotalScore AS TotalScore, @Percentage AS Percentage;

    DROP TABLE #TempResults;
END;


EXEC ExamCorrection @exam_id = 1, @student_id = 101;
SELECT * FROM student_Course WHERE st_id = 101;


 