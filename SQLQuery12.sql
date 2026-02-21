SELECT 
    d.year,
    SUM(f.net_revenue) AS total_revenue
FROM fact_sales f
JOIN dim_date d ON f.date_key = d.date_key
GROUP BY d.year
ORDER BY total_revenue desc;

SELECT
    d.year,
    SUM(fp.quantity_produced) AS produced,
    SUM(fs.quantity_sold) AS sold
FROM fact_production fp
JOIN fact_sales fs ON fp.product_id = fs.product_id
JOIN dim_date d ON fp.date_key = d.date_key
GROUP BY d.year
order by sold;

SELECT 
    d.year,
    d.month_name,
    SUM(f.quantity_sold) AS sold
FROM fact_sales f
JOIN dim_date d ON f.date_key = d.date_key
GROUP BY d.year, d.month_name, d.month
ORDER BY sold desc;

SELECT TOP 5
    p.product_name,
    SUM(f.quantity_sold) AS total_quantity
FROM fact_sales f
JOIN dim_product p ON f.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC;

select 
    dp.product_name,
	SUM(fs.profit) AS total_profit
from fact_sales fs
join dim_product dp on fs.product_id = dp.product_id
group by dp.product_name
order by total_profit desc;

SELECT 
    dp.product_name, 
    AVG(fs.discount_pct) AS avg_discount
FROM fact_sales fs
JOIN dim_product dp ON fs.product_id = dp.product_id
GROUP BY dp.product_name
ORDER BY avg_discount DESC;

SELECT 
    fac.facility_name,
    SUM(fp.quantity_produced) AS total_production
FROM fact_production fp
JOIN dim_facility fac ON fp.facility_id = fac.facility_id
GROUP BY fac.facility_name
ORDER BY total_production DESC;

SELECT 
    fac.facility_name,
    AVG(fp.defect_rate_pct) AS avg_defect_rate
FROM fact_production fp
JOIN dim_facility fac ON fp.facility_id = fac.facility_id
GROUP BY fac.facility_name
ORDER BY avg_defect_rate DESC;

SELECT 
    dd.month_name, 
    SUM(fp.quantity_produced) AS monthly_production
FROM fact_production fp
JOIN dim_date dd ON fp.date_key = dd.date_key
GROUP BY dd.month_name, dd.month
ORDER BY monthly_production DESC;



SELECT 
    c.customer_name,
    COUNT(fs.shipment_id) AS total_shipments
FROM fact_shipment fs
JOIN dim_customer c ON fs.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER By total_shipments DESC;


select 
	dc.customer_name,
	SUM(fs.net_revenue) as total_revenue
from fact_sales fs
join dim_customer dc on fs.customer_id = dc.customer_id
group by dc.customer_name
order by total_revenue desc;

SELECT 
    dc.customer_name, 
    SUM(fs.discount_amount) AS total_discount
FROM fact_sales fs
JOIN dim_customer dc ON fs.customer_id = dc.customer_id
GROUP BY dc.customer_name
ORDER BY total_discount DESC;


SELECT 
    dp.category, 
    AVG(fs.profit_margin_pct) AS avg_margin
FROM fact_sales fs
JOIN dim_product dp ON fs.product_id = dp.product_id
GROUP BY dp.category
ORDER BY avg_margin DESC;

SELECT 
    dc.country, 
    SUM(fs.gross_revenue) AS revenue
FROM fact_sales fs
JOIN dim_customer dc ON fs.customer_id = dc.customer_id
GROUP BY dc.country
ORDER BY revenue DESC;

SELECT 
    country,
    COUNT(*) AS customer_count
FROM dim_customer
GROUP BY country;

SELECT 
    country,
    customer_name
FROM dim_customer
ORDER BY country;

SELECT 
    dd.quarter, 
    SUM(fs.profit) AS quarterly_profit
FROM fact_sales fs
JOIN dim_date dd ON fs.date_key = dd.date_key
GROUP BY dd.quarter
ORDER BY quarterly_profit DESC;

SELECT 
    dc.channel_type,
    SUM(fs.net_revenue) AS total_revenue
FROM fact_sales fs
JOIN dim_customer dc 
    ON fs.customer_id = dc.customer_id
GROUP BY dc.channel_type
order by total_revenue desc;

SELECT 
    dp.product_line,
    SUM(fs.gross_revenue) AS total_revenue
FROM fact_sales fs
JOIN dim_product dp 
    ON fs.product_id = dp.product_id
GROUP BY dp.product_line
order by total_revenue desc ;

SELECT 
    dp.color,
    SUM(fs.quantity_sold) AS total_quantity
FROM fact_sales fs
JOIN dim_product dp 
    ON fs.product_id = dp.product_id
GROUP BY dp.color
order by total_quantity desc;


