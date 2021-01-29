SELECT 
    s.name,
    SUM(amount) AS balance
FROM Transactions t
Join Users s 
ON t.account = s.account
GROUP BY s.name
HAVING balance > 10000

-- solution 2. 

SELECT U.name,SUM(T.amount) balance
FROM Users U
JOIN Transactions T
-- using to find the same key
USING(account) 
GROUP BY U.name
HAVING SUM(amount) > 10000
