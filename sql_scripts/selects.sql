-- 1
-- Rooms availability
SELECT
  room,
  floor,
  r_types.type,
  price
FROM rooms
  INNER JOIN r_types ON rooms.type = r_types.id
WHERE status = FALSE;

-- 2
-- all information about persons
SELECT
  login,
  first_name,
  last_name,
  middle_name,
  sex,
  birthday,
  marital_status,
  children,
  passport_series,
  passport_id,
  data_on_passport,
  status
FROM c_profiles
  INNER JOIN clients ON clients.id = c_profiles.client
  INNER JOIN person ON person = person.id
  INNER JOIN p_passport ON p_passport.id = person.passport;

-- 3
-- all information about employers
SELECT
  login,
  first_name,
  last_name,
  middle_name,
  sex,
  birthday,
  marital_status,
  children,
  passport_id,
  passport_series,
  data_on_passport,
  schedule_description,
  salary,
  ppc,
  inn
FROM employee_profiles
  INNER JOIN employers ON employee = employers.id
  INNER JOIN person ON person = person.id
  INNER JOIN p_passport ON p_passport.id = person.passport
  INNER JOIN e_schedule ON schedule = e_schedule.id;

-- 4
-- all employers with higher education
SELECT
  first_name,
  middle_name,
  last_name,
  title
FROM employee_profiles
  INNER JOIN person ON employee_profiles.person = person.id
  INNER JOIN b_person_edu ON employee_profiles.id = b_person_edu.person_id
  INNER JOIN p_education ON p_education.id = b_person_edu.edu_id
WHERE type = 'Higher education';

-- 5
-- login and names of employers
SELECT
  first_name,
  middle_name,
  last_name,
  login
FROM employee_profiles
  INNER JOIN person ON employee_profiles.person = person.id
  INNER JOIN employers ON employee_profiles.employee = employers.id;

-- 6
-- information about all services
SELECT
  title,
  description,
  price
FROM service_types
  INNER JOIN service_price ON service_price.id = service_types.id;

-- 7
-- All orders of services
SELECT
  login,
  title AS service_title,
  quantity,
  price,
  date
FROM clients
  INNER JOIN orders ON orders.client = clients.id
  INNER JOIN service_price ON orders.service = service_price.id
  INNER JOIN service_types ON service_types.id = orders.service
ORDER BY date DESC;

-- 8
-- All clients from RUSSIA
SELECT
  tmp.id,
  tmp.first_name,
  tmp.last_name,
  tmp.middle_name,
  p_citizenship.citizenship
FROM (
       SELECT
         person.id,
         first_name,
         last_name,
         middle_name
       FROM person
         INNER JOIN c_profiles ON c_profiles.id = person.id
     ) AS tmp
  INNER JOIN b_person_citizenship ON tmp.id = b_person_citizenship.person_id
  INNER JOIN p_citizenship ON p_citizenship.id = b_person_citizenship.citizenship_id
WHERE p_citizenship.citizenship = 'RUSSIA';

-- 9
-- average salary for posts
SELECT
  title,
  SUM(salary * quantifier) / COUNT(title) AS salary
FROM employee_profiles
  INNER JOIN b_employee_position ON b_employee_position.employee_id = employee_profiles.employee
  INNER JOIN e_position ON e_position.id = b_employee_position.position_id
GROUP BY title;

-- 10
-- clients with a children
SELECT
  first_name,
  middle_name,
  last_name
FROM c_profiles
  INNER JOIN person ON person.id = c_profiles.person
WHERE children = TRUE;

-- 11
-- booked rooms
SELECT
  first_name,
  middle_name,
  last_name,
  room,
  start_date,
  end_data,
  prepaid
FROM r_reservations
  INNER JOIN c_profiles ON c_profiles.id = r_reservations.client
  INNER JOIN person ON person.id = c_profiles.person;

-- 12
-- All clients with 2 citizenship
SELECT
  first_name,
  last_name,
  middle_name
FROM person
  INNER JOIN c_profiles ON c_profiles.id = person.id
  INNER JOIN b_person_citizenship ON person.id = b_person_citizenship.person_id
GROUP BY person.id
HAVING COUNT(*) > 1;

-- 13
-- ЧЕК
SELECT
  r_reservations.client,
  rooms.room       AS room_number,
  r_types.type     AS room_type,
  r_types.season,
  start_date,
  end_date,
  payment_method_types.type,
  invoices.invoice AS total_amount
FROM r_reservations
  INNER JOIN invoices ON invoices.id = r_reservations.invoice
  INNER JOIN c_payment_methods ON c_payment_methods.id = invoices.payment_method
  INNER JOIN payment_method_types ON payment_method_types.id = c_payment_methods.type
  INNER JOIN rooms ON rooms.id = r_reservations.room
  INNER JOIN r_types ON rooms.type = r_types.id;

-- 14
-- select all client who paid by cash
SELECT
  person.first_name,
  person.middle_name,
  person.last_name,
  invoices.invoice
FROM invoices
  INNER JOIN c_payment_methods ON c_payment_methods.id = invoices.payment_method
  INNER JOIN payment_method_types ON payment_method_types.id = c_payment_methods.type
  INNER JOIN person ON person.id = client
WHERE payment_method_types.type = 'CASH';

-- 15
-- select all client who paid by card
SELECT
  person.first_name,
  person.middle_name,
  person.last_name,
  invoices.invoice
FROM invoices
  INNER JOIN c_payment_methods ON c_payment_methods.id = invoices.payment_method
  INNER JOIN payment_method_types ON payment_method_types.id = c_payment_methods.type
  INNER JOIN person ON person.id = client
WHERE payment_method_types.type = 'VISA' OR payment_method_types.type = 'MASTERCARD';