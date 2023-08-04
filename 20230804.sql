-- [NATURAL JOIN] departments, locations ���̺��� NATURAL JOIN �Ͽ� �μ���ȣ, �μ���, �����ڵ�, �ٹ����� ��ȸ(��, 10, 30�� �μ��� ��ȸ)
SELECT department_id �μ���ȣ, department_name �μ���, location_id �����ڵ�, city �ٹ����� 
FROM departments NATURAL JOIN locations WHERE department_id IN(10, 30);

-- [NATURAL JOIN] �����, �޿�, �μ���, �μ���ȣ, �ٹ����ø� NATURAL JOIN�� �̿��Ͽ� ��ȸ(����� ������ ����)
SELECT first_name �����, salary �޿�, department_id �μ���ȣ, department_name �μ���, city �ٹ����� 
FROM employees NATURAL JOIN departments NATURAL JOIN locations ORDER BY 1;

CREATE TABLE test_join(
    test varchar2(20),
    no number(2)
);

CREATE TABLE test_natural_join(
    job_id varchar2(10),
    job_title varchar(25) NOT NULL,
    test number(10)
);

-- ���� ���� ������ �ִ� ���̺� �� ����
SELECT * FROM tab;

INSERT INTO test_join VALUES('1000', 20);
INSERT INTO test_natural_join VALUES('10', 'TEST_JOB', 1000);

-- ����(Ÿ���� �ٸ����� ���� ���̹Ƿ�)
SELECT * FROM test_join NATURAL JOIN test_natural_join;

INSERT INTO test_join VALUES('ABC', 20);

-- ����(Ÿ���� �ٸ��� ���� ��ġ���� �����Ƿ�)
SELECT * FROM test_join NATURAL JOIN test_natural_join;

-- [JOIN USING] employees, departments ���̺��� �̿��� �����, �μ���ȣ, �μ����� USING ���� �̿��ؼ� ��ȸ
SELECT first_name �����, department_id �μ���ȣ, department_name �μ��� 
FROM employees JOIN departments USING(department_id);

-- [JOIN USING] departments, locations ���̺��� �̿��� �μ���ȣ, �μ���, �����ڵ�, ���� ������ USING ���� �̿��ؼ� ��ȸ(��, �μ���ȣ 20, 50, 80, 110���� �μ���ȣ ������ ����)
SELECT department_id �μ���ȣ, department_name �μ���, location_id �����ڵ�, city "���� ����" 
FROM departments JOIN locations USING(location_id) WHERE department_id IN(20, 50, 80, 110) ORDER BY 1;

-- [NATURAL JOIN + JOIN USING] �����, �μ���, �ٹ����� ���� ��ȸ(USING�� ���)
SELECT first_name �����, department_name �μ���, city "�ٹ����� ����" 
FROM employees JOIN departments USING(department_id) JOIN locations USING(location_id);

-- [JOIN ON + SELF JOIN] �����, �޿�, �ش� ����� �Ŵ�����, �Ŵ����޿� ��ȸ(JOIN ~ ON ���� �̿�)
SELECT e.first_name �����, e.salary �޿�, m.first_name �Ŵ�����, m.salary �Ŵ����޿� 
FROM employees e JOIN employees m ON e.manager_id = m.employee_id;

-- [JOIN ON] �̸��� A,a ���ڰ� ���� ����� �����, �μ���, �ٹ����� ���� ��ȸ(����� ������ ����)
SELECT first_name �����, department_name �μ���, city "�ٹ����� ����" 
FROM employees JOIN departments ON employees.department_id = departments.department_id JOIN locations ON departments.location_id = locations.location_id 
WHERE first_name NOT LIKE '%A%' AND first_name NOT LIKE '%a%' ORDER BY 1;

-- [LEFT OUTER JOIN] departments ���̺��� �μ���, �����ڵ�� location ���̺��� �����ڵ�, ���ø� ��ȸ(�ٹ������� �������� ���� �μ��� ��ȸ)
SELECT d.department_name �μ���, d.location_id "�����ڵ�(departments)", l.location_id "�����ڵ�(locations)", l.city ���ø� 
FROM departments d LEFT OUTER JOIN locations l ON d.location_id = l.location_id;
SELECT d.department_name �μ���, d.location_id "�����ڵ�(departments)", l.location_id "�����ڵ�(locations)", l.city ���ø� 
FROM departments d, locations l WHERE d.location_id = l.location_id(+);

-- [RIGHT OUTER JOIN] departments ���̺��� �μ���, �����ڵ�� location ���̺��� �����ڵ�, ���ø� ��ȸ(�μ��� ���� ���ø� ��ȸ)
SELECT d.department_name �μ���, d.location_id "�����ڵ�(departments)", l.location_id "�����ڵ�(locations)", l.city ���ø� 
FROM departments d RIGHT OUTER JOIN locations l ON d.location_id = l.location_id;
SELECT d.department_name �μ���, d.location_id "�����ڵ�(departments)", l.location_id "�����ڵ�(locations)", l.city ���ø� 
FROM departments d, locations l WHERE d.location_id(+) = l.location_id;

-- [FULL OUTER JOIN] departments ���̺��� �μ���, �����ڵ�� location ���̺��� �����ڵ�, ���ø� ��ȸ(�μ��� ���� ���ø�� �ٹ������� ���� �μ��� ��� ��ȸ)
SELECT d.department_name �μ���, d.location_id "�����ڵ�(departments)", l.location_id "�����ڵ�(locations)", l.city ���ø� 
FROM departments d FULL OUTER JOIN locations l ON d.location_id = l.location_id;
SELECT d.department_name �μ���, d.location_id "�����ڵ�(departments)", l.location_id "�����ڵ�(locations)", l.city ���ø� 
FROM departments d, locations l WHERE d.location_id = l.location_id(+)
UNION SELECT d.department_name �μ���, d.location_id "�����ڵ�(departments)", l.location_id "�����ڵ�(locations)", l.city ���ø� 
FROM departments d, locations l WHERE d.location_id(+) = l.location_id;

SELECT e.first_name �̸�, e.salary �޿�, d.department_id �μ���ȣ, d.department_name �μ���
FROM departments d LEFT OUTER JOIN employees e ON e.department_id = d.department_id
-- WHERE�� ���� �Ǹ� ���� �޿��� null�� �ɷ���.
AND salary > 3000;