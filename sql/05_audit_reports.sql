-- [Report] Changed emails with users and datetime

SELECT
      emp_aud.employee_id,
      old_data->>'email' as "old email",
      new_data->>'email' as "changed email",
      emp_aud.changed_by,
      emp_aud.changed_at
    FROM audit.employees_aud emp_aud
where old_data->>'email' != new_data->>'email'
