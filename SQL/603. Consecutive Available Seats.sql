/*
Several friends at a cinema ticket office would like to reserve consecutive available seats.
Can you help to query all the consecutive available seats order by the seat_id using the following cinema table?

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/consecutive-available-seats
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


select distinct c2.seat_id -- remove repeated seat_id such as 4 would appear two times in (3,4) and (4,5)
FROM cinema c1 join cinema c2
on abs(c1.seat_id - c2.seat_id ) = 1 -- To find the next seat
where c1.free = 1 and c2.free = 1  -- To examine if the seat is available
