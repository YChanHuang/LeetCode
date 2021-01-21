-- solution 1 
UPDATE
  salary
SET
  sex = CASE
    sex
    WHEN 'm' THEN 'f'
    ELSE 'm'
  END;

-- solution 2 
update
  salary
set
  sex = char(ascii('m') + ascii('f') - ascii(sex));