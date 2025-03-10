create type answer_table_types as table (
    que_id int,         
    content nvarchar(max) ,
	choose_id int 
);


create procedure answer_exam
    @st_id int,              
    @ex_id int,            
    @answers answer_table_types readonly 
as
begin
    if not exists (select 1 from student where id = @st_id)
    begin
        print 'Error: Student ID ' + cast(@st_id as varchar) + ' does not exist.';
        return;
    end;

    if not exists (select 1 from exam where id = @ex_id)
    begin
        print 'Error: Exam ID ' + cast(@ex_id as varchar) + ' does not exist.';
        return;
    end;

    declare @c_id int;
    select @c_id = c_id from exam where id = @ex_id;

    if not exists (select 1 from student_Course where st_id = @st_id and c_id = @c_id)
    begin
        print 'Error: Student ID ' + cast(@st_id as varchar) + ' is not enrolled in the course for Exam ID ' + cast(@ex_id as varchar) + '.';
        return;
    end;

    if not exists (select 1 from exam_ques where ex_id = @ex_id)
    begin
        print 'Error: No questions found for Exam ID ' + cast(@ex_id as varchar) + '.';
        return;
    end;

    if exists (
        select 1
        from @answers a
        where not exists (
            select 1
            from chooses c
            join exam_ques eq on c.que_id = eq.que_id
            where eq.ex_id = @ex_id
              and eq.que_id = a.que_id
              and c.content = a.content
        )
    )
    begin
        print 'Error: One or more answers do not match the valid choices for the questions in the exam.';
        return;
    end;

    insert into student_Answer (content, st_id, ex_id, choose_id)
    select 
        a.content,
        @st_id,
        @ex_id,
        c.id
    from @answers a
    join chooses c on a.content = c.content and a.que_id = c.que_id
    join exam_ques eq on c.que_id = eq.que_id
    where eq.ex_id = @ex_id;

    print 'Answers submitted successfully for Exam ID ' + cast(@ex_id as varchar) + ' by Student ID ' + cast(@st_id as varchar) + '.';
end;

--








