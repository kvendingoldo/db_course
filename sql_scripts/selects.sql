SELECT *
FROM
  (SELECT
     employers.id,
     login,
     employee_positions.employee,
     position,
     quantifier
   FROM employers
     INNER JOIN employee_positions ON employee_positions.employee = employers.id) AS tmp
  INNER JOIN hotel.employee_profiles ON hotel.employee_profiles.id = tmp.id;


SELECT *
FROM hotel.employee_profiles;


SELECT *
FROM hotel.employee_profiles
  INNER JOIN hotel.employers ON hotel.employee_profiles.id = hotel.employers.id;


SELECT
  title,
  description,
  price
FROM service_types
  INNER JOIN service_price ON service_price.id = service_types.id


SELECT
  room_types.type,
  room,
  floor,
  price
FROM rooms
  INNER JOIN room_types ON rooms.type = room_types.id
WHERE status = FALSE;


SELECT
  login,
  first_name,
  last_name,
  middle_name,
  sex,
  birthday,
  marital_status,
  children
FROM person
  INNER JOIN clients ON clients.id = client_profiles.person;


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