--   FLIPKART PRODUCT PRICE ANALYSIS —


--Q1: VERIFY DATA LOADED CORRECTLY--

SELECT COUNT(*) AS total_products
FROM flipkart_products;



-- Q2: All 4 KPIs in one query --
SELECT
    COUNT(*) AS total_products,
    ROUND(AVG(discount_pct)::numeric, 2) AS avg_discount_pct,
    ROUND(AVG(retail_price)::numeric, 2) AS avg_retail_price,
    ROUND(SUM(savings_amount)::numeric, 2) AS total_customer_savings
FROM flipkart_products;

-- Q3: Avg discount % per L1 category (top 10)
SELECT
    "L1_category",
    COUNT(*) AS product_count,
    ROUND(AVG(retail_price)::numeric, 2) AS avg_retail_price,
    ROUND(AVG(discounted_price)::numeric, 2) AS avg_discounted_price,
    ROUND(AVG(discount_pct)::numeric, 2) AS avg_discount_pct,
    ROUND(SUM(savings_amount)::numeric, 2) AS total_savings
FROM flipkart_products
GROUP BY "L1_category"
ORDER BY avg_discount_pct DESC
LIMIT 10;



-- Q4: Product count and avg discount by price tier
SELECT
    price_tier,
    COUNT(*) AS product_count,
    ROUND(AVG(discount_pct)::numeric, 2) AS avg_discount_pct,
    ROUND(AVG(retail_price)::numeric, 2) AS avg_retail_price,
    ROUND(SUM(savings_amount)::numeric, 2) AS total_savings
FROM flipkart_products
GROUP BY price_tier
ORDER BY avg_retail_price ASC;


-- Q5: FK Advantage vs Standard product comparison
SELECT
    CASE
        WHEN is_fk_advantage = TRUE THEN 'FK Advantage'
        ELSE 'Standard'
    END AS product_type,
    COUNT(*) AS product_count,
    ROUND(AVG(retail_price)::numeric, 2) AS avg_retail_price,
    ROUND(AVG(discounted_price)::numeric, 2) AS avg_discounted_price,
    ROUND(AVG(discount_pct)::numeric, 2) AS avg_discount_pct,
    ROUND(SUM(savings_amount)::numeric, 2) AS total_savings
FROM flipkart_products
GROUP BY is_fk_advantage
ORDER BY is_fk_advantage DESC;



-- Q6: Discount tier distribution across top 5 categories
SELECT
    "L1_category",
    discount_tier,
    COUNT(*) AS product_count
FROM flipkart_products
WHERE "L1_category" IN (
    SELECT "L1_category"
    FROM flipkart_products
    GROUP BY "L1_category"
    ORDER BY COUNT(*) DESC
    LIMIT 5
)
GROUP BY "L1_category", discount_tier
ORDER BY "L1_category", product_count DESC;




-- Q7: Top 10 brands by avg discount % (min 20 products, no Unbranded)
SELECT
    brand_clean,
    COUNT(*) AS product_count,
    ROUND(AVG(discount_pct)::numeric, 2) AS avg_discount_pct,
    ROUND(AVG(retail_price)::numeric, 2) AS avg_retail_price,
    ROUND(SUM(savings_amount)::numeric, 2) AS total_savings
FROM flipkart_products
WHERE brand_clean != 'Unbranded'
GROUP BY brand_clean
HAVING COUNT(*) >= 20
ORDER BY avg_discount_pct DESC
LIMIT 10;



-- Q8: Premium products with highest discounts (above 60%)
SELECT
    product_name,
    "L1_category",
    retail_price,
    discounted_price,
    discount_pct,
    savings_amount,
    price_tier
FROM flipkart_products
WHERE price_tier = 'Premium'
  AND discount_pct > 60
  AND is_price_outlier = FALSE
ORDER BY discount_pct DESC
LIMIT 10;