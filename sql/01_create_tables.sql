CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    location VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE positions (
    position_id SERIAL PRIMARY KEY,
    department_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    level VARCHAR(50),
    CONSTRAINT fk_positions_department FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);

CREATE TABLE employee_statuses (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    active BOOLEAN DEFAULT TRUE
);

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    mobile_phone VARCHAR(20),
    position_id INT NOT NULL,
    department_id INT NOT NULL,
    status INT NOT NULL,
    CONSTRAINT fk_employees_position FOREIGN KEY (position_id)
        REFERENCES positions(position_id),
    CONSTRAINT fk_employees_department FOREIGN KEY (department_id)
        REFERENCES departments(department_id),
    CONSTRAINT fk_employees_status FOREIGN KEY (status)
        REFERENCES employee_statuses(id)
);

CREATE TABLE salaries (
    salary_id SERIAL PRIMARY KEY,
    employee_id INT NOT NULL,
    amount NUMERIC(12,2) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    CONSTRAINT fk_salaries_employee FOREIGN KEY (employee_id)
        REFERENCES employees(employee_id)
);

CREATE TABLE leave_types (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    active BOOLEAN DEFAULT TRUE
);

CREATE TABLE leaves (
    id SERIAL PRIMARY KEY,
    employee_id INT NOT NULL,
    leave_type INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    CONSTRAINT fk_leaves_employee FOREIGN KEY (employee_id)
        REFERENCES employees(employee_id),
    CONSTRAINT fk_leaves_type FOREIGN KEY (leave_type)
        REFERENCES leave_types(id)
);