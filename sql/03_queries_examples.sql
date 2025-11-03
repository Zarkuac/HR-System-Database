-- Employees full data with positions, locations and statuses

SELECT E.EMPLOYEE_ID AS "Employee ID",
       E.FIRST_NAME  AS "First Name",
       E.LAST_NAME   AS "Last Name",
       E.EMAIL       AS "EMAIL",
       P.TITLE       AS "Position",
       D.LOCATION    AS "Current Location",
       ES.TITLE      AS "Status"
FROM EMPLOYEES E
         LEFT JOIN POSITIONS P ON P.POSITION_ID = E.POSITION_ID
         LEFT JOIN DEPARTMENTS D ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
         LEFT JOIN EMPLOYEE_STATUSES ES ON ES.ID = E.STATUS

-- Employees salaries with "StartDate" filter

SELECT EMP_SAL.EMPLOYEE_ID                       AS "Employee ID",
       E.FIRST_NAME || ' ' || E.LAST_NAME        AS "Employee",
       D.NAME                                    AS "Department",
       EMP_SAL.AMOUNT || '$'                     AS "Salary",
       EMP_SAL.START_DATE                        AS "START DATE",
       CASE
           WHEN E.STATUS = 1 THEN 'Active'
           WHEN E.STATUS = 2 THEN 'On Leave'
           WHEN E.STATUS = 3 THEN 'Terminated'
           WHEN E.STATUS = 4 THEN 'Resigned' END AS "Employee Status"
FROM SALARIES EMP_SAL
         LEFT JOIN EMPLOYEES E ON E.EMPLOYEE_ID = EMP_SAL.EMPLOYEE_ID
         LEFT JOIN DEPARTMENTS D ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
WHERE EMP_SAL.START_DATE BETWEEN :DATE_FROM AND :DATE_TO
