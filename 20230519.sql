SELECT COUNT(*) CNT1, COUNT(salary) CNT2, AVG(salary) AVG1, AVG(NVL(salary, 0)) AVG2 FROM employees;

SELECT SUM(NVL(salary, 0)), NVL(SUM(salary), 0) FROM employees;
SELECT AVG(NVL(salary, 0)), NVL(AVG(salary), 0) FROM employees;

SELECT COUNT(department_id) "부서의 갯수", COUNT(DISTINCT department_id) "부서 종류의 갯수", COUNT(DISTINCT job_id) "업무 종류의 갯수" FROM employees;

SELECT AVG(salary), SUM(salary) / COUNT(*) FROM employees;
SELECT AVG(salary), SUM(salary) / COUNT(salary) FROM employees;

SELECT COUNT(department_id), COUNT(DISTINCT department_id), SUM(department_id), SUM(DISTINCT department_id) FROM employees;

SELECT department_id, salary FROM employees ORDER BY department_id;
SELECT department_id, AVG(salary) FROM employees GROUP BY department_id ORDER BY department_id;
SELECT job_id, AVG(salary) FROM employees GROUP BY job_id ORDER BY 2;

SELECT department_id 부서번호, COUNT(*) 부서별인원수, AVG(salary) 평균급여, MIN(salary) 최저급여, MAX(salary) 최고급여, SUM(salary) 급여합계 FROM employees GROUP BY department_id ORDER BY department_id NULLS FIRST;
SELECT department_id 부서번호, COUNT(*) 부서별인원수, AVG(salary) 평균급여, MIN(salary) 최저급여, MAX(salary) 최고급여, SUM(salary) 급여합계 FROM employees GROUP BY department_id ORDER BY department_id DESC NULLS LAST;

SELECT job_id 업무, COUNT(*) 인원수, SUM(salary) 급여합계, AVG(salary) 급여평균 FROM employees GROUP BY job_id;

SELECT department_id 부서번호, job_id 업무, COUNT(*) 인원수, SUM(salary) 급여합계, AVG(salary) 급여평균 FROM employees GROUP BY job_id, department_id;