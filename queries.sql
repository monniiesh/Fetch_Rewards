-- Which brand saw the most dollars spent in the month of June?

SELECT brands.NAME, SUM(receipt_items.TOTAL_FINAL_PRICE) AS TOTAL, MONTH(receipts.PURCHASE_DATE) AS MONTHS
FROM receipts
JOIN reciept_items ON receipts.ID = receipts_items.REWARDS_RECEIPT_ID
JOIN brands ON brands.BARCODE = receipts_items.BARCODE
WHERE MONTHS = 6
GROUP BY brands.NAME, MONTHS
ORDER BY TOTAL DESC
LIMIT 1;


-- Which user spent the most money in the month of August?

SELECT users.ID, SUM(receipt_items.TOTAL_FINAL_PRICE) AS TOTAL, MONTH(receipts.PURCHASE_DATE) AS MONTHS
FROM receipts
JOIN reciept_items ON receipts.ID = receipts_items.REWARDS_RECEIPT_ID
JOIN users ON users.ID = receipts.USER_ID
WHERE MONTHS = 8
GROUP BY users.ID, MONTHS
ORDER BY TOTAL DESC
LIMIT 1;


-- What user bought the most expensive item?

WITH max_price_receipt_items AS (
    SELECT MAX(TOTAL_FINAL_PRICE) AS MAX_PRICE FROM receipt_items)
SELECT receipts.USER_ID
FROM receipts, max_price_receipt_items
JOIN reciept_items ON receipts.ID = receipts_items.REWARDS_RECEIPT_ID
JOIN users ON users.ID = receipts.USER_ID
WHERE receipts_items.REWARDS_RECEIPT_ID = max_price_receipt_items.MAX_PRICE
LIMIT 1;


-- What is the name of the most expensive item purchased?

SELECT DESCRIPTION, TOTAL_FINAL_PRICE
FROM receipt_items
WHERE QUANTITY_PURCHASED IS NOT NULL OR QUANTITY_PURCHASED != 0
ORDER BY TOTAL_FINAL_PRICE DESC
LIMIT 1;


-- How many users scanned in each month?

SELECT COUNT(DISTINCT USER_ID) AS USERS, MONTH(DATE_SCANNED) AS MONTHS
FROM receipts
GROUP BY MONTHS
ORDER BY MONTHS;