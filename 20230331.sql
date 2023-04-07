SELECT employee_id, first_name, length(first_name), salary, length(salary) FROM employees WHERE department_id = 20;

SELECT first_name, INSTR(first_name, 'a', 1, 1) FROM employees;

SELECT first_name, SUBSTR(first_name, 1, 3), 
SUBSTR(first_name, 3),
SUBSTR(first_name, -3, 2)
FROM employees
WHERE department_id = 10;

SELECT parameter, value
FROM nls_database_parameters
WHERE parameter = 'NLS_CHARACTERSET';

SELECT SUBSTRB('I am here with you', 5, 3) 결과1, SUBSTR('나 여기 있어', 5, 3)
결과2, SUBSTRB('나 여기 있어', 5, 3) 결과3
FROM dual;

SELECT '+' || SUBSTRB('I am here with you', 5, 3) || '+' 결과1, '+' || SUBSTR('나 여기 있어', 5, 3) || '+' 
결과2, '+' || SUBSTRB('나 여기 있어', 5, 3) || '+' 결과3 
FROM dual;

SELECT 3 * 4 FROM dual;

DESC dual

SELECT * FROM dual;

SELECT SYSDATE FROM dual;

SELECT SYSTIMESTAMP FROM dual;

SELECT first_name, LPAD(first_name, 15, '*'), salary, LPAD(salary, 10, '*') FROM employees WHERE department_id = 10;

SELECT first_name, RPAD(first_name, 15, '*'), salary, RPAD(salary, 10, '*') FROM employees WHERE department_id = 10;

SELECT first_name, job_id, LTRIM(job_id, 'A'), salary, LTRIM(salary, 1) FROM employees WHERE department_id = 20;

SELECT first_name, job_id, RTRIM(job_id, 'T'), salary, RTRIM(salary, 0) FROM employees WHERE department_id = 20;

SELECT job_id, REPLACE(job_id, 'CO', '*$') 변경결과 FROM employees WHERE department_id = 30;

SELECT job_id, TRANSLATE(job_id, 'CO', '*$') 변경결과 FROM employees WHERE department_id = 30;

SELECT TRIM(LEADING 'A' FROM 'AABDCADDA') 결과1,
TRIM('A' FROM 'ABDCADDA') 결과2,
TRIM(TRAILING 'A' FROM 'AABDCADDA') 결과3
FROM dual;

SELECT employee_id, first_name, TRANSLATE(job_id, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
'abcdefghijklmnopqrstuvwxyz') up_lower FROM employees WHERE department_id = 10;










