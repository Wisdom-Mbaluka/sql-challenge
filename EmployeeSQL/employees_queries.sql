create table departments (dept_no text primary key, dept_name text not null);


create table dept_emp (
  emp_no bigint not null,
  dept_no text not null,
  foreign key (dept_no) references departments (dept_no)
);

create table dept_manager (
  dept_no text not null,
  emp_no bigint not null,
  foreign key (dept_no) references departments (dept_no)
);

create table employees (
  emp_no bigint primary key,
  emp_title_id text not null,
  birth_date date not null,
  first_name text not null,
  last_name text not null,
  sex text not null,
  hire_date date not null
);
create table salaries (
  emp_no bigint not null,
  salary integer not null,
  foreign key (emp_no) references employees (emp_no)
);

create table titles (title_id text primary key, title text not null);

SELECT
  e.emp_no,
  e.last_name,
  e.first_name,
  e.sex,
  s.salary
FROM
  employees e
  JOIN salaries s ON e.emp_no = s.emp_no
LIMIT
  10;

SELECT
  first_name,
  last_name,
  hire_date
FROM
  employees
WHERE
  hire_date BETWEEN '1986-01-01' AND '1986-12-31'
LIMIT
  10;

SELECT
  dm.dept_no,
  d.dept_name,
  dm.emp_no,
  e.last_name,
  e.first_name
FROM
  dept_manager dm
  JOIN departments d ON dm.dept_no = d.dept_no
  JOIN employees e ON dm.emp_no = e.emp_no
LIMIT
  10;

SELECT
  de.dept_no,
  e.emp_no,
  e.last_name,
  e.first_name,
  d.dept_name
FROM
  dept_emp de
  JOIN employees e ON de.emp_no = e.emp_no
  JOIN departments d ON de.dept_no = d.dept_no
LIMIT
  10;

SELECT
  first_name,
  last_name,
  sex
FROM
  employees
WHERE
  first_name = 'Hercules' 
  AND last_name like 'B'
LIMIT
  10;

SELECT
  e.emp_no,
  e.last_name,
  e.first_name
FROM
  employees e
  join dept_emp de on e.emp_no = de.emp_no
  join departments d on de.dept_no = d.dept_no
WHERE
  d.dept_name = 'Sales'
LIMIT
  15;


  SELECT
  e.emp_no,
  e.last_name,
  e.first_name,
  d.dept_name
FROM
  employees e
  join dept_emp de on e.emp_no = de.emp_no
  join departments d on de.dept_no = d.dept_no
WHERE
  d.dept_name in ('Sales', 'Development')
LIMIT
  5;
  SELECT
  last_name,
  count(*) as frequency
FROM
  employees
group by
  last_name
order by
  frequency desc
LIMIT
  15;