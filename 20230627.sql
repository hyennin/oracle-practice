SELECT emp.employee_id �����ȣ, emp.first_name �����, emp.manager_id �����ڹ�ȣ, man.first_name �����ڸ�
FROM employees emp, employees man
WHERE emp.first_name = 'Ellen' AND emp.manager_id = man.employee_id;

SELECT emp.employee_id �����ȣ, emp.first_name �����, emp.manager_id �����ڹ�ȣ, man.first_name �����ڸ�
FROM employees emp, employees man
WHERE emp.manager_id = man.employee_id;

SELECT emp.employee_id �����ȣ, emp.first_name �����, emp.manager_id �����ڹ�ȣ, man.first_name �����ڸ�
FROM employees emp, employees man
WHERE emp.manager_id = man.employee_id(+);

SELECT CONCAT(emp.first_name, CONCAT(' �����ڴ� ', man.first_name)) ����������
FROM employees emp, employees man
WHERE emp.manager_id = man.employee_id(+) ORDER BY emp.first_name;

SELECT emp.first_name || ' �����ڴ� ' || NVL(man.first_name, '����') ����������
FROM employees emp, employees man
WHERE emp.manager_id = man.employee_id(+) ORDER BY emp.first_name;

