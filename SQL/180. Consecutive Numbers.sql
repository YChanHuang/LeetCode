-- Write an SQL query to find all numbers that appear at least three times consecutively.
--
-- Return the result table in any order.
--
-- 来源：力扣（LeetCode）
-- 链接：https://leetcode-cn.com/problems/consecutive-numbers
-- 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

-- The idea is to combine "DISTINCT" and "WHERE"


-- 1.


SELECT DISTINCT
    l1.Num AS ConsecutiveNums
FROM
    Logs l1,
    Logs l2,
    Logs l3
WHERE
    l1.Id = l2.Id - 1
    AND l2.Id = l3.Id - 1
    AND l1.Num = l2.Num
    AND l2.Num = l3.Num
;

作者：LeetCode
链接：https://leetcode-cn.com/problems/consecutive-numbers/solution/lian-xu-chu-xian-de-shu-zi-by-leetcode/
来源：力扣（LeetCode）
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
