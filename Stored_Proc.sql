
--exam_ques
--select
alter procedure select_exam_ques
    @ex_id int
as
begin
    if exists (select ex_id from exam_ques where ex_id = @ex_id)
    select *
    from exam_ques
    where ex_id = @ex_id 
	else
	select 'There is no exam with this ID';
end;
--select_exam_ques 4227


--insert

alter procedure insert_exam_ques
    @ex_id int,
    @que_id int
as
begin
    
    if not exists (select 1 from exam where id = @ex_id)
    begin
        print 'Error: Exam ID ' + cast(@ex_id as varchar) + ' does not exist.';
        return;
    end;

   
    if not exists (select 1 from questions where que_id = @que_id)
    begin
        print 'Error: Question ID ' + cast(@que_id as varchar) + ' does not exist.';
        return;
    end;
	if  exists (select ex_id , que_id from exam_ques where que_id = @que_id and ex_id = @ex_id)
    begin
        print 'This Question Dublicated in This Exam';
        return;
    end;
    
    insert into exam_ques (ex_id, que_id)
    values (@ex_id, @que_id);

    print 'Exam question inserted successfully.';
end;
-- insert_exam_ques 4227 , 81


--update
create procedure update_exam_ques
    @ex_id int,
    @que_id int,
    @new_que_id int
as
begin
  
    if not exists (select 1 from exam_ques where ex_id = @ex_id and que_id = @que_id)
    begin
        print 'Error: Exam question with Exam ID ' + cast(@ex_id as varchar) + ' and Question ID ' + cast(@que_id as varchar) + ' does not exist.';
        return;
    end;


    if not exists (select 1 from questions where que_id = @new_que_id)
    begin
        print 'Error: New Question ID ' + cast(@new_que_id as varchar) + ' does not exist.';
        return;
    end;

   
    update exam_ques
    set que_id = @new_que_id
    where ex_id = @ex_id and que_id = @que_id;

    print 'Exam question updated successfully.';
end;

--remove

alter procedure delete_exam_ques
    @ex_id int
as
begin
  if exists (select ex_id from exam_ques where ex_id = @ex_id)
    delete from exam_ques
    where ex_id = @ex_id ;
  else
	select 'There is no exam with this ID';
end;
--delete_exam_ques 2970
----------------student_course----------
--select

create procedure select_student_course
    @st_id int,  
    @c_id int    
as
begin
    if exists (select st_id , c_id from student_Course where st_id = @st_id and c_id = @c_id)
    select *
    from student_course
    where st_id = @st_id and c_id = @c_id;
	else
	select 'There is no Student with this ID enrolled in Course with this ID';
end;

--insert

create procedure insert_student_course
    @st_id int,
    @c_id int
   
as
begin
    
    if not exists (select 1 from student where id = @st_id)
    begin
        print 'Error: Student ID ' + cast(@st_id as varchar) + ' does not exist.';
        return;
    end;

   
    if not exists (select 1 from course where id = @c_id)
    begin
        print 'Error: Course ID ' + cast(@c_id as varchar) + ' does not exist.';
        return;
    end;

    if not exists (select st_id , c_id from student_Course where st_id = @st_id and c_id = @c_id)
    insert into student_course (st_id, c_id)
    values (@st_id, @c_id);
	else 
	  select 'Dublicated IDs'
end;

--update

create procedure update_student_course
    @st_id int,
    @c_id int,
    @new_grade decimal
as
begin
    
    if not exists (select 1 from student_course where st_id = @st_id and c_id = @c_id)
    begin
        print 'Error: Student course with Student ID ' + cast(@st_id as varchar) + ' and Course ID ' + cast(@c_id as varchar) + ' does not exist.';
        return;
    end;

   
    update student_course
    set grade = @new_grade
    where st_id = @st_id and c_id = @c_id;

    print 'Student course updated successfully.';
end;
--remove

create procedure delete_student_course
    @st_id int,
    @c_id int
as
begin
    if exists (select st_id , c_id from student_Course where st_id = @st_id and c_id = @c_id)
    delete from student_course
    where st_id = @st_id and c_id = @c_id;
	else
		select 'There is no Student with this ID enrolled in Course with this ID';
end;

------------------------instructor_course-----------
--select
create procedure select_instructor_course
    @ins_id int, 
    @c_id int     
as
begin
    if exists (select ins_id,c_id  from instructor_Course where ins_id = @ins_id and c_id = @c_id)
    select *
    from instructor_course
    where ins_id = @ins_id and c_id = @c_id;
		select 'There is no Instructor with this ID teach Course with this ID';

end;

--insert
create procedure insert_instructor_course
    @ins_id int,
    @c_id int
as
begin

    if not exists (select 1 from instructor where id = @ins_id)
    begin
        print 'Error: Instructor ID ' + cast(@ins_id as varchar) + ' does not exist.';
        return;
    end;

    
    if not exists (select 1 from course where id = @c_id)
    begin
        print 'Error: Course ID ' + cast(@c_id as varchar) + ' does not exist.';
        return;
    end;

	if not exists (select ins_id,c_id  from instructor_Course where ins_id = @ins_id and c_id = @c_id)
    insert into instructor_course (ins_id, c_id)
    values (@ins_id, @c_id);
    else
	   	  select 'Dublicated IDs'
end;
--update

create procedure update_instructor_course
    @ins_id int,
    @c_id int,
    @new_c_id int
as
begin
   
    if not exists (select 1 from instructor_course where ins_id = @ins_id and c_id = @c_id)
    begin
        print 'Error: Instructor course with Instructor ID ' + cast(@ins_id as varchar) + ' and Course ID ' + cast(@c_id as varchar) + ' does not exist.';
        return;
    end;

  
    if not exists (select 1 from course where id = @new_c_id)
    begin
        print 'Error: New Course ID ' + cast(@new_c_id as varchar) + ' does not exist.';
        return;
    end;

    
    update instructor_course
    set c_id = @new_c_id
    where ins_id = @ins_id and c_id = @c_id;

    print 'Instructor course updated successfully.';
end;
--remove
create procedure delete_instructor_course
    @ins_id int,
    @c_id int
as
begin
   if exists (select 1 from instructor_course where ins_id = @ins_id and c_id = @c_id)
    delete from instructor_course
    where ins_id = @ins_id and c_id = @c_id;
	else 
	  select 'The Instructor not Teach This Course'
end;

------------------------------choose--------------------
--select

create procedure select_chooses
    @id int 
as
begin
    if  exists (select 1 from chooses where id = @id)
    select *
    from chooses
    where id = @id;
	else
	 select 'No Chooses With This ID'
end;

--insert

alter procedure insert_chooses
    @que_id int,              
    @choice varchar(max),
	@choiceId int
as
begin
   
    if not exists (select 1 from questions where que_id = @que_id)
    begin
        print 'Error: Question ID ' + cast(@que_id as varchar) + ' does not exist.';
        return;
    end;
	 if exists (select 1 from chooses where id = @choiceId)
    begin
        print 'Error: Choice ID ' + cast(@que_id as varchar) + ' does exist already.';
        return;
    end;
    insert into chooses (content, que_id,id)
    values (@choice, @que_id,@choiceId)
	  print 'Choices inserted successfully for Question ID ' + cast(@que_id as varchar) + '.';
end;

insert_chooses 5 , 'null',50
--update
alter procedure update_chooses
    @que_id int,              
    @newchoice varchar(max),
	@choiceId int
as
begin
   
    if not exists (select 1 from questions where que_id = @que_id)
    begin
        print 'Error: Question ID ' + cast(@que_id as varchar) + ' does not exist.';
        return;
    end;
	 if not exists (select 1 from chooses where id = @choiceId)
    begin
        print 'Error: Choice ID ' + cast(@choiceId as varchar) + ' does not exist ';
        return;
    end;
   declare @correct_answer varchar(max) , @oldChoice varchar(max);
   select @correct_answer = ans_content from questions where que_id = @que_id
   select @oldChoice = content from chooses where id = @choiceId
   if @correct_answer not in (@oldChoice)
   begin
      update chooses
	  set content = @newchoice
	  where id = @choiceId
	  print 'Choices Updated successfully for Question ID ' + cast(@que_id as varchar) + '.';
	end
  else 
    select 'this choice equal answer Correct so upate anthor choice';
 
end;
-- update_chooses 5 , 'null',50
--remove

create procedure delete_chooses
    @chooesId int
as
begin
    if not exists (select 1 from chooses where id = @chooesId)
    begin
        print 'Error: Chooes ID ' + cast(@chooesId as varchar) + ' does not exist.';
        return;
    end;

    delete from chooses
    where id = @chooesId;

    print 'Choices deleted successfully';
end;