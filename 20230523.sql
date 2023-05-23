SELECT department_id 부서번호, job_id 업무, COUNT(*) 인원수, SUM(salary) 급여합계, AVG(salary) 급여평균 FROM employees GROUP BY department_id, job_id ORDER BY department_id, job_id;
SELECT job_id 업무, department_id 부서번호, COUNT(*) 인원수, SUM(salary) 급여합계, AVG(salary) 급여평균 FROM employees GROUP BY department_id, job_id ORDER BY department_id, job_id;
SELECT department_id 부서번호, job_id 업무, COUNT(*) 인원수, SUM(salary) 급여합계, AVG(salary) 급여평균 FROM employees GROUP BY job_id, department_id ORDER BY department_id, job_id;
SELECT job_id 업무, department_id 부서번호, COUNT(*) 인원수, SUM(salary) 급여합계, AVG(salary) 급여평균 FROM employees GROUP BY job_id, department_id ORDER BY department_id, job_id;

SELECT department_id 부서번호, COUNT(*) 인원수, SUM(salary) 급여합계 FROM employees GROUP BY department_id HAVING COUNT(*) > 4;

SELECT department_id 부서번호, AVG(salary) 급여평균, SUM(salary) 급여합계 FROM employees GROUP BY department_id HAVING MAX(salary) >= 9500;

SELECT job_id, AVG(salary), SUM(salary) FROM employees GROUP BY job_id HAVING AVG(salary) >= 3000;
SELECT job_id, AVG(salary), SUM(salary) FROM employees HAVING AVG(salary) >= 3000 GROUP BY job_id;

SELECT department_id, SUM(salary) FROM employees GROUP BY department_id HAVING SUM(salary) > 10000 AND department_id IN(20, 30);
SELECT department_id, SUM(salary) FROM employees WHERE department_id IN(20, 30) GROUP BY department_id HAVING SUM(salary) > 10000;

SELECT department_id, AVG(salary) FROM employees WHERE job_id = 'FI_MGR' GROUP BY department_id HAVING AVG(salary) > 3000;
SELECT department_id, AVG(salary) FROM employees GROUP BY department_id HAVING AVG(salary) > 3000 AND job_id = 'FI_MGR';

SELECT MAX(SUM(salary)) FROM employees GROUP BY department_id;