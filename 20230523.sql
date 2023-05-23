SELECT department_id �μ���ȣ, job_id ����, COUNT(*) �ο���, SUM(salary) �޿��հ�, AVG(salary) �޿���� FROM employees GROUP BY department_id, job_id ORDER BY department_id, job_id;
SELECT job_id ����, department_id �μ���ȣ, COUNT(*) �ο���, SUM(salary) �޿��հ�, AVG(salary) �޿���� FROM employees GROUP BY department_id, job_id ORDER BY department_id, job_id;
SELECT department_id �μ���ȣ, job_id ����, COUNT(*) �ο���, SUM(salary) �޿��հ�, AVG(salary) �޿���� FROM employees GROUP BY job_id, department_id ORDER BY department_id, job_id;
SELECT job_id ����, department_id �μ���ȣ, COUNT(*) �ο���, SUM(salary) �޿��հ�, AVG(salary) �޿���� FROM employees GROUP BY job_id, department_id ORDER BY department_id, job_id;

SELECT department_id �μ���ȣ, COUNT(*) �ο���, SUM(salary) �޿��հ� FROM employees GROUP BY department_id HAVING COUNT(*) > 4;

SELECT department_id �μ���ȣ, AVG(salary) �޿����, SUM(salary) �޿��հ� FROM employees GROUP BY department_id HAVING MAX(salary) >= 9500;

SELECT job_id, AVG(salary), SUM(salary) FROM employees GROUP BY job_id HAVING AVG(salary) >= 3000;
SELECT job_id, AVG(salary), SUM(salary) FROM employees HAVING AVG(salary) >= 3000 GROUP BY job_id;

SELECT department_id, SUM(salary) FROM employees GROUP BY department_id HAVING SUM(salary) > 10000 AND department_id IN(20, 30);
SELECT department_id, SUM(salary) FROM employees WHERE department_id IN(20, 30) GROUP BY department_id HAVING SUM(salary) > 10000;

SELECT department_id, AVG(salary) FROM employees WHERE job_id = 'FI_MGR' GROUP BY department_id HAVING AVG(salary) > 3000;
SELECT department_id, AVG(salary) FROM employees GROUP BY department_id HAVING AVG(salary) > 3000 AND job_id = 'FI_MGR';

SELECT MAX(SUM(salary)) FROM employees GROUP BY department_id;