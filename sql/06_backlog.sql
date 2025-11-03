create table users
(
    id          bigint  not null
        primary key,
    first_name  varchar(256),
    last_name   varchar(256),
    ip_from     varchar(256) default '0.0.0.0'::character varying,
    phone       varchar(128),
    email       varchar(128),
    username    varchar(256),
    password    varchar(256),
    active      boolean not null,
    ip_to       varchar(15)  default '255.255.255.255'::character varying,
    create_date timestamp with time zone,
    birth_date  date,
    personal_no varchar(20)
);
