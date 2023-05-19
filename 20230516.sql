SELECT COUNT(*) FROM employees;

SELECT AVG(salary) FROM Employees;

SELECT MIN(first_name), MAX(first_name), MIN(hire_date), MAX(hire_date) FROM employees;

SELECT AVG(salary) 평균, MAX(salary) 최고값, MIN(salary) 최저값, SUM(salary) 함계 FROM employees WHERE job_id = 'IT_PROG';

SELECT COUNT(*) CNT1, COUNT(salary) CNT2, AVG(salary) AVG1, AVG(NVL2(salary, 0)) AVG2 FROM employees;