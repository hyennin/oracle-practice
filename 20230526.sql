SELECT first_name, hire_date, MIN(hire_date) FROM employees WHERE department_id = 20;
SELECT first_name, hire_date, MIN(hire_date) FROM employees WHERE department_id = 20 GROUP BY first_name, hire_date;

SELECT MIN(hire_date) FROM employees WHERE department_id = 20;

SELECT LISTAGG(first_name, ';')
WITHIN GROUP (ORDER BY first_name DESC) "Ename",
LISTAGG(hire_date, ';')
WITHIN GROUP (ORDER BY first_name DESC) "hiredate",
MIN(hire_date) "Earliest"
FROM employees
WHERE department_id = 20;

SELECT LISTAGG(first_name, '/')
WITHIN GROUP (ORDER BY first_name DESC) "Ename",
LISTAGG(hire_date, ';')
WITHIN GROUP (ORDER BY hire_date DESC) "hiredate",
MIN(hire_date) "Earliest"
FROM employees
WHERE department_id = 20;

SELECT department_id, 
LISTAGG(first_name, ', ')
WITHIN GROUP(ORDER BY hire_date),
LISTAGG(salary, ', ')
WITHIN GROUP(ORDER BY hire_date)
FROM employees
GROUP BY department_id;

SELECT department_id "Dept", hire_date "Date", first_name Name,
LISTAGG(first_name, ', ')
WITHIN GROUP(ORDER BY hire_date, first_name)
OVER(PARTITION BY department_id) "Emp_List"
FROM employees
WHERE hire_date < '03/09/01'
ORDER BY "Dept", "Date", Name;

SELECT department_id, SUM(salary),
LISTAGG(first_name, '/')
WITHIN GROUP(ORDER BY salary) first_name
FROM employees
GROUP BY department_id;

SELECT department_id, COUNT(*) "부서별 인원수", SUM(salary) "급여의 합" FROM employees GROUP BY department_id;
SELECT department_id, COUNT(*) "부서별 인원수", SUM(salary) "급여의 합" FROM employees GROUP BY ROLLUP(department_id);

SELECT department_id 부서, job_id 업무, SUM(salary)급여합 FROM employees GROUP BY ROLLUP(department_id, job_id);
SELECT department_id 부서, job_id 업무, SUM(salary)급여합 FROM employees GROUP BY ROLLUP(job_id, department_id);

SELECT department_id 부서, job_id 업무, manager_id 매니저번호, SUM(salary) 급여합 FROM employees GROUP BY ROLLUP(department_id, job_id, manager_id);

SELECT department_id 부서, job_id 업무, manager_id 매니저번호, SUM(salary) 급여합, 
GROUPING(department_id), GROUPING(job_id), GROUPING(manager_id) 
FROM employees 
GROUP BY ROLLUP(department_id, job_id, manager_id);

