SELECT emp.employee_id 사원번호, emp.first_name 사원명, emp.manager_id 관리자번호, man.first_name 관리자명
FROM employees emp, employees man
WHERE emp.first_name = 'Ellen' AND emp.manager_id = man.employee_id;

SELECT emp.employee_id 사원번호, emp.first_name 사원명, emp.manager_id 관리자번호, man.first_name 관리자명
FROM employees emp, employees man
WHERE emp.manager_id = man.employee_id;

SELECT emp.employee_id 사원번호, emp.first_name 사원명, emp.manager_id 관리자번호, man.first_name 관리자명
FROM employees emp, employees man
WHERE emp.manager_id = man.employee_id(+);

SELECT CONCAT(emp.first_name, CONCAT(' 관리자는 ', man.first_name)) 관리자정보
FROM employees emp, employees man
WHERE emp.manager_id = man.employee_id(+) ORDER BY emp.first_name;

SELECT emp.first_name || ' 관리자는 ' || NVL(man.first_name, '없음') 관리자정보
FROM employees emp, employees man
WHERE emp.manager_id = man.employee_id(+) ORDER BY emp.first_name;

