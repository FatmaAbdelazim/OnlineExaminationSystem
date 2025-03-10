--- select Student Info
alter proc StudentInfo @DeptId int 
as 
    if exists (select id from department where id = @DeptId)
	  begin 
	    if exists (select  dept_id
		           from student s where dept_id = @DeptId
					)
	     begin
	         select s.* 
	         from student s join department d
	         on d.id = s.dept_id
	         where s.dept_id = @DeptId
		 end
		else
	     select 'There is no Students in this Department' as ErrorMessage;
	 end
	 else
	     select 'There is no Department with this id' as ErrorMessage;

StudentInfo 1

----- select gradeOfAllCoursesForStudent
create proc getgradeOfAllCoursesForStudent @StId int 
as 
    if exists (select id from student where id = @StId)
	  begin 
	         declare @newTable table (crName varchar(20) , Stgrade decimal)
			 insert into @newTable
	         select c.c_name ,sc.grade 
	         from student s join student_Course sc
	         on s.id = sc.st_id
			 join course c
			 on sc.c_id = c.id and s.id = @StId
	    IF @@ROWCOUNT = 0
	       select 'There is no grades for this Students ' as ErrorMessage;
		else 
		   select * from @newTable
	 end
	 else
	     select 'There is no Student with this id' as ErrorMessage;

getgradeOfAllCoursesForStudent 105