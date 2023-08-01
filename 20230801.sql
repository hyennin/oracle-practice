-- ANSI JOIN - NATURAL JOIN(�÷����� ���� �����͸� ��� ����)
SELECT * FROM employees NATURAL JOIN departments;
SELECT * FROM employees emp, departments dept WHERE emp.department_id = dept.department_id AND emp.manager_id = dept.manager_id;

-- ANSI JOIN - JOIN USING(�÷��� �߿� ����ϰ� ���� �͸� ���ؼ� ����)
SELECT * FROM employees JOIN departments USING(department_id);
SELECT * FROM employees emp, departments dept WHERE emp.department_id = dept.department_id;
-- NATURAL JOIN�� ������ ���(JOIN USING ���)
SELECT * FROM employees JOIN departments USING(department_id, manager_id);

-- ANSI JOIN - JOIN ON(�÷����� �ٸ� �͵� �� ����)
SELECT * FROM employees JOIN departments ON employees.department_id = departments.department_id;
SELECT * FROM employees JOIN departments WHERE employees.department_id = departments.department_id;

-- ANSI JOIN - RIGHT OUTER JOIN(�����ʿ� �ִ� ������ �� ����)
SELECT * FROM employees RIGHT OUTER JOIN departments ON employees.department_id = departments.department_id;
SELECT * FROM employees, departments WHERE employees.department_id(+) = departments.department_id;

-- ANSI JOIN - LEFT OUTER JOIN(���ʿ� �ִ� ������ �� ����)
SELECT * FROM employees LEFT OUTER JOIN departments ON employees.department_id = departments.department_id;
SELECT * FROM employees, departments WHERE employees.department_id = departments.department_id(+);
SELECT * FROM departments RIGHT OUTER JOIN employees ON employees.department_id = departments.department_id;

-- ANSI JOIN - FULL OUTER JOIN(���ʿ� �ִ� ������ �� ����)
SELECT * FROM employees FULL OUTER JOIN departments ON employees.department_id = departments.department_id;
SELECT * FROM employees, departments WHERE employees.department_id(+) = departments.department_id
UNION 
SELECT * FROM employees, departments WHERE employees.department_id = departments.department_id(+);

-- ANSI JOIN - CROSS JOIN
SELECT emp.employee_id, dept.department_name FROM employees emp CROSS JOIN departments dept;

-- [NATURAL JOIN]employees, departments ���̺��� �����, �μ���ȣ, �μ����� NATURAL JOIN�� �̿��Ͽ� ��ȸ(����� ������ ��ȸ)
SELECT first_name �����, department_id �μ���ȣ, department_name �μ��� FROM employees NATURAL JOIN departments ORDER BY 1;