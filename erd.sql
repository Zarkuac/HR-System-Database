CREATE TABLE "departments" (
  "department_id" integer,
  "name" varchar,
  "location" varchar
);

CREATE TABLE "positions" (
  "position_id" integer,
  "department_id" integer,
  "title" varchar,
  "level" varchar
);

CREATE TABLE "employees" (
  "employee_id" integer,
  "first_name" varchar,
  "last_name" varchar,
  "email" varchar UNIQUE,
  "mobile_phone" varchar,
  "position_id" integer,
  "department_id" integer,
  "status" int
);

CREATE TABLE "employee_statuses" (
  "id" integer,
  "title" varchar,
  "active" boolean
);

CREATE TABLE "salaries" (
  "salary_id" integer,
  "employee_id" integer,
  "amount" numeric,
  "start_date" date,
  "end_date" date
);

CREATE TABLE "leaves" (
  "id" integer,
  "employee_id" integer,
  "leave_type" int,
  "start_date" date,
  "end_date" date
);

CREATE TABLE "leave_types" (
  "id" integer,
  "title" varchar,
  "active" boolean
);

ALTER TABLE "positions" ADD FOREIGN KEY ("department_id") REFERENCES "departments" ("department_id");

ALTER TABLE "employees" ADD FOREIGN KEY ("position_id") REFERENCES "positions" ("position_id");

ALTER TABLE "employees" ADD FOREIGN KEY ("department_id") REFERENCES "positions" ("department_id");

ALTER TABLE "employees" ADD FOREIGN KEY ("employee_id") REFERENCES "salaries" ("employee_id");

ALTER TABLE "leaves" ADD FOREIGN KEY ("employee_id") REFERENCES "employees" ("employee_id");

ALTER TABLE "employee_statuses" ADD FOREIGN KEY ("id") REFERENCES "employees" ("status");

ALTER TABLE "leave_types" ADD FOREIGN KEY ("id") REFERENCES "leaves" ("leave_type");
