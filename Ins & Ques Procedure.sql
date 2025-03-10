
--- Insert Instructor
create proc InsertInstructor @id int , @name varchar(20) , @deptId int
as 
    if not exists (select id from instructor where id = @id)
	begin
	   if exists (select id from department where id = @deptId)
	     begin
           insert into instructor(id,fname,dept_id)
	       values(@id,@name,@deptId)
		 end
	  else
	     select 'There is no department in this id' as ErrorMessage;
	 end
	 else
	     select 'Dublicate id for instructor' as ErrorMessage;

--- update Instructor
create proc UpdateInstructor @id int , @name varchar(20) , @deptId int
as 
    if exists (select id from instructor where id = @id)
	begin
	   if exists (select id from department where id = @deptId)
	     begin
		   update instructor
		   set fname = @name , dept_id = @deptId
           where id = @id
		 end
	  else
	     select 'There is no department in this id' as ErrorMessage;
	 end
	 else
	     select 'There is no instructor with this id' as ErrorMessage;



--- select Instructor
create proc SelectInstructor @id int 
as 
    if exists (select id from instructor where id = @id)
	begin
	  select * from instructor where id = @id
	 end
	 else
	     select 'There is no instructor with this id' as ErrorMessage;


--- delete instructor 
create proc DeleteInstructor @id int 
as 
    if exists (select id from instructor where id = @id)
	begin
	  delete instructor where id = @id
	 end
	 else
	     select 'There is no instructor with this id' as ErrorMessage;



----- Questions

create proc InsertQuestions @id int,@type varchar(200),@content varchar(200),@point int,@ansContent varchar(200) , @cId int
as 
     if not exists (select que_id from questions where que_id = @id)
	 begin
	    if exists (select id from course where id = @cId)
		  begin
           insert into questions(que_id,question_type,que_content,que_point,ans_content)
	       values(@id,@type,@content,@point,@ansContent)
		  end
		  else
		      select 'There is no Course with this id' as ErrorMessage;
	 end
	 else
	     select 'Dublicate id for Question' as ErrorMessage;

--- update Question
create proc UpdateQuestions @id int,@point int,@ansContent varchar(200)
as 
     if exists (select que_id from questions where que_id = @id)
	 begin
		   update questions
		   set que_point = @point , ans_content = @ansContent 
           where que_id = @id
	 end
	 else
	     select 'There is no Question with this id' as ErrorMessage;



--- select Question
create proc SelectQuestions @id int 
as 
    if exists (select que_id from questions where que_id = @id)
	begin
	  select * from questions where que_id = @id
	 end
	 else
	     select 'There is no Question with this id' as ErrorMessage;


--- delete Question 
create proc DeleteQuestions @id int 
as 
    if exists (select que_id from questions where que_id = @id)
	begin
	  delete questions where que_id = @id
	 end
	 else
	     select 'There is no Question  with this id' as ErrorMessage;




