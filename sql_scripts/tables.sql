CREATE TABLE citizenship (
  id          INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_citizenship'),
  citizenship VARCHAR(63)
);

CREATE TABLE person (
  first_name       VARCHAR(255) NOT NULL,
  last_name        VARCHAR(255) NOT NULL,
  middle_name      VARCHAR(255),
  sex              SEX,
  age              INTEGER      NOT NULL CONSTRAINT positive_person_age CHECK (age > 0),
  birthday         DATE         NOT NULL,
  citizenship      INTEGER,
  passport_series  VARCHAR(4),
  passport_id      VARCHAR(25)  NOT NULL,
  data_on_passport DATE
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

CREATE TABLE clients (
  id    INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_clients'),
  login VARCHAR(255) UNIQUE
);

CREATE TABLE client_profiles (
  id      INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_client_profiles'),
  client  INTEGER,
  status  CLIENT_STATUS,
  company INTEGER                    NOT NULL,

  FOREIGN KEY (client) REFERENCES clients (id) ON DELETE CASCADE,
  FOREIGN KEY (company) REFERENCES companies (id) ON DELETE CASCADE,
  FOREIGN KEY (citizenship) REFERENCES citizenship (id) ON DELETE CASCADE

)
  INHERITS (person);

CREATE TABLE client_phones (
  id     INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_client_phones'),
  client INTEGER,
  phone  VARCHAR(12),

  FOREIGN KEY (client) REFERENCES clients (id) ON DELETE CASCADE
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

CREATE TABLE employee_profiles (
  id         INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_employee_profiles'),
  employee   INTEGER,
  ppc        INTEGER                    NOT NULL CONSTRAINT positive_client_ppc CHECK (ppc > 0),
  inn        INTEGER                    NOT NULL CONSTRAINT positive_client_inn CHECK (inn > 0),
  education  INTEGER,
  experience INT,
  salary     REAL CONSTRAINT positive_salary CHECK (salary > 0),
  schedule   INTEGER,

  FOREIGN KEY (schedule) REFERENCES employers_schedule (id) ON DELETE CASCADE,
  FOREIGN KEY (employee) REFERENCES employers (id) ON DELETE CASCADE,
  FOREIGN KEY (education) REFERENCES education (id) ON DELETE CASCADE,
  FOREIGN KEY (citizenship) REFERENCES citizenship (id) ON DELETE CASCADE

)
  INHERITS (person);

CREATE TABLE positions (
  id    INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_positions'),
  title VARCHAR(255) UNIQUE
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
  title       VARCHAR(255) UNIQUE,
  description TEXT
);

CREATE TABLE service_price (
  id      INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_service_price'),
  service INTEGER UNIQUE,
  price   REAL,

  FOREIGN KEY (service) REFERENCES service_types (id) ON DELETE CASCADE
);

CREATE TABLE invoices (
  id             INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_invoices'),
  payment_method INTEGER,
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
  status BOOLEAN,

  FOREIGN KEY (type) REFERENCES room_types (id) ON DELETE CASCADE
);

CREATE TABLE room_reservations (
  id         INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_room_reservations'),
  client     INTEGER,
  employee   INTEGER,
  room       INTEGER,
  start_date DATE,
  end_data   DATE CHECK (end_data > room_reservations.start_date),
  prepaid    BOOLEAN,
  invoice    INTEGER UNIQUE,

  FOREIGN KEY (client) REFERENCES clients (id) ON DELETE CASCADE,
  FOREIGN KEY (employee) REFERENCES employers (id) ON DELETE CASCADE,
  FOREIGN KEY (room) REFERENCES rooms (id) ON DELETE CASCADE,
  FOREIGN KEY (invoice) REFERENCES invoices (id) ON DELETE CASCADE
);

CREATE TABLE room_orders (
  id          INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_room_orders'),
  reservation INTEGER UNIQUE,
  employee    INTEGER,
  invoice     INTEGER UNIQUE,

  FOREIGN KEY (reservation) REFERENCES room_reservations (id) ON DELETE CASCADE,
  FOREIGN KEY (employee) REFERENCES employers (id) ON DELETE CASCADE,
  FOREIGN KEY (invoice) REFERENCES invoices (id) ON DELETE CASCADE
);