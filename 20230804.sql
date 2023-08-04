-- [NATURAL JOIN] departments, locations 테이블을 NATURAL JOIN 하여 부서번호, 부서명, 지역코드, 근무도시 조회(단, 10, 30번 부서만 조회)
SELECT department_id 부서번호, department_name 부서명, location_id 지역코드, city 근무도시 
FROM departments NATURAL JOIN locations WHERE department_id IN(10, 30);

-- [NATURAL JOIN] 사원명, 급여, 부서명, 부서번호, 근무도시를 NATURAL JOIN을 이용하여 조회(사원명 순으로 정렬)
SELECT first_name 사원명, salary 급여, department_id 부서번호, department_name 부서명, city 근무도시 
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

-- 현재 내가 가지고 있는 테이블 다 보기
SELECT * FROM tab;

INSERT INTO test_join VALUES('1000', 20);
INSERT INTO test_natural_join VALUES('10', 'TEST_JOB', 1000);

-- 성공(타입이 다르지만 같은 값이므로)
SELECT * FROM test_join NATURAL JOIN test_natural_join;

INSERT INTO test_join VALUES('ABC', 20);

-- 에러(타입이 다르고 값도 일치하지 않으므로)
SELECT * FROM test_join NATURAL JOIN test_natural_join;

-- [JOIN USING] employees, departments 테이블을 이용해 사원명, 부서번호, 부서명을 USING 절을 이용해서 조회
SELECT first_name 사원명, department_id 부서번호, department_name 부서명 
FROM employees JOIN departments USING(department_id);

-- [JOIN USING] departments, locations 테이블을 이용해 부서번호, 부서명, 지역코드, 도시 정보를 USING 절을 이용해서 조회(단, 부서번호 20, 50, 80, 110번만 부서번호 순으로 정렬)
SELECT department_id 부서번호, department_name 부서명, location_id 지역코드, city "도시 정보" 
FROM departments JOIN locations USING(location_id) WHERE department_id IN(20, 50, 80, 110) ORDER BY 1;

-- [NATURAL JOIN + JOIN USING] 사원명, 부서명, 근무도시 정보 조회(USING절 사용)
SELECT first_name 사원명, department_name 부서명, city "근무도시 정보" 
FROM employees JOIN departments USING(department_id) JOIN locations USING(location_id);

-- [JOIN ON + SELF JOIN] 사원명, 급여, 해당 사원의 매니저명, 매니저급여 조회(JOIN ~ ON 구문 이용)
SELECT e.first_name 사원명, e.salary 급여, m.first_name 매니저명, m.salary 매니저급여 
FROM employees e JOIN employees m ON e.manager_id = m.employee_id;

-- [JOIN ON] 이름에 A,a 문자가 없는 사원의 사원명, 부서명, 근무도시 정보 조회(사원명 순으로 정렬)
SELECT first_name 사원명, department_name 부서명, city "근무도시 정보" 
FROM employees JOIN departments ON employees.department_id = departments.department_id JOIN locations ON departments.location_id = locations.location_id 
WHERE first_name NOT LIKE '%A%' AND first_name NOT LIKE '%a%' ORDER BY 1;

-- [LEFT OUTER JOIN] departments 테이블의 부서명, 지역코드와 location 테이블의 지역코드, 도시명 조회(근무지역이 설정되지 않은 부서명도 조회)
SELECT d.department_name 부서명, d.location_id "지역코드(departments)", l.location_id "지역코드(locations)", l.city 도시명 
FROM departments d LEFT OUTER JOIN locations l ON d.location_id = l.location_id;
SELECT d.department_name 부서명, d.location_id "지역코드(departments)", l.location_id "지역코드(locations)", l.city 도시명 
FROM departments d, locations l WHERE d.location_id = l.location_id(+);

-- [RIGHT OUTER JOIN] departments 테이블의 부서명, 지역코드와 location 테이블의 지역코드, 도시명 조회(부서가 없는 도시명도 조회)
SELECT d.department_name 부서명, d.location_id "지역코드(departments)", l.location_id "지역코드(locations)", l.city 도시명 
FROM departments d RIGHT OUTER JOIN locations l ON d.location_id = l.location_id;
SELECT d.department_name 부서명, d.location_id "지역코드(departments)", l.location_id "지역코드(locations)", l.city 도시명 
FROM departments d, locations l WHERE d.location_id(+) = l.location_id;

-- [FULL OUTER JOIN] departments 테이블의 부서명, 지역코드와 location 테이블의 지역코드, 도시명 조회(부서가 없는 도시명과 근무지역이 없는 부서명 모두 조회)
SELECT d.department_name 부서명, d.location_id "지역코드(departments)", l.location_id "지역코드(locations)", l.city 도시명 
FROM departments d FULL OUTER JOIN locations l ON d.location_id = l.location_id;
SELECT d.department_name 부서명, d.location_id "지역코드(departments)", l.location_id "지역코드(locations)", l.city 도시명 
FROM departments d, locations l WHERE d.location_id = l.location_id(+)
UNION SELECT d.department_name 부서명, d.location_id "지역코드(departments)", l.location_id "지역코드(locations)", l.city 도시명 
FROM departments d, locations l WHERE d.location_id(+) = l.location_id;

SELECT e.first_name 이름, e.salary 급여, d.department_id 부서번호, d.department_name 부서명
FROM departments d LEFT OUTER JOIN employees e ON e.department_id = d.department_id
-- WHERE를 쓰게 되면 먼저 급여에 null이 걸러짐.
AND salary > 3000;