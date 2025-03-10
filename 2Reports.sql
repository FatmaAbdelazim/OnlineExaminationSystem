create procedure get_instructor_info
    @ins_id int
as
begin
    select 
        c.c_name as course_name,
        count(sc.st_id) as student_count
    from 
        instructor_course ic
    join 
        course c on ic.c_id = c.id
    inner join 
        student_course sc on ic.c_id = sc.c_id
    where 
        ic.ins_id = @ins_id
    group by 
        c.c_name;
end;

exec get_instructor_info @ins_id = 301;

--------------------------------------------------------------

create procedure getTopics
    @c_id int
as
begin
    select 
        t.topic_name
    from 
        course c
    join 
        topic t on c.topic_id = t.id
    where 
        c.id = @c_id;
end;

exec getTopics @c_id = 202;

