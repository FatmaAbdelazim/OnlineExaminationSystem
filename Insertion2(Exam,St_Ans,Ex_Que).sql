INSERT INTO Exam (id, exam_date, duration, c_id) VALUES
(1, '2025-03-03', '01:30:00',201);

INSERT INTO exam_ques(ex_id, que_id) VALUES
(1, 101), (1, 102), (1, 103), (1, 104), (1, 105),
(1, 106), (1, 107), (1, 108), (1, 109), (1, 110);

INSERT INTO student_Answer (id, content, st_id, ex_id,choose_id) VALUES
(1, 'True', 103, 1,321),
(2, 'try', 103, 1,361),
(3, 'False', 103, 1,324),
(4, 'protected-internal',103, 1,365),
(5, 'Dictionary', 103, 1,369),
(6, 'False', 103, 1,326),
(7, 'DISTINCT', 103, 1,375),
(8, 'True', 103, 1,327),
(9, 'extends', 103, 1,379),
(10, 'Base', 103, 1,383);

