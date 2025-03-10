--- generate Exam 
create proc GenerateExam  @courseName varchar(20) , @numOfTorF int , @numOfMcq int, @ExamId int output 
as 
             declare @crId int , @totalQues int = @numOfTorF + @numOfMcq , @quesId int , @dateEx date
			 select  @dateEx = GetDate()
             if exists (select id from course where c_name = @courseName) 
			 begin 
			 select @crId = id from course where c_name = @courseName
			 set @ExamId = ABS(CHECKSUM(NEWID())) % 10000 + 1
             EXEC InsertExam  @ExamId, @dateEx , '01:30:00',@crId
			 declare @newTableOfQues table (ques_id int)
		   while @totalQues >0
			  begin
			 while @numOfTorF >0
			  begin
			      select @quesId = que_id 
	              from questions 
				  where question_type = 'True/False' and c_id = @crId 
				  order by NEWID()
			     EXEC insert_exam_ques @ExamId , @quesId
				  set @numOfTorF -= 1
			 end
			 while @numOfMcq >0
			  begin
			      select @quesId = que_id 
	              from questions 
				  where question_type = 'MCQ' and c_id = @crId 
				  order by NEWID()
			      EXEC insert_exam_ques @ExamId , @quesId
				  set @numOfMcq -= 1
			 end
		
				  set @totalQues -= 1
			 end
			 	select 'The exam was created successfully'
			end
	else
	select 'There is no Course with this name '

----- test
DECLARE @ExamId1 INT, @ExamId2 INT;
EXEC GenerateExam 'C Programming', 3, 2, @ExamId1 OUTPUT;
--EXEC GenerateExam 'HTML', 3, 2, @ExamId2 OUTPUT;
SELECT @ExamId1, @ExamId2;

declare @answers1 answer_table_types;
insert into @answers1 (que_id, content, choose_id)
values
    (81,'True', 185),   
    (88, 'False', 192),
    (90, 'title', 294), 
    (132, '<table>', 433),  
    (136, 'False', 350); 

exec answer_exam 
    @st_id = 105, 
    @ex_id = 4227, 
    @answers = @answers1;
EXEC ExamCorrection @exam_id = 4227 , @student_id = 105;
EXEC GetExamQuestAndStudAnswers @exam_id = 4227, @student_id = 105;











