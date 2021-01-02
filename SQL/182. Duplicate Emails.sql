select
  email
from
  person
group by
  email
HAVING
  count(email) > 1 -- choose the email counts more that 1