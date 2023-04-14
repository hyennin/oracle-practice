SELECT employee_id, first_name, TO_CHAR(hire_date, 'YY/MM/DD(DAY) HH24:MI:SS') "입사일" from employees WHERE job_id = 'PU_CLERK';

SELECT SYSDATE, TO_CHAR(SYSDATE, 'YY/MM/DD(DAY) HH:MI:SS') FROM dual;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YY/MM/DD(DAY) HH24:MI:SS') FROM dual;

SELECT TO_CHAR(ADD_MONTHS(TO_DATE('200306', 'YYYYMM'), 15), 'YYYY') FROM dual;

SELECT TO_CHAR(TO_DATE('98', 'RR'), 'YYYY') test1,
    TO_CHAR(TO_DATE('03', 'RR'), 'YYYY') test2,
    TO_CHAR(TO_DATE('98', 'YY'), 'YYYY') test3,
    TO_CHAR(TO_DATE('03', 'YY'), 'YYYY') test4
FROM dual;

SELECT first_name, hire_date, TO_CHAR(NEXT_DAY(ADD_MONTHS(hire_date, 6), 1), 'YYYY/MM/DD') NEXT_SUNDAY FROM employees WHERE manager_id = 100;
SELECT first_name, hire_date, TO_DATE(NEXT_DAY(ADD_MONTHS(hire_date, 6), 1)) NEXT_SUNDAY FROM employees WHERE manager_id = 100;

SELECT '0001230' 결과1, TO_NUMBER('0001230') 결과2 FROM dual;

SELECT TO_TIMESTAMP('2003-6-25 12:32:00', 'YYYY-MM-DD HH:MI:SS') 결과 FROM dual;

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
ALTER SESSION SET NLS_TIMESTAMP_FORMAT = 'YYYY/MM/DD/ HH24:MI:SS.FF';

SELECT TO_TIMESTAMP('10-09-77 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF') 결과 FROM dual;

SELECT SYSDATE + TO_DSINTERVAL('3 11:47:23') FROM dual;

SELECT first_name, hire_date, hire_date + TO_YMINTERVAL('1-6') "결과 DATE" FROM employees;

SELECT department_id, first_name, salary, commission_pct, salary * (1 + commission_pct) "금월급여" 
FROM employees 
WHERE department_id IN(30, 80);

SELECT department_id, first_name, salary, commission_pct, salary * (1 + NVL(commission_pct, 0)) "금월급여" 
FROM employees 
WHERE department_id IN(30, 80);