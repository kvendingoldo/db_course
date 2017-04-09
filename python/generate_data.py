import random

def write_sql_ex_to_file(comment, sql_expr):
    with open(out_file, 'a') as out:
        out.write(comment)
            out.write(sql_expr + '\n')
    out.close()

def generate_citizenship(out_file):
    CITIZENSHIPS = ["USA", "Russia", "UK", "Germany", "Turkey"]

    with open(out_file, 'a') as out:
        out.write("-- CITIZENSHIP DATA\n")
        for citizenship in CITIZENSHIPS:
            sql_expr = "INSERT INTO citizenship (citizenship) " \
                       "VALUES (%r);" % (citizenship)
            out.write(sql_expr + '\n')
    out.close()


def generate_buff_citiz_person():
    pass


CREATE TABLE person (
  id             INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT nextval('auto_id_person'),
  first_name     VARCHAR(63)                NOT NULL,
  last_name      VARCHAR(63)                NOT NULL,
  middle_name    VARCHAR(63),

  sex            SEX NOT NULL ,

  birthday       DATE                       NOT NULL,

  passport       INTEGER NOT NULL,

  marital_status MARITAL_STATUS,

  children       BOOLEAN DEFAULT FALSE,

  FOREIGN KEY (id) REFERENCES buff_citiz_person (person_id) ON DELETE CASCADE,
  FOREIGN KEY (passport) REFERENCES passport (id) ON DELETE CASCADE
);


def generate_person():
    first_name = input('Input first name: ')
    middle_name = input('Input middle name: ')
    last_name = input('Input last name: ')
    sex = input('Input sex name: ')
    birthday = input('Input birthday name: ')
    marital_status = input('Input marital status name: ')
    children = input('Input children name: ')


def generate_passport():
    pass


def generate_phones():
    pass


def generate_companies():
    pass


def generate_company_phones():
    pass


def generate_clients():
    pass


def generate_person_phones():
    pass


def generate_buff_client_company():
    pass


def generate_client_profiles(out_file):

    CLIENT_LOGINS=["vasya!", "sasha.vechernih", "supergirl1994"]

    with open(out_file, 'a') as out:
        out.write("-- CLIENT PROFILES DATA\n")
        for login in CLIENT_LOGINS:
            sql_expr = "INSERT INTO client_profiles (login) " \
                       "VALUES (%r);" % (login)
            out.write(sql_expr + '\n')
    out.close()



def generate_payment_method_types():
    pass


def generate_payment_status(out_file):
    pass


def generate_client_payment_methods():
    pass


def generate_employers():
    pass


def generate_education(out_file):

    education = ["SSU", "SSTU", "MPIT", "HSE"]

    with open(out_file, 'a') as out:

        out.write("-- EDUCATION DATA\n")

        for index in range(10):
            sql_expr="INSERT INTO education (id, title) " \
                     "VALUES (%d, %r);" % (index, education[int((index+random.randint(1, 100)) % 4)])
            out.write(sql_expr + '\n')
    out.close()

def generate_employers_schedule():
    pass


def generate_buff_empl_edu():
    pass

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


def generate_employee_profiles():

    person = 
    
    input('Input your name: ')


def generate_positions():
    pass


def generate_employee_positions():
    pass


def generate_service_types():

    CLIENT_LOGINS=["", "sasha.vechernih", "supergirl1994"]

    with open(out_file, 'a') as out:
        out.write("-- CLIENT PROFILES DATA\n")
        for login in CLIENT_LOGINS:
            sql_expr = "INSERT INTO client_profiles (login) " \
                       "VALUES (%r);" % (login)
            out.write(sql_expr + '\n')
    out.close()

    ID TITLE DESCR


def generate_service_price(service):
    price = # gen
    sql_expr = "INSERT INTO service_price (service, price) " \
                       "VALUES (%d, %d);" % (service, price)
    write_sql_ex_to_file("-- SERVICE PRICE DATA\n", sql_expr)

def generate_invoices():
    pass


def generate_orders():
    pass


def generate_room_types():
    pass


def generate_room():
    pass


def generate_room_reservations():
    pass


generate_education("out")
generate_client_profiles("out")
generate_citizenship("out")
