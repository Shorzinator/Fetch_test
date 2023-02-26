-- Q1
SELECT ri.BRAND_CODE, sum(TOTAL_FINAL_PRICE) as total
FROM receipt_items ri
WHERE (substring(MODIFY_DATE, 5, 4) = '-06-')
  AND (BRAND_CODE IS NOT NULL)
  AND (TOTAL_FINAL_PRICE IS NOT NULL)
GROUP BY ri.BRAND_CODE
ORDER BY total DESC;
-- Due to the ambiguity as to what brand_code does 'NULL' belong to, I have ignored the 'NULL' value and gone with the next brand_code.
-- correct

-- Q2
SELECT u.ID as User_ID
FROM Receipts r
JOIN Users u ON u.ID = r.USER_ID
WHERE (SUBSTRING(r.DATE_SCANNED, 6, 2) = '08')
GROUP BY u.ID
ORDER BY MAX(r.TOTAL_SPENT) DESC
limit 1;
--correct

-- Q3
SELECT r.USER_ID
FROM Receipt_items ri
JOIN Receipts r ON r.ID = ri.REWARDS_RECEIPT_ID
WHERE ri.TOTAL_FINAL_PRICE = (
  SELECT MAX(TOTAL_FINAL_PRICE)
  FROM Receipt_items
)
LIMIT 1;
--correct

-- Q4
select ri.description
from receipt_items ri
group by DESCRIPTION
order by max(TOTAL_FINAL_PRICE) desc
limit 1;
-- correct

-- Q5
select count(distinct(USER_ID)) as user_count, SUBSTRING(DATE_SCANNED, 6, 2) AS month
from receipts
where DATE_SCANNED is not NULL
group by month;
--correct