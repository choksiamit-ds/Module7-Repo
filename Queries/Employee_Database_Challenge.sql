select * from titles;
select * from employees;
select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from retiring_titles;
select count(*) from unique_titles;
select count(*) from employees;
select count (*) from dept_emp where to_date = '9999-01-01';


-- inner join on dept_emp

SELECT                 --DISTINCT ON (ee.emp_no) 
	ee.emp_no,
	ee.first_name,
	ee.last_name,
	tt.title,
	de.from_date,
	de.to_date
INTO retirement_titles
FROM employees as ee
INNER JOIN dept_emp AS de
	ON ( de.emp_no = ee.emp_no)
INNER JOIN titles AS tt
	ON (ee.emp_no = tt.emp_no)
WHERE (de.to_date = '9999-01-01') 
	AND 
	(ee.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY  ee.emp_no ASC, tt.to_date DESC;


-- Use Dictinct with Orderby to remove duplicate rows

SELECT DISTINCT ON (ee.emp_no) 
	ee.emp_no,
	ee.first_name,
	ee.last_name,
	tt.title
INTO unique_titles
FROM employees as ee
INNER JOIN dept_emp AS de
	ON ( de.emp_no = ee.emp_no)
INNER JOIN titles AS tt
	ON (ee.emp_no = tt.emp_no)
WHERE (de.to_date = '9999-01-01') 
	AND (ee.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY  ee.emp_no ASC, tt.to_date DESC;


select unique_titles.title, count(unique_titles.title) 
  into retiring_titles
FROM unique_titles 
GROUP BY unique_titles.title
ORDER BY count(unique_titles.title) desc;


SELECT DISTINCT ON (ee.emp_no) 
	ee.emp_no,
	ee.first_name,
	ee.last_name,
	ee.birth_date,
	de.from_date,
	de.to_date,
	tt.title
INTO mentorship_eligibility
FROM employees as ee
INNER JOIN dept_emp AS de
	ON ( de.emp_no = ee.emp_no)
INNER JOIN titles AS tt
	ON (ee.emp_no = tt.emp_no)
WHERE (ee.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
     AND (de.to_date = '9999-01-01')
ORDER BY  ee.emp_no ASC;
