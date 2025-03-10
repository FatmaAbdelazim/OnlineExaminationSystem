----- exam

--- insert exam
create proc InsertExam @id int,@ExDate date,@Exduration time , @cId int
as 
     if not exists (select id from exam where id = @id)
	 begin
	    if exists (select id from course where id = @cId)
		  begin
           insert into exam(id , exam_date , duration,c_id)
	       values(@id,@ExDate,@Exduration,@cId)
		  end
		  else
		      select 'There is no Course with this id' as ErrorMessage;
	 end
	 else
	     select 'Dublicate id for Exam' as ErrorMessage;

--- update exam
create proc UpdateExam @id int,@Exduration time
as 
     if exists (select id from exam where id = @id)
	 begin
		   update exam
		   set duration = @Exduration
           where id = @id
	 end
	 else
	     select 'There is no Exam with this id' as ErrorMessage;



--- select exam
create proc SelectExam @id int 
as 
    if exists (select id from exam where id = @id)
	begin
	  select * from exam where id = @id
	 end
	 else
	     select 'There is no Exam with this id' as ErrorMessage;


--- delete exam
create proc DeleteExam @id int 
as 
    if exists (select id from exam where id = @id)
	begin
	  delete exam where id = @id
	 end
	 else
	     select 'There is no Exam  with this id' as ErrorMessage;



---- insert StudentAnswer
create proc  InsertStudentAnswer @id int,@Anscontent varchar(200), @StId int , @ExId int , @chooseId int
as 
     if not exists (select id from  student_Answer where id = @id)
	 begin
	    if exists (select id from student where id = @StId)
		 begin
		  if exists (select id from exam where id = @ExId)
		  begin
		  if  exists (select id from chooses where id = @chooseId)
		   begin
           insert into student_Answer(id,content,st_id,ex_id)
	       values(@id,@Anscontent,@StId,@ExId)
		   end
		   else
		      select 'There is no Choose equal this Answer' as ErrorMessage;
		  end
		  else
		      select 'There is no Student with this id' as ErrorMessage;
		end
		  else
		      select 'There is no Exam with this id' as ErrorMessage;
	 end
	 else
	     select 'Dublicate id StudentAnswer' as ErrorMessage;

--- update StudentAnswer
create proc UpdateStudentAnswer @id int,@AnsContent varchar(20) , @chooseId int
as 
     if exists (select id from student_Answer where id = @id)
	 begin
	   if  exists (select id from chooses where id = @chooseId)
	   begin
		   update student_Answer
		   set content = @AnsContent
           where id = @id
	   end
	   else
		     select 'There is no Choose equal this Answer' as ErrorMessage;
	 end
	 else
	     select 'There is no StudentAnswer with this id' as ErrorMessage;



--- select StudentAnswer
create proc SelectStudentAnswer @id int 
as 
    if exists (select id from student_Answer where id = @id)
	begin
	  select * from student_Answer where id = @id
	 end
	 else
	     select 'There is no StudentAnswer with this id' as ErrorMessage;


--- delete StudentAnswer
create proc DeleteStudentAnswer @id int 
as 
    if exists (select id from student_Answer where id = @id)
	begin
	  delete student_Answer where id = @id
	 end
	 else
	     select 'There is no StudentAnswer with this id' as ErrorMessage;




