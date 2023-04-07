SHOW USER
SELECT employee_id, first_name, LOWER(job_id), INITCAP(job_id) FROM employees WHERE department_id = 10;
SELECT employee_id, first_name, job_id, CONCAT(employee_id, first_name) FIRST_NAME, CONCAT(first_name, job_id) E_EMPLOYEE_ID, CONCAT(first_name, employee_id) E_JOB FROM employees WHERE department_id = 10;
