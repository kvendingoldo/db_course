-- stuff tables

CREATE TABLE phone_type (
  id   INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_phone_type'),
  type VARCHAR(63) UNIQUE         NOT NULL
);


-- person tables

CREATE TABLE p_passport (
  id               INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_p_passport'),
  passport_series  VARCHAR(10),
  passport_id      VARCHAR(25)                NOT NULL,
  data_on_passport DATE                       NOT NULL
);

CREATE TABLE person (
  id             INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_person'),
  first_name     VARCHAR(63)                NOT NULL,
  last_name      VARCHAR(63)                NOT NULL,
  middle_name    VARCHAR(63),
  sex            SEX                        NOT NULL,
  birthday       DATE                       NOT NULL,
  passport       INTEGER                    NOT NULL,
  marital_status MARITAL_STATUS,
  children       BOOLEAN                             DEFAULT FALSE,

  FOREIGN KEY (passport) REFERENCES p_passport (id) ON DELETE CASCADE
);

CREATE TABLE p_phones (
  id     INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_p_phones'),
  client INTEGER,
  type   INTEGER,
  phone  VARCHAR(12),

  FOREIGN KEY (client) REFERENCES person (id) ON DELETE CASCADE,
  FOREIGN KEY (type) REFERENCES phone_type (id) ON DELETE CASCADE
);


-- edu tables

CREATE TABLE p_education (
  id    INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_p_education'),
  title TEXT UNIQUE
);

CREATE TABLE b_person_edu (
  person_id INTEGER REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE,
  edu_id    INTEGER REFERENCES p_education (id) ON UPDATE CASCADE ON DELETE CASCADE
);


-- citizenship tables

CREATE TABLE p_citizenship (
  id          INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_p_citizenship'),
  citizenship VARCHAR(63) UNIQUE         NOT NULL
);

CREATE TABLE b_person_citizenship (
  person_id      INTEGER REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE,
  citizenship_id INTEGER REFERENCES p_citizenship (id) ON UPDATE CASCADE ON DELETE CASCADE
);


-- companies tables

CREATE TABLE companies (
  id            INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_companies'),
  legal_name    TEXT                       NOT NULL,
  legal_address TEXT                       NOT NULL,
  ppc           INTEGER                    NOT NULL CONSTRAINT positive_company_ppc CHECK (ppc > 0),
  inn           INTEGER                    NOT NULL CONSTRAINT positive_company_inn CHECK (inn > 0)
);

CREATE TABLE co_phones (
  id      INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_co_phones'),
  company INTEGER                    NOT NULL,
  type    INTEGER,
  phone   VARCHAR(12),

  FOREIGN KEY (company) REFERENCES companies (id) ON DELETE CASCADE,
  FOREIGN KEY (type) REFERENCES phone_type (id) ON DELETE CASCADE
);


-- client tables

CREATE TABLE clients (
  id    INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_clients'),
  login VARCHAR(255) UNIQUE        NOT NULL
);

CREATE TABLE b_client_company (
  client_id INTEGER REFERENCES clients (id) ON UPDATE CASCADE ON DELETE CASCADE,
  company_id INTEGER REFERENCES companies (id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE c_profiles (
  id      INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_c_profiles'),
  client  INTEGER,
  status  CLIENT_STATUS                       DEFAULT 'standart',
  person  INTEGER,

  FOREIGN KEY (client) REFERENCES clients (id) ON DELETE CASCADE,
  FOREIGN KEY (person) REFERENCES person (id) ON DELETE CASCADE
);

-- employers tables

CREATE TABLE employers (
  id    INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_employers'),
  login VARCHAR(255) UNIQUE        NOT NULL
);

CREATE TABLE e_schedule (
  id                   INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_e_schedule'),
  schedule_description TEXT
);

CREATE TABLE employee_profiles (
  id         INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_employee_profiles'),
  person     INTEGER,
  employee   INTEGER,
  ppc        INTEGER                    NOT NULL CONSTRAINT positive_client_ppc CHECK (ppc > 0),
  inn        INTEGER                    NOT NULL CONSTRAINT positive_client_inn CHECK (inn > 0),
  experience SMALLINT                            DEFAULT 0,
  salary     REAL                                DEFAULT 0 CONSTRAINT positive_salary CHECK (salary >= 0),
  schedule   INTEGER,

  FOREIGN KEY (schedule) REFERENCES e_schedule (id) ON DELETE CASCADE,
  FOREIGN KEY (employee) REFERENCES employers (id) ON DELETE CASCADE,
  FOREIGN KEY (person) REFERENCES person (id) ON DELETE CASCADE
);

CREATE TABLE e_position (
  id    INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_e_positions'),
  title VARCHAR(255) UNIQUE        NOT NULL
);

CREATE TABLE b_employee_position (
  employee_id INTEGER REFERENCES employers (id) ON UPDATE CASCADE ON DELETE CASCADE,
  position_id INTEGER REFERENCES e_position (id) ON UPDATE CASCADE ON DELETE CASCADE,
  quantifier REAL
);


-- service tables

CREATE TABLE service_types (
  id          INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_service_types'),
  title       VARCHAR(255) UNIQUE        NOT NULL,
  description TEXT
);

CREATE TABLE service_price (
  id      INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_service_price'),
  service INTEGER UNIQUE             NOT NULL,
  price   REAL                       NOT NULL DEFAULT 0.0,

  FOREIGN KEY (service) REFERENCES service_types (id) ON DELETE CASCADE
);


-- payment tables

CREATE TABLE payment_method_types (
  id       INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_payment_method_types'),
  type     VARCHAR(255) UNIQUE        NOT NULL,
  provider VARCHAR(255)
);

CREATE TABLE payment_status (
  id     INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_payment_status'),
  status VARCHAR(255) UNIQUE
);

CREATE TABLE c_payment_methods (
  id      INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_c_payment_methods'),
  client  INTEGER,
  type    INTEGER,
  account VARCHAR(255),

  FOREIGN KEY (client) REFERENCES clients (id) ON DELETE CASCADE,
  FOREIGN KEY (type) REFERENCES payment_method_types (id) ON DELETE CASCADE
);

CREATE TABLE invoices (
  id             INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_invoices'),
  payment_method INTEGER                    NOT NULL,
  invoice        REAL,
  status         INTEGER,

  FOREIGN KEY (payment_method) REFERENCES c_payment_methods (id) ON DELETE CASCADE,
  FOREIGN KEY (status) REFERENCES payment_status (id) ON DELETE CASCADE
);

CREATE TABLE orders (
  id       INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_orders'),
  service  INTEGER,
  client   INTEGER,
  employee INTEGER,
  invoice  INTEGER,
  quantity REAL,
  date     DATE                                DEFAULT CURRENT_DATE,

  FOREIGN KEY (service) REFERENCES service_types (id) ON DELETE CASCADE,
  FOREIGN KEY (client) REFERENCES clients (id) ON DELETE CASCADE,
  FOREIGN KEY (employee) REFERENCES employers (id) ON DELETE CASCADE,
  FOREIGN KEY (invoice) REFERENCES invoices (id) ON DELETE CASCADE
);


-- room tables

CREATE TABLE r_types (
  id     INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_r_types'),
  type   VARCHAR(255) UNIQUE,
  season SEASON,
  price  MONEY
);

CREATE TABLE rooms (
  id     INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_rooms'),
  room   VARCHAR(255) UNIQUE,
  floor  SMALLINT,
  type   INTEGER,
  status BOOLEAN                    NOT NULL DEFAULT TRUE,

  FOREIGN KEY (type) REFERENCES r_types (id) ON DELETE CASCADE
);

CREATE TABLE r_reservations (
  id         INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_r_reservations'),
  client     INTEGER,
  employee   INTEGER,
  room       INTEGER,
  start_date DATE,
  end_data   DATE CHECK (end_data > r_reservations.start_date),
  prepaid    BOOLEAN                    NOT NULL DEFAULT FALSE,
  invoice    INTEGER UNIQUE,

  FOREIGN KEY (client) REFERENCES clients (id) ON DELETE CASCADE,
  FOREIGN KEY (employee) REFERENCES employers (id) ON DELETE CASCADE,
  FOREIGN KEY (room) REFERENCES rooms (id) ON DELETE CASCADE,
  FOREIGN KEY (invoice) REFERENCES invoices (id) ON DELETE CASCADE
);