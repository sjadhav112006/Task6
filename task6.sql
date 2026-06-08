-- Task 6: Sales Trend Analysis Using Aggregations

-- Step 1: Create Table
CREATE TABLE online_sales (
    order_id INT,
    order_date DATE,
    amount DECIMAL(10, 2),
    product_id INT
);

-- Step 2: Insert Data
INSERT INTO online_sales (order_id, order_date, amount, product_id) VALUES
(1, '2024-01-05', 250.00, 101),
(2, '2024-01-15', 180.00, 102),
(3, '2024-02-03', 320.00, 103),
(4, '2024-02-20', 150.00, 101),
(5, '2024-03-10', 410.00, 104),
(6, '2024-03-25', 290.00, 102),
(7, '2024-04-08', 500.00, 103),
(8, '2024-04-18', 220.00, 101),
(9, '2024-05-12', 380.00, 104),
(10, '2024-05-28', 460.00, 102),
(11, '2024-06-07', 310.00, 103),
(12, '2024-06-19', 275.00, 101),
(13, '2024-07-14', 530.00, 104),
(14, '2024-08-22', 190.00, 102),
(15, '2024-09-30', 420.00, 103);

-- Step 3: Monthly Revenue & Order Volume
SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;

-- Step 4: Top 3 Months by Sales
SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY total_revenue DESC
LIMIT 3;