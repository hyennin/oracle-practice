SELECT job_id FROM employees WHERE employee_id = 120;
SELECT first_name, job_id FROM employees WHERE job_id = 'ST_MAN';

-- 서브쿼리 사용
SELECT first_name, job_id FROM employees 
WHERE job_id = (SELECT job_id FROM employees WHERE employee_id = 120);

-- [단일 행 서브쿼리] 150번 사원보다 급여가 많은 사원의 이름과 급여를 급여가 많은 순으로 조회
SELECT first_name, salary FROM employees
WHERE salary > (SELECT salary FROM employees WHERE employee_id = 150) ORDER BY 2 DESC;

-- [단일 행 서브쿼리] 급여를 가장 많이 받는 사원의 이름, 부서번호, 급여, 입사일 조회
SELECT first_name, department_id, salary, hire_date FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);
-- 에러(그룹 함수는 변수랑 비교 X)
SELECT first_name, department_id, salary, hire_date FROM employees
WHERE salary = MAX(salary);

-- [단일 행 서브쿼리] 급여가 평균 급여보다 적은 사원의 사원번호, 이름, 업무코드, 급여, 부서번호 조회
SELECT employee_id, first_name, job_id, salary, department_id FROM employees
WHERE salary < (SELECT AVG(salary) FROM employees);

-- [단일 행 서브쿼리, JOIN] 사원번호가 162인 사원과 업무가 같고, 급여가 Clara보다 많은 사원의 사원번호, 이름, 담당업무명, 입사일자, 급여 조회
SELECT employee_id, first_name, job_title, hire_date, salary FROM employees e, jobs j
WHERE e.job_id = j.job_id  
AND e.job_id = (SELECT job_id FROM employees WHERE employee_id = 162)
AND salary > (SELECT salary FROM employees WHERE first_name = 'Clara');

SELECT MIN(salary) FROM employees
WHERE