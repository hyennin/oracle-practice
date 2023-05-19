SELECT COUNT(*) CNT1, COUNT(salary) CNT2, AVG(salary) AVG1, AVG(NVL(salary, 0)) AVG2 FROM employees;

SELECT SUM(NVL(salary, 0)), NVL(SUM(salary), 0) FROM employees;
SELECT AVG(NVL(salary, 0)), NVL(AVG(salary), 0) FROM employees;

SELECT COUNT(department_id) "�μ��� ����", COUNT(DISTINCT department_id) "�μ� ������ ����", COUNT(DISTINCT job_id) "���� ������ ����" FROM employees;

SELECT AVG(salary), SUM(salary) / COUNT(*) FROM employees;
SELECT AVG(salary), SUM(salary) / COUNT(salary) FROM employees;

SELECT COUNT(department_id), COUNT(DISTINCT department_id), SUM(department_id), SUM(DISTINCT department_id) FROM employees;

SELECT department_id, salary FROM employees ORDER BY department_id;
SELECT department_id, AVG(salary) FROM employees GROUP BY department_id ORDER BY department_id;
SELECT job_id, AVG(salary) FROM employees GROUP BY job_id ORDER BY 2;

SELECT department_id �μ���ȣ, COUNT(*) �μ����ο���, AVG(salary) ��ձ޿�, MIN(salary) �����޿�, MAX(salary) �ְ�޿�, SUM(salary) �޿��հ� FROM employees GROUP BY department_id ORDER BY department_id NULLS FIRST;
SELECT department_id �μ���ȣ, COUNT(*) �μ����ο���, AVG(salary) ��ձ޿�, MIN(salary) �����޿�, MAX(salary) �ְ�޿�, SUM(salary) �޿��հ� FROM employees GROUP BY department_id ORDER BY department_id DESC NULLS LAST;

SELECT job_id ����, COUNT(*) �ο���, SUM(salary) �޿��հ�, AVG(salary) �޿���� FROM employees GROUP BY job_id;

SELECT department_id �μ���ȣ, job_id ����, COUNT(*) �ο���, SUM(salary) �޿��հ�, AVG(salary) �޿���� FROM employees GROUP BY job_id, department_id;