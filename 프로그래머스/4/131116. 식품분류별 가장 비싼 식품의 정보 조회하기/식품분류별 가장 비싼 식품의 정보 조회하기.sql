-- 코드를 입력하세요
SELECT CATEGORY, PRICE, PRODUCT_NAME
FROM (
    SELECT 
        CATEGORY, 
        PRICE, 
        PRODUCT_NAME,
        ROW_NUMBER() OVER (PARTITION BY CATEGORY ORDER BY PRICE DESC) AS RN
    FROM FOOD_PRODUCT
    WHERE CATEGORY IN ('과자', '국', '김치', '식용유')
) AS ranked
WHERE RN = 1
ORDER BY PRICE DESC;
