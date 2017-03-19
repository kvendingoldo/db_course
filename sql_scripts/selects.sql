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



SELECT title, description, price FROM service_types
INNER JOIN service_price ON service_price.id=service_types.id



SELECT room_types.type, room, floor, price FROM rooms
INNER JOIN room_types ON rooms.type = room_types.id
WHERE status = FALSE