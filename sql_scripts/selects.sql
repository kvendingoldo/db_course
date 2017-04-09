-- 1
-- Rooms availability
SELECT
  room,
  floor,
  room_types.type,
  price
FROM rooms
  INNER JOIN room_types ON rooms.type = room_types.id
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
  status,
  company
FROM client_profiles
  INNER JOIN clients ON clients.id = client_profiles.client
  INNER JOIN person ON person = person.id
  INNER JOIN passport ON passport.id = person.passport;

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
  description,
  salary,
  ppc,
  inn
FROM employee_profiles
  INNER JOIN employers ON employee = employers.id
  INNER JOIN person ON person = person.id
  INNER JOIN passport ON passport.id = person.passport
  INNER JOIN employers_schedule ON schedule = employers_schedule.id;

-- 4
-- all employers from MSU
SELECT
  first_name,
  middle_name,
  last_name,
  title AS university
FROM employee_profiles
  INNER JOIN buff_empl_edu ON employee_profiles.id = buff_empl_edu.employee_id
  INNER JOIN education ON buff_empl_edu.education_id = education.id
  INNER JOIN person ON employee_profiles.person = person.id
WHERE title = 'MSU';

-- 5
-- information about all services
SELECT
  title,
  description,
  price
FROM service_types
  INNER JOIN service_price ON service_price.id = service_types.id;

-- 6
-- All orders
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

-- 7
-- All clients from RUSSIA
SELECT
  tmp.first_name,
  tmp.last_name,
  tmp.middle_name,
  citizenship.citizenship
FROM (
       SELECT
         person.id,
         first_name,
         last_name,
         middle_name
       FROM person
         INNER JOIN client_profiles ON client_profiles.id = person.id
     ) AS tmp
  INNER JOIN citizenship_buff ON tmp.id = citizenship_buff.id
  INNER JOIN citizenship ON citizenship.id = citizenship_buff.citizenship
WHERE citizenship.citizenship = 'RUSSIA';

-- 8
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
GROUP BY login;