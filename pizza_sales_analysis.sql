-- ============================================================
-- PROJECT: PIZZA SALES ANALYSIS
-- DATABASE: pizzahut
-- DESCRIPTION: Analyze pizza sales, revenue, quantities,
--              categories, and ordering patterns.
-- REQUIREMENT: MySQL 8.0+ for window functions.
-- ============================================================

USE pizzahut;


-- ============================================================
-- Q1. TOP 3 PIZZA TYPES BY REVENUE WITHIN EACH CATEGORY
-- ============================================================

SELECT
    category,
    pizza_name,
    revenue
FROM (
    SELECT
        category,
        pizza_name,
        revenue,
        RANK() OVER (
            PARTITION BY category
            ORDER BY revenue DESC
        ) AS revenue_rank
    FROM (
        SELECT
            pizza_types.name AS pizza_name,
            pizza_types.category,
            SUM(orders_details.quantity * pizzas.price) AS revenue
        FROM pizza_types
        JOIN pizzas
            ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN orders_details
            ON orders_details.pizza_id = pizzas.pizza_id
        GROUP BY
            pizza_types.pizza_type_id,
            pizza_types.name,
            pizza_types.category
    ) AS category_revenue
) AS ranked_pizzas
WHERE revenue_rank <= 3
ORDER BY category, revenue DESC;


-- ============================================================
-- Q2. CUMULATIVE REVENUE GENERATED OVER TIME
-- ============================================================

SELECT
    order_date,
    SUM(daily_revenue) OVER (
        ORDER BY order_date
    ) AS cumulative_revenue
FROM (
    SELECT
        orders.order_date,
        SUM(orders_details.quantity * pizzas.price) AS daily_revenue
    FROM orders_details
    JOIN pizzas
        ON orders_details.pizza_id = pizzas.pizza_id
    JOIN orders
        ON orders.order_id = orders_details.order_id
    GROUP BY orders.order_date
) AS daily_sales
ORDER BY order_date;


-- ============================================================
-- Q3. TOP 3 PIZZA TYPES BY TOTAL REVENUE
-- ============================================================

SELECT
    pizza_types.name AS pizza_name,
    pizza_types.category,
    SUM(orders_details.quantity * pizzas.price) AS revenue
FROM pizza_types
JOIN pizzas
    ON pizzas.pizza_type_id = pizza_types.pizza_type_id
JOIN orders_details
    ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY
    pizza_types.pizza_type_id,
    pizza_types.name,
    pizza_types.category
ORDER BY revenue DESC
LIMIT 3;


-- ============================================================
-- Q4. AVERAGE NUMBER OF PIZZAS ORDERED PER DAY
-- ============================================================

SELECT
    ROUND(AVG(daily_quantity), 2) AS avg_pizzas_ordered_per_day
FROM (
    SELECT
        orders.order_date,
        SUM(orders_details.quantity) AS daily_quantity
    FROM orders
    JOIN orders_details
        ON orders.order_id = orders_details.order_id
    GROUP BY orders.order_date
) AS daily_order_quantity;


-- ============================================================
-- Q5. NUMBER OF PIZZA TYPES IN EACH CATEGORY
-- ============================================================

SELECT
    category,
    COUNT(*) AS pizza_type_count
FROM pizza_types
GROUP BY category
ORDER BY pizza_type_count DESC;


-- ============================================================
-- Q6. DISTRIBUTION OF ORDERS BY HOUR OF THE DAY
-- ============================================================

SELECT
    HOUR(order_time) AS order_hour,
    COUNT(*) AS total_orders
FROM orders
GROUP BY HOUR(order_time)
ORDER BY order_hour;


-- ============================================================
-- Q7. TOTAL QUANTITY ORDERED FOR EACH PIZZA CATEGORY
-- ============================================================

SELECT
    pizza_types.category,
    SUM(orders_details.quantity) AS total_quantity
FROM pizza_types
JOIN pizzas
    ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN orders_details
    ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY total_quantity DESC;


-- ============================================================
-- Q8. TOP 5 MOST ORDERED PIZZA TYPES BY QUANTITY
-- ============================================================

SELECT
    pizza_types.name AS pizza_name,
    SUM(orders_details.quantity) AS total_quantity
FROM pizza_types
JOIN pizzas
    ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN orders_details
    ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY
    pizza_types.pizza_type_id,
    pizza_types.name
ORDER BY total_quantity DESC
LIMIT 5;


-- ============================================================
-- Q9. MOST COMMONLY ORDERED PIZZA SIZE
-- Counts individual pizzas using the quantity column.
-- ============================================================

SELECT
    pizzas.size,
    SUM(orders_details.quantity) AS total_pizzas_ordered
FROM pizzas
JOIN orders_details
    ON pizzas.pizza_id = orders_details.pizza_id
GROUP BY pizzas.size
ORDER BY total_pizzas_ordered DESC;


-- ============================================================
-- Q10. HIGHEST-PRICED PIZZA ENTRY
-- Returns one entry with the highest price.
-- ============================================================

SELECT
    pizza_types.name AS pizza_name,
    pizzas.size,
    pizzas.price
FROM pizza_types
JOIN pizzas
    ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY
    pizzas.price DESC,
    pizza_types.name,
    pizzas.size
LIMIT 1;


-- ============================================================
-- Q11. TOTAL REVENUE GENERATED FROM PIZZA SALES
-- ============================================================

SELECT
    ROUND(
        SUM(orders_details.quantity * pizzas.price),
        2
    ) AS total_revenue
FROM orders_details
JOIN pizzas
    ON pizzas.pizza_id = orders_details.pizza_id;


-- ============================================================
-- Q12. TOTAL NUMBER OF ORDERS PLACED
-- ============================================================

SELECT
    COUNT(*) AS total_orders
FROM orders;



