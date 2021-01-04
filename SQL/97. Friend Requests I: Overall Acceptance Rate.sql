SELECT ROUND(
  IFNULL(
  SELECT COUNT(*) from (select DISTINCT requester_id, accpeter_id from RequestAccepted)
  /SELECT COUNT(*) from (select DISTINCT sender_id, sender_to_id from FriendRequest)
  ,0)
    ,2) as accepte_rate
