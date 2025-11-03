employees
(
    employee_id   serial
        primary key,
    first_name    varchar(100) not null,
    last_name     varchar(100) not null,
    email         varchar(255) not null
        unique,
    mobile_phone  varchar(20),
    position_id   integer      not null
        constraint fk_employees_position
            references positions,
    department_id integer      not null
        constraint fk_employees_department
            references departments,
    status        integer      not null
        constraint fk_employees_status
            references employee_statuses
);
