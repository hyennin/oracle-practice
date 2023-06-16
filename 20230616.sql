SELECT employee_id, first_name, emp.job_id, emp.department_id, dept.department_id, dept.department_name
FROM employees emp, departments dept
WHERE emp.department_id = dept.department_id
ORDER BY emp.department_id;

SELECT employee_id, first_name, emp.job_id, emp.department_id, dept.department_id, dept.department_name
FROM employees emp, departments dept
WHERE emp.department_id(+) = dept.department_id
ORDER BY emp.department_id;

SELECT employee_id, first_name, emp.job_id, emp.department_id, dept.department_id, dept.department_name
FROM employees emp, departments dept
WHERE emp.department_id = dept.department_id(+)
ORDER BY emp.department_id;

SELECT dept.department_id, dept.department_name, loc.city
FROM departments dept, locations loc
WHERE dept.location_id = loc.location_id(+);

SELECT dept.department_id, dept.department_name, loc.city
FROM departments dept, locations loc
WHERE dept.location_id(+) = loc.location_id;

SELECT dept.department_id, dept.department_name, loc.city
FROM departments dept, locations loc
WHERE dept.location_id = loc.location_id(+)
UNION ALL
SELECT dept.department_id, dept.department_name, loc.city
FROM departments dept, locations loc
WHERE dept.location_id(+) = loc.location_id;

SELECT employee_id, first_name, job_id, emp.department_id, dept.department_id, dept.department_name
FROM employees emp, departments dept
WHERE emp.department_id = dept.department_id(+)
UNION
SELECT employee_id, first_name, job_id, emp.department_id, dept.department_id, dept.department_name
FROM employees emp, departments dept
WHERE emp.department_id(+) = dept.department_id
ORDER BY 1;

SELECT first_name, salary, dept.department_id, dept.department_name
FROM employees emp, departments dept
WHERE emp.department_id(+) = dept.department_id AND salary(+) > 2000
ORDER BY 1;