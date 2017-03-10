CREATE TABLE citizenship (
  id          INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_citizenship'),
  citizenship VARCHAR(63)
);

CREATE TABLE buff_citiz_person (
  person_id   INTEGER PRIMARY KEY,
  citizenship INTEGER,

  FOREIGN KEY (citizenship) REFERENCES citizenship (id) ON DELETE CASCADE
);

CREATE TABLE passport (
  id               INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_passport'),
  passport_series  VARCHAR(4),
  passport_id      VARCHAR(25)                NOT NULL,
  data_on_passport DATE NOT NULL
);

CREATE TABLE person (
  id             INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_person'),
  first_name     VARCHAR(63)                NOT NULL,
  last_name      VARCHAR(63)                NOT NULL,
  middle_name    VARCHAR(63),
  sex            SEX,
  birthday       DATE                       NOT NULL,
  passport       INTEGER NOT NULL,
  marital_status MARITAL_STATUS,
  children       BOOLEAN DEFAULT FALSE,

  FOREIGN KEY (id) REFERENCES buff_citiz_person (person_id) ON DELETE CASCADE,
  FOREIGN KEY (passport) REFERENCES passport (id) ON DELETE CASCADE
);

CREATE TABLE companies (
  id            INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_companies'),
  legal_name    TEXT                       NOT NULL,
  legal_address TEXT                       NOT NULL,
  ppc           INTEGER                    NOT NULL CONSTRAINT positive_company_ppc CHECK (ppc > 0),
  inn           INTEGER                    NOT NULL CONSTRAINT positive_company_inn CHECK (inn > 0)
);

CREATE TABLE company_phones (
  id      INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_company_phones'),
  company INTEGER,
  phone   VARCHAR(12),

  FOREIGN KEY (company) REFERENCES companies (id) ON DELETE CASCADE
);


CREATE TABLE person_phones (
  id      INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_company_phones'),
  type_id INTEGER,
  phone   VARCHAR(12),

  FOREIGN KEY (id) REFERENCES person (id) ON DELETE CASCADE
);


CREATE TABLE clients (
  id    INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_clients'),
  login VARCHAR(255) UNIQUE
);

CREATE TABLE buff_client_company (
  client_id  INTEGER PRIMARY KEY,
  company_id INTEGER,

  FOREIGN KEY (company_id) REFERENCES companies (id) ON DELETE CASCADE
);

CREATE TABLE client_profiles (
  id     INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_client_profiles'),
  client INTEGER,
  status CLIENT_STATUS,
  person INTEGER,

  FOREIGN KEY (client) REFERENCES buff_client_company (client_id) ON DELETE CASCADE,
  FOREIGN KEY (id) REFERENCES buff_citiz_person (person_id)  ON DELETE CASCADE,
  FOREIGN KEY (person) REFERENCES person (id) ON DELETE CASCADE
);

CREATE TABLE payment_method_types (
  id       INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_payment_method_types'),
  type     VARCHAR(255) UNIQUE        NOT NULL,
  provider VARCHAR(255)
);

CREATE TABLE payment_status (
  id     INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_payment_status'),
  status VARCHAR(255) UNIQUE
);

CREATE TABLE client_payment_methods (
  id      INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_client_payment_methods'),
  client  INTEGER,
  type    INTEGER,
  account VARCHAR(255),

  FOREIGN KEY (client) REFERENCES clients (id) ON DELETE CASCADE,
  FOREIGN KEY (type) REFERENCES payment_method_types (id) ON DELETE CASCADE
);

CREATE TABLE employers (
  id    INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_employers'),
  login VARCHAR(255)
);

CREATE TABLE education (
  id    INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_education'),
  title TEXT UNIQUE
);

CREATE TABLE employers_schedule (
  id          INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_employers_schedule'),
  description TEXT
);

CREATE TABLE buff_empl_edu (
  employee_id  INTEGER PRIMARY KEY,
  education_id INTEGER,

  FOREIGN KEY (education_id) REFERENCES education (id) ON DELETE CASCADE
);

CREATE TABLE employee_profiles (
  id         INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_employee_profiles'),
  person     INTEGER,
  employee   INTEGER,
  ppc        INTEGER                    NOT NULL CONSTRAINT positive_client_ppc CHECK (ppc > 0),
  inn        INTEGER                    NOT NULL CONSTRAINT positive_client_inn CHECK (inn > 0),
  experience SMALLINT DEFAULT 0,
  salary     REAL CONSTRAINT positive_salary CHECK (salary > 0),
  schedule   INTEGER,

  FOREIGN KEY (schedule) REFERENCES employers_schedule (id) ON DELETE CASCADE,
  FOREIGN KEY (employee) REFERENCES employers (id) ON DELETE CASCADE,
  FOREIGN KEY (person) REFERENCES person (id) ON DELETE CASCADE,
  FOREIGN KEY (id) REFERENCES buff_empl_edu (employee_id) ON DELETE CASCADE
);

CREATE TABLE positions (
  id    INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_positions'),
  title VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE employee_positions (
  id         INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_employee_positions'),
  employee   INTEGER,
  position   INTEGER,
  quantifier REAL,

  FOREIGN KEY (employee) REFERENCES employers (id) ON DELETE CASCADE,
  FOREIGN KEY (position) REFERENCES positions (id) ON DELETE CASCADE
);

CREATE TABLE service_types (
  id          INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_service_types'),
  title       VARCHAR(255) UNIQUE NOT NULL,
  description TEXT
);

CREATE TABLE service_price (
  id      INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_service_price'),
  service INTEGER UNIQUE NOT NULL,
  price   REAL NOT NULL DEFAULT 0,

  FOREIGN KEY (service) REFERENCES service_types (id) ON DELETE CASCADE
);

CREATE TABLE invoices (
  id             INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_invoices'),
  payment_method INTEGER NOT NULL,
  invoice        REAL,
  status         INTEGER,

  FOREIGN KEY (payment_method) REFERENCES client_payment_methods (id) ON DELETE CASCADE,
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

CREATE TABLE room_types (
  id    INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_room_types'),
  type  VARCHAR(255) UNIQUE,
  price MONEY
);

CREATE TABLE rooms (
  id     INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_rooms'),
  room   VARCHAR(255) UNIQUE,
  floor  SMALLINT,
  type   INTEGER,
  status BOOLEAN NOT NULL DEFAULT TRUE,

  FOREIGN KEY (type) REFERENCES room_types (id) ON DELETE CASCADE
);

CREATE TABLE room_reservations (
  id         INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_room_reservations'),
  client     INTEGER,
  employee   INTEGER,
  room       INTEGER,
  start_date DATE,
  end_data   DATE CHECK (end_data > room_reservations.start_date),
  prepaid    BOOLEAN NOT NULL DEFAULT false,
  invoice    INTEGER UNIQUE,

  FOREIGN KEY (client) REFERENCES clients (id) ON DELETE CASCADE,
  FOREIGN KEY (employee) REFERENCES employers (id) ON DELETE CASCADE,
  FOREIGN KEY (room) REFERENCES rooms (id) ON DELETE CASCADE,
  FOREIGN KEY (invoice) REFERENCES invoices (id) ON DELETE CASCADE
);