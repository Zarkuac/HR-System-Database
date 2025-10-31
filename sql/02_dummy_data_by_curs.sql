-- Dummy Data Insert Script for HR System Database
-- Generated based on 01_create_tables.sql

-- Insert Departments (must be first, no dependencies)
INSERT INTO departments (department_id, name, location, is_active) VALUES
(1, 'Human Resources', 'New York Office', TRUE),
(2, 'Information Technology', 'San Francisco Office', TRUE),
(3, 'Finance', 'Chicago Office', TRUE),
(4, 'Marketing', 'Los Angeles Office', TRUE),
(5, 'Sales', 'Boston Office', TRUE),
(6, 'Operations', 'Seattle Office', TRUE);

-- Insert Employee Statuses (must be early, referenced by employees)
INSERT INTO employee_statuses (id, title, active) VALUES
(1, 'Active', TRUE),
(2, 'On Leave', TRUE),
(3, 'Terminated', TRUE),
(4, 'Resigned', TRUE);

-- Insert Leave Types (must be early, referenced by leaves)
INSERT INTO leave_types (id, title, active) VALUES
(1, 'Annual Leave', TRUE),
(2, 'Sick Leave', TRUE),
(3, 'Personal Leave', TRUE),
(4, 'Maternity Leave', TRUE),
(5, 'Paternity Leave', TRUE),
(6, 'Unpaid Leave', TRUE);

-- Insert Positions (depends on departments)
INSERT INTO positions (position_id, department_id, title, level) VALUES
(1, 1, 'HR Manager', 'Senior'),
(2, 1, 'HR Specialist', 'Mid'),
(3, 1, 'Recruiter', 'Junior'),
(4, 2, 'IT Director', 'Senior'),
(5, 2, 'Senior Developer', 'Senior'),
(6, 2, 'Software Engineer', 'Mid'),
(7, 2, 'Junior Developer', 'Junior'),
(8, 3, 'Finance Manager', 'Senior'),
(9, 3, 'Accountant', 'Mid'),
(10, 3, 'Financial Analyst', 'Mid'),
(11, 4, 'Marketing Manager', 'Senior'),
(12, 4, 'Marketing Specialist', 'Mid'),
(13, 5, 'Sales Director', 'Senior'),
(14, 5, 'Sales Representative', 'Mid'),
(15, 6, 'Operations Manager', 'Senior'),
(16, 6, 'Operations Coordinator', 'Mid');

-- Insert Employees (depends on positions, departments, and employee_statuses)
INSERT INTO employees (employee_id, first_name, last_name, email, mobile_phone, position_id, department_id, status) VALUES
(1, 'John', 'Smith', 'john.smith@company.com', '+1-555-0101', 1, 1, 1),
(2, 'Sarah', 'Johnson', 'sarah.johnson@company.com', '+1-555-0102', 2, 1, 1),
(3, 'Michael', 'Williams', 'michael.williams@company.com', '+1-555-0103', 3, 1, 1),
(4, 'Emily', 'Brown', 'emily.brown@company.com', '+1-555-0104', 4, 2, 1),
(5, 'David', 'Jones', 'david.jones@company.com', '+1-555-0105', 5, 2, 1),
(6, 'Jessica', 'Garcia', 'jessica.garcia@company.com', '+1-555-0106', 6, 2, 1),
(7, 'Robert', 'Miller', 'robert.miller@company.com', '+1-555-0107', 7, 2, 1),
(8, 'Amanda', 'Davis', 'amanda.davis@company.com', '+1-555-0108', 8, 3, 1),
(9, 'Christopher', 'Rodriguez', 'christopher.rodriguez@company.com', '+1-555-0109', 9, 3, 1),
(10, 'Michelle', 'Martinez', 'michelle.martinez@company.com', '+1-555-0110', 10, 3, 1),
(11, 'Daniel', 'Hernandez', 'daniel.hernandez@company.com', '+1-555-0111', 11, 4, 1),
(12, 'Lisa', 'Lopez', 'lisa.lopez@company.com', '+1-555-0112', 12, 4, 2),
(13, 'Matthew', 'Wilson', 'matthew.wilson@company.com', '+1-555-0113', 13, 5, 1),
(14, 'Jennifer', 'Anderson', 'jennifer.anderson@company.com', '+1-555-0114', 14, 5, 1),
(15, 'James', 'Thomas', 'james.thomas@company.com', '+1-555-0115', 15, 6, 1),
(16, 'Patricia', 'Taylor', 'patricia.taylor@company.com', '+1-555-0116', 16, 6, 1),
(17, 'Andrew', 'Moore', 'andrew.moore@company.com', '+1-555-0117', 6, 2, 1),
(18, 'Nicole', 'Jackson', 'nicole.jackson@company.com', '+1-555-0118', 9, 3, 3),
(19, 'Kevin', 'White', 'kevin.white@company.com', '+1-555-0119', 14, 5, 4),
(20, 'Rachel', 'Harris', 'rachel.harris@company.com', '+1-555-0120', 12, 4, 1);

-- Insert Salaries (depends on employees)
INSERT INTO salaries (employee_id, amount, start_date, end_date) VALUES
(1, 95000.00, '2023-01-01', NULL),
(2, 65000.00, '2023-01-15', NULL),
(3, 45000.00, '2023-02-01', NULL),
(4, 140000.00, '2022-06-01', NULL),
(5, 110000.00, '2023-03-01', NULL),
(6, 85000.00, '2023-04-01', NULL),
(7, 60000.00, '2023-05-01', NULL),
(8, 120000.00, '2022-08-01', NULL),
(9, 70000.00, '2023-06-01', NULL),
(10, 75000.00, '2023-07-01', NULL),
(11, 130000.00, '2022-09-01', NULL),
(12, 68000.00, '2023-08-01', NULL),
(13, 150000.00, '2022-05-01', NULL),
(14, 70000.00, '2023-09-01', NULL),
(15, 125000.00, '2022-10-01', NULL),
(16, 72000.00, '2023-10-01', NULL),
(17, 88000.00, '2023-11-01', NULL),
(18, 65000.00, '2022-03-01', '2024-01-15'),
(19, 68000.00, '2022-11-01', '2023-12-31'),
(20, 69000.00, '2023-12-01', NULL);

-- Insert Leaves (depends on employees and leave_types)
INSERT INTO leaves (employee_id, leave_type, start_date, end_date) VALUES
(1, 1, '2024-06-15', '2024-06-20'),
(2, 2, '2024-03-10', '2024-03-12'),
(3, 1, '2024-07-01', '2024-07-05'),
(4, 3, '2024-05-20', '2024-05-22'),
(5, 1, '2024-08-10', '2024-08-17'),
(6, 2, '2024-02-14', '2024-02-16'),
(7, 1, '2024-09-01', '2024-09-07'),
(8, 1, '2024-04-15', '2024-04-19'),
(9, 2, '2024-01-20', '2024-01-21'),
(10, 1, '2024-10-05', '2024-10-12'),
(11, 1, '2024-07-20', '2024-07-25'),
(12, 4, '2024-06-01', '2024-08-30'),
(13, 1, '2024-11-15', '2024-11-22'),
(14, 3, '2024-03-25', '2024-03-27'),
(15, 1, '2024-05-10', '2024-05-14'),
(16, 2, '2024-04-05', '2024-04-06'),
(17, 1, '2024-08-25', '2024-09-01'),
(20, 1, '2024-12-20', '2024-12-27');

-- Reset sequences to continue from the highest inserted ID
SELECT setval('departments_department_id_seq', (SELECT MAX(department_id) FROM departments));
SELECT setval('positions_position_id_seq', (SELECT MAX(position_id) FROM positions));
SELECT setval('employee_statuses_id_seq', (SELECT MAX(id) FROM employee_statuses));
SELECT setval('employees_employee_id_seq', (SELECT MAX(employee_id) FROM employees));
SELECT setval('salaries_salary_id_seq', (SELECT MAX(salary_id) FROM salaries));
SELECT setval('leave_types_id_seq', (SELECT MAX(id) FROM leave_types));
SELECT setval('leaves_id_seq', (SELECT MAX(id) FROM leaves));

