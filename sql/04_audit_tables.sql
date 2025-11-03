create schema audit;

create table audit.employees_aud
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
            references employee_statuses,
    action     varchar(10),
    old_data   jsonb,
    new_data   jsonb,
        changed_by varchar,
    changed_at timestamp
);

--  trigger for auditing (audit for employees table[INSERT,UPDATE,DELETE])

CREATE OR REPLACE FUNCTION audit.log_employee_changes()
RETURNS TRIGGER AS
$$
DECLARE
    v_changed_by TEXT;
BEGIN
    -- Get current user or application user if available
    v_changed_by := current_user;

    IF (TG_OP = 'INSERT') THEN
        INSERT INTO audit.employees_aud(
            first_name,
            last_name,
            email,
            mobile_phone,
            position_id,
            department_id,
            status,
            action,
            old_data,
            new_data,
            changed_by,
            changed_at
        )
        VALUES (
            NEW.first_name,
            NEW.last_name,
            NEW.email,
            NEW.mobile_phone,
            NEW.position_id,
            NEW.department_id,
            NEW.status,
            TG_OP,               -- 'INSERT'
            NULL,                -- no old data
            to_jsonb(NEW),       -- new data
            v_changed_by,
            NOW()
        );
        RETURN NEW;

    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO audit.employees_aud(
            first_name,
            last_name,
            email,
            mobile_phone,
            position_id,
            department_id,
            status,
            action,
            old_data,
            new_data,
            changed_by,
            changed_at
        )
        VALUES (
            NEW.first_name,
            NEW.last_name,
            NEW.email,
            NEW.mobile_phone,
            NEW.position_id,
            NEW.department_id,
            NEW.status,
            TG_OP,               -- 'UPDATE'
            to_jsonb(OLD),
            to_jsonb(NEW),
            v_changed_by,
            NOW()
        );
        RETURN NEW;

    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO audit.employees_aud(
            first_name,
            last_name,
            email,
            mobile_phone,
            position_id,
            department_id,
            status,
            action,
            old_data,
            new_data,
            changed_by,
            changed_at
        )
        VALUES (
            OLD.first_name,
            OLD.last_name,
            OLD.email,
            OLD.mobile_phone,
            OLD.position_id,
            OLD.department_id,
            OLD.status,
            TG_OP,               -- 'DELETE'
            to_jsonb(OLD),
            NULL,                -- no new data
            v_changed_by,
            NOW()
        );
        RETURN OLD;
    END IF;

    RETURN NULL;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER trg_employees_audit
AFTER INSERT OR UPDATE OR DELETE
ON public.employees
FOR EACH ROW
EXECUTE FUNCTION audit.log_employee_changes();

