

SELECT e.emp_no,
e.first_name,
e.last_name,
t.title,
t.to_date,
t.from_date 
INTO retirement_title 
FROM employees as e
JOIN titles as t
ON e.emp_no = t.emp_no
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31' 
ORDER BY e.emp_no;



-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no ,
first_name,
last_name,
title
--INTO unique_table
FROM retirement_title 
ORDER BY emp_no, to_date DESC;

SELECT 
count(title), 
title
INTO retiring_titles
FROM unique_table 
GROUP BY title 
ORDER BY count(title) DESC;



SELECT 
DISTINCT ON (e.emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
t.title
INTO mentorship_eligibilty
FROM employees as e
JOIN dept_emp  as de
ON e.emp_no = de.emp_no
JOIN titles as t
ON e.emp_no = t.emp_no
WHERE (t.to_date = '9999-01-01') AND 
(birth_date BETWEEN '1965-01-01' AND '1965-12-31') 
ORDER BY e.emp_no;