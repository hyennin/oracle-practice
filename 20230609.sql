SELECT * FROM jobs;
SELECT * FROM departments;

SELECT employees.first_name, employees.department_id, departments.department_id, departments.department_name 
FROM employees, departments;

SELECT employees.first_name, employees.department_id, departments.department_id, departments.department_name 
FROM employees, departments 
WHERE employees.department_id = departments.department_id;

SELECT employees.employee_id, employees.first_name, employees.salary, employees.department_id, departments.location_id
FROM employees, departments 
WHERE employees.department_id = departments.department_id AND employees.job_id = 'FI_MGR';

SELECT employees.first_name, departments.department_name, employees.salary, locations.city 
FROM employees, departments, locations 
WHERE employees.department_id = departments.department_id AND departments.location_id = locations.location_id;

SELECT employees.first_name name, employees.salary salary, jobs.job_title job, employees.hire_date hiredate, employees.commission_pct bonus, employees.department_id dept, locations.city city
FROM employees, jobs, departments, locations
WHERE employees.job_id = jobs.job_id AND employees.department_id = departments.department_id AND departments.location_id = locations.location_id AND locations.city = 'Seattle' AND employees.salary >= 5000 
ORDER BY first_name;

SELECT departments.department_name, employees.first_name, jobs.job_title
FROM departments, employees, jobs
WHERE departments.department_id = employees.department_id AND employees.job_id = jobs.job_id AND job_title LIKE '%Manager';

SELECT employees.first_name, locations.city, locations.state_province FROM employees, departments, locations
WHERE employees.department_id = departments.department_id AND departments.location_id = locations.location_id AND first_name = 'Michael';