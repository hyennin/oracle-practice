SELECT COUNT(*) FROM employees;

SELECT AVG(salary) FROM Employees;

SELECT MIN(first_name), MAX(first_name), MIN(hire_date), MAX(hire_date) FROM employees;

SELECT AVG(salary) ���, MAX(salary) �ְ�, MIN(salary) ������, SUM(salary) �԰� FROM employees WHERE job_id = 'IT_PROG';

SELECT COUNT(*) CNT1, COUNT(salary) CNT2, AVG(salary) AVG1, AVG(NVL2(salary, 0)) AVG2 FROM employees;