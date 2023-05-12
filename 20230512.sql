SELECT department_id, first_name, salary, commission_pct, salary + salary * NVL(commission_pct, 0) 금월급여 FROM employees WHERE department_id IN(30, 80);
SELECT department_id, first_name, salary, commission_pct, salary * (1 + NVL(commission_pct, 0)) 금월급여 FROM employees WHERE department_id IN(30, 80);

SELECT department_id, first_name, manager_id, NVL2(manager_id, manager_id || '담당', '상위자') 담당매니저 FROM employees WHERE department_id IN(20, 90);
SELECT department_id, first_name, manager_id, NVL2(manager_id, CONCAT(manager_id, '담당'), '상위자') 담당매니저 FROM employees WHERE department_id IN(20, 90);

SELECT first_name, job_id, NULLIF(job_id, 'PU_CLERK') 결과 FROM employees WHERE department_id = 30 ORDER BY first_name;

SELECT first_name, commission_pct, salary, COALESCE(commission_pct, salary, 0.5) 결과 FROM employees;

SELECT first_name, salary, salary * commission_pct + 6000 비교값, GREATEST(salary, salary * commission_pct + 6000) 결과 FROM employees WHERE salary IS NOT NULL AND commission_pct IS NOT NULL;

SELECT first_name, salary, salary * commission_pct + 6000 비교값, LEAST(salary, salary * commission_pct + 6000) 결과 FROM employees WHERE salary IS NOT NULL AND commission_pct IS NOT NULL;

SELECT employee_id, first_name, job_id, salary, 
salary * (1 + DECODE(job_id, 'FI_ACCOUNT', 0.1,
'IT_PROG', 0.2,
'SA_REP', 0.3,
'PU_CLERK', 0.4,
0
)) 결과
FROM employees ORDER BY 결과;

SELECT employee_id, first_name, job_id, salary, 
CASE job_id 
WHEN 'FI_ACCOUNT' THEN salary * 1.1
WHEN 'IT_PROG' THEN salary * 1.2
WHEN 'SA_REP' THEN salary * 1.3
WHEN 'PU_CLERK' THEN salary * 1.4
ELSE salary 
END 결과
FROM employees ORDER BY 결과;

SELECT department_id, first_name, salary, 
DECODE(SIGN(salary-3000), -1, 'A', DECODE(SIGN(salary - 7500), -1, 'B', 'C')) GRADE 
FROM employees WHERE department_id IN(30, 40, 90);

SELECT department_id, first_name, salary,
CASE 
WHEN salary < 3000 THEN 'A'
WHEN salary < 7500 THEN 'B'
ELSE 'C'
END GRADE
FROM employees WHERE department_id IN (30, 40, 90);