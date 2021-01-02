select player_id, device_id
from activity
where 
(player_id, event_date) IN
(select 
    player_id, MIN(event_date) as event_date
from 
    activity
GROUP BY player_)id)