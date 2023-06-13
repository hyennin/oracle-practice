SELECT departments.department_name, employees.job_id, COUNT(*)
FROM departments, employees
WHERE departments.department_id = employees.department_id AND employees.job_id LIKE '%_CLERK'
GROUP BY departments.department_name, employees.job_id
ORDER BY departments.department_name;

SELECT dept.department_name, ROUND(AVG(salary))
FROM departments dept, employees emp
WHERE dept.department_id = emp.department_id
GROUP BY dept.department_name
ORDER BY dept.department_name;

SELECT employee_id, first_name, emp.job_id, salary, jobs.job_title, jobs.min_salary, jobs.max_salary
FROM employees emp, jobs
WHERE emp.job_id = jobs.job_id AND salary BETWEEN jobs.min_salary AND jobs.max_salary
ORDER BY emp.job_id;

