-- [���� �� ��������, GROUP BY] �μ��� �ּұ޿��� 80�� �μ��� �ּұ޿����� ���� �μ� ��ȸ
SELECT department_id, MIN(salary) FROM employees 
GROUP BY department_id HAVING MIN(salary) > (SELECT MIN(salary) FROM employees WHERE department_id = 80);

-- [���� �� ��������, JOIN, DECODE(+SIGN)] employees ���̺��� �޿��� ������ ��� �޿����� ���� ����� �������,
-- ������ ��� �޿��� 10% �ʰ��ϴ� ����� �޿��� 5%�� �����Ͽ� ��ȸ�Ͻÿ�.
SELECT first_name, salary, e.job_id, avg_sal ��ձ޿�,
DECODE(SIGN(salary - avg_sal * 1.1), 1, salary * 0.05, 0) ������,
salary - DECODE(SIGN(salary - avg_sal * 1.1), 1, salary * 0.05, 0) �Ǽ��ɾ�
FROM employees e, (SELECT job_id, AVG(salary) avg_sal FROM employees GROUP BY job_id) avg_tbl
WHERE e.job_id = avg_tbl.job_id AND salary > avg_sal;

-- error: ������������ ���� ���� ���� ������ ���� 
SELECT employee_id, first_name, salary, department_id
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees GROUP BY department_id)
ORDER BY department_id;

SELECT department_id, MAX(salary) FROM employees GROUP BY department_id ORDER BY department_id;

-- [���� �� ��������(IN)] IN�� ����Ͽ� ����
SELECT employee_id, first_name, salary, e.department_id
FROM employees e, (SELECT department_id, MAX(salary) max_sal FROM employees GROUP BY department_id) dept_tbl
WHERE e.department_id = dept_tbl.department_id AND e.salary IN dept_tbl.max_sal
ORDER BY department_id;

-- [���� �� ��������(ANY)] ������ sales�� �ּ� �� �� �̻��� ������� �޿��� ���� �޴� ����� �̸�, �޿�, �����ڵ带 �޿� ������ ��ȸ
SELECT first_name, salary, job_id FROM employees
WHERE salary > ANY (SELECT salary FROM employees WHERE job_id LIKE 'SA_%')
ORDER BY 2;

-- [���� �� ��������(ALL)] ������ sales�� ��� ������� �޿��� ���� �޴� ����� �̸�, �޿�, �����ڵ带 �޿� ������ ��ȸ
SELECT first_name, salary, job_id FROM employees
WHERE salary > ALL (SELECT salary FROM employees WHERE job_id LIKE 'SA_%')
ORDER BY 2;

-- TABLE ����
CREATE TABLE TEMP_EMP
AS (SELECT * FROM employees);