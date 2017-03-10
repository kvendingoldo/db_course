CREATE VIEW person_age AS
  SELECT
    first_name,
    last_name,
    middle_name,
    age(birthday, CURRENT_DATE) as age
  FROM person;