-- ANSI JOIN - NATURAL JOIN(컬럼명이 갈은 데이터만 모두 나옴)
SELECT * FROM employees NATURAL JOIN departments;
SELECT * FROM employees emp, departments dept WHERE emp.department_id = dept.department_id AND emp.manager_id = dept.manager_id;

-- ANSI JOIN - JOIN USING(컬럼명 중에 사용하고 싶은 것만 비교해서 나옴)
SELECT * FROM employees JOIN departments USING(department_id);
SELECT * FROM employees emp, departments dept WHERE emp.department_id = dept.department_id;
-- NATURAL JOIN과 동일한 결과(JOIN USING 사용)
SELECT * FROM employees JOIN departments USING(department_id, manager_id);

-- ANSI JOIN - JOIN ON(컬럼명이 다른 것도 비교 가능)
SELECT * FROM employees JOIN departments ON employees.department_id = departments.department_id;
SELECT * FROM employees JOIN departments WHERE employees.department_id = departments.department_id;

-- ANSI JOIN - RIGHT OUTER JOIN(오른쪽에 있는 데이터 다 나옴)
SELECT * FROM employees RIGHT OUTER JOIN departments ON employees.department_id = departments.department_id;
SELECT * FROM employees, departments WHERE employees.department_id(+) = departments.department_id;

-- ANSI JOIN - LEFT OUTER JOIN(왼쪽에 있는 데이터 다 나옴)
SELECT * FROM employees LEFT OUTER JOIN departments ON employees.department_id = departments.department_id;
SELECT * FROM employees, departments WHERE employees.department_id = departments.department_id(+);
SELECT * FROM departments RIGHT OUTER JOIN employees ON employees.department_id = departments.department_id;

-- ANSI JOIN - FULL OUTER JOIN(양쪽에 있는 데이터 다 나옴)
SELECT * FROM employees FULL OUTER JOIN departments ON employees.department_id = departments.department_id;
SELECT * FROM employees, departments WHERE employees.department_id(+) = departments.department_id
UNION 
SELECT * FROM employees, departments WHERE employees.department_id = departments.department_id(+);

-- ANSI JOIN - CROSS JOIN
SELECT emp.employee_id, dept.department_name FROM employees emp CROSS JOIN departments dept;

-- [NATURAL JOIN]employees, departments 테이블에서 사원명, 부서번호, 부서명을 NATURAL JOIN을 이용하여 조회(사원명 순으로 조회)
SELECT first_name 사원명, department_id 부서번호, department_name 부서명 FROM employees NATURAL JOIN departments ORDER BY 1;