SELECT job_id FROM employees WHERE employee_id = 120;
SELECT first_name, job_id FROM employees WHERE job_id = 'ST_MAN';

-- �������� ���
SELECT first_name, job_id FROM employees 
WHERE job_id = (SELECT job_id FROM employees WHERE employee_id = 120);

-- [���� �� ��������] 150�� ������� �޿��� ���� ����� �̸��� �޿��� �޿��� ���� ������ ��ȸ
SELECT first_name, salary FROM employees
WHERE salary > (SELECT salary FROM employees WHERE employee_id = 150) ORDER BY 2 DESC;

-- [���� �� ��������] �޿��� ���� ���� �޴� ����� �̸�, �μ���ȣ, �޿�, �Ի��� ��ȸ
SELECT first_name, department_id, salary, hire_date FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);
-- ����(�׷� �Լ��� ������ �� X)
SELECT first_name, department_id, salary, hire_date FROM employees
WHERE salary = MAX(salary);

-- [���� �� ��������] �޿��� ��� �޿����� ���� ����� �����ȣ, �̸�, �����ڵ�, �޿�, �μ���ȣ ��ȸ
SELECT employee_id, first_name, job_id, salary, department_id FROM employees
WHERE salary < (SELECT AVG(salary) FROM employees);

-- [���� �� ��������, JOIN] �����ȣ�� 162�� ����� ������ ����, �޿��� Clara���� ���� ����� �����ȣ, �̸�, ��������, �Ի�����, �޿� ��ȸ
SELECT employee_id, first_name, job_title, hire_date, salary FROM employees e, jobs j
WHERE e.job_id = j.job_id  
AND e.job_id = (SELECT job_id FROM employees WHERE employee_id = 162)
AND salary > (SELECT salary FROM employees WHERE first_name = 'Clara');

SELECT MIN(salary) FROM employees
WHERE