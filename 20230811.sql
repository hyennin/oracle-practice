-- [단일 행 서브쿼리, GROUP BY] 부서별 최소급여가 80번 부서의 최소급여보다 많은 부서 조회
SELECT department_id, MIN(salary) FROM employees 
GROUP BY department_id HAVING MIN(salary) > (SELECT MIN(salary) FROM employees WHERE department_id = 80);

-- [단일 행 서브쿼리, JOIN, DECODE(+SIGN)] employees 테이블에서 급여가 업무별 평균 급여보다 높은 사원을 대상으로,
-- 업무별 평균 급여를 10% 초과하는 사원은 급여의 5%를 차감하여 조회하시요.
SELECT first_name, salary, e.job_id, avg_sal 평균급여,
DECODE(SIGN(salary - avg_sal * 1.1), 1, salary * 0.05, 0) 차감액,
salary - DECODE(SIGN(salary - avg_sal * 1.1), 1, salary * 0.05, 0) 실수령액
FROM employees e, (SELECT job_id, AVG(salary) avg_sal FROM employees GROUP BY job_id) avg_tbl
WHERE e.job_id = avg_tbl.job_id AND salary > avg_sal;

-- error: 서브쿼리문의 값이 여러 개가 나오기 때문 
SELECT employee_id, first_name, salary, department_id
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees GROUP BY department_id)
ORDER BY department_id;

SELECT department_id, MAX(salary) FROM employees GROUP BY department_id ORDER BY department_id;

-- [다중 행 서브쿼리(IN)] IN을 사용하여 수정
SELECT employee_id, first_name, salary, e.department_id
FROM employees e, (SELECT department_id, MAX(salary) max_sal FROM employees GROUP BY department_id) dept_tbl
WHERE e.department_id = dept_tbl.department_id AND e.salary IN dept_tbl.max_sal
ORDER BY department_id;

-- [다중 행 서브쿼리(ANY)] 업무가 sales인 최소 한 명 이상의 사원보다 급여를 많이 받는 사원의 이름, 급여, 업무코드를 급여 순으로 조회
SELECT first_name, salary, job_id FROM employees
WHERE salary > ANY (SELECT salary FROM employees WHERE job_id LIKE 'SA_%')
ORDER BY 2;

-- [다중 행 서브쿼리(ALL)] 업무가 sales인 모든 사원보다 급여를 많이 받는 사원의 이름, 급여, 업무코드를 급여 순으로 조회
SELECT first_name, salary, job_id FROM employees
WHERE salary > ALL (SELECT salary FROM employees WHERE job_id LIKE 'SA_%')
ORDER BY 2;

-- TABLE 복사
CREATE TABLE TEMP_EMP
AS (SELECT * FROM employees);