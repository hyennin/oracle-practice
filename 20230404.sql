SELECT ROUND(4567.678) 결과1, ROUND(4567.678, 0) 결과2, ROUND(4567.678, 2) 결과3, ROUND(4567.678, -2) 결과4 FROM dual;

SELECT TRUNC(4567.678) 결과1, TRUNC(4567.678, 0) 결과2, TRUNC(4567.678, 2) 결과3, TRUNC(4567.678, -2) 결과4 FROM dual;

SELECT POWER(2, 10) 결과1, CEIL(4.8) 결과2, FLOOR(4.8) 결과3 FROM dual;

SELECT department_id, salary, MOD(salary, 300) FROM employees WHERE department_id = 20;

SELECT employee_id, salary, SIGN(salary - 2900)
FROM employees
WHERE department_id = 30;

SELECT value FROM nls_session_parameters
WHERE parameter = 'NLS_DATE_FORMAT';

SELECT value FROM nls_session_parameters
WHERE parameter = 'NLS_TIMESTAMP_FORMAT';

SELECT value FROM nls_session_parameters
WHERE parameter = 'NLS_TIMESTAMP_TZ_FORMAT';

SELECT value FROM nls_session_parameters
WHERE parameter = 'NLS_LANGUAGE';

SELECT SYSDATE FROM dual;

SELECT LOCALTIMESTAMP FROM dual;

SELECT SYSTIMESTAMP FROM dual;

SELECT first_name, hire_date, hire_date + 3, hire_date + 5 / 24
FROM employees 
WHERE department_id = 30;

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';

SELECT department_id, hire_date, FLOOR(SYSDATE - hire_date) 결과, 
FLOOR((SYSDATE - hire_date) / 7) 주,
FLOOR(MOD((SYSDATE - hire_date), 7)) 일 
FROM employees WHERE department_id = 30 ORDER BY 3 DESC;

SELECT department_id, hire_date, FLOOR(SYSDATE - hire_date) 결과, 
FLOOR((SYSDATE - hire_date) / 30) 월,
FLOOR(MOD(SYSDATE - hire_date, 30) / 7) 주, 
FLOOR(MOD(MOD(SYSDATE - hire_date, 30), 7)) 일
FROM employees 
WHERE department_id = 30 
ORDER BY 3 DESC;

SELECT department_id, hire_date, FLOOR(SYSDATE - hire_date) 결과, 
FLOOR((SYSDATE - hire_date) / 365) 년,
FLOOR(MOD(SYSDATE - hire_date, 365) / 30) 월,
FLOOR(MOD(MOD(SYSDATE - hire_date, 365), 30)/ 7) 주,
FLOOR(MOD(MOD(MOD(SYSDATE - hire_date, 365), 30), 7)) 일
FROM employees 
WHERE department_id = 30
ORDER BY 3 DESC;