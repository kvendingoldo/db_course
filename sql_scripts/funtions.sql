CREATE OR REPLACE FUNCTION drop_hotel_schema()
  RETURNS VOID AS $$
BEGIN
  DROP SCHEMA hotel CASCADE;
END;
$$ LANGUAGE SQL;


CREATE OR REPLACE FUNCTION delete_all_tables_from_hotel_schema()
  RETURNS VOID AS $$
DECLARE
  tables_names VARCHAR(255) [];
BEGIN
  SELECT INTO tables_names
  FROM (
         SELECT table_name
         FROM information_schema.tables
         WHERE table_schema = 'hotel'
       ) AS tables_names;

  TRUNCATE tables_names CASCADE;
END;
$$ LANGUAGE plpgsql;
