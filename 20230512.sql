SELECT department_id, first_name, salary, commission_pct, salary + salary * NVL(commission_pct, 0) �ݿ��޿� FROM employees WHERE department_id IN(30, 80);
SELECT department_id, first_name, salary, commission_pct, salary * (1 + NVL(commission_pct, 0)) �ݿ��޿� FROM employees WHERE department_id IN(30, 80);

SELECT department_id, first_name, manager_id, NVL2(manager_id, manager_id || '���', '������') ���Ŵ��� FROM employees WHERE department_id IN(20, 90);
SELECT department_id, first_name, manager_id, NVL2(manager_id, CONCAT(manager_id, '���'), '������') ���Ŵ��� FROM employees WHERE department_id IN(20, 90);

SELECT first_name, job_id, NULLIF(job_id, 'PU_CLERK') ��� FROM employees WHERE department_id = 30 ORDER BY first_name;

