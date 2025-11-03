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
