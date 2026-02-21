CREATE TABLE fact_sales (
    sales_id INT PRIMARY KEY,
    date_key INT,
    product_id INT,
    customer_id INT,
    quantity_sold INT,
    unit_price DECIMAL(10,2),
    discount_pct DECIMAL(5,2),
    discount_amount DECIMAL(12,2),
    gross_revenue DECIMAL(12,2),
    net_revenue DECIMAL(12,2),
    total_cost DECIMAL(12,2),
    profit DECIMAL(12,2),
    profit_margin_pct DECIMAL(5,2),
    order_number NVARCHAR(50)
);
BULK INSERT fact_sales
FROM 'D:\compressed\Graduateproject\fact_sales.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);
SELECT TOP 10 * FROM fact_sales;

--fact shipment
Create Table fact_shipment(
     shipment_id INT primary key,
	 ship_date_key INT,
	 delivery_date_key INT,
	 product_id INT,
	 facility_id INT,
	 customer_id INT,
	 quantity INT,
	 carrier NVARCHAR(100),
	 status NVARCHAR(100),
	 shipping_cost DECIMAL(10,2),
	 total_weight_kg Decimal(10,2),
	 tracking_number NVARCHAR(50),
	 delay_reason nvarchar(50),
);
BULK INSERT fact_shipment
FROM 'D:\compressed\Graduateproject\fact_shipment.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);
SELECT TOP 10 * FROM fact_shipment;

--fact production
CREATE TABLE fact_production(
    production_id INT PRIMARY KEY,
    date_key INT,
    product_id INT,
    facility_id INT,
    quantity_produced INT,
    defective_units DECIMAL(10,2),
    defect_rate_pct DECIMAL(5,2),
    batch_number NVARCHAR(50)
);

BULK INSERT fact_production
FROM 'D:\compressed\Graduateproject\fact_production.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);
SELECT TOP 10 * FROM fact_production;


--fact procurement
create table fact_procurement(
     procurement_id INT Primary key,
	 order_date_key INT,
	 product_id INT,
	 supplier_id INT,
	 order_quantity INT,
	 unit_cost Decimal(10,2),
	 total_cost Decimal(10,2),
	 lead_time_days INT,
	 delivery_date_key INT,
	 quality_score Decimal(10,2),
	 po_number nvarchar(50),
);
BULK INSERT fact_procurement
FROM 'D:\compressed\Graduateproject\fact_procurement.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);
SELECT TOP 10 * FROM fact_procurement;


--fact inventory
create table fact_inventory(
     inventory_id INT Primary key,
	 date_key INT,
	 product_id INT,
	 facility_id INT,
	 stock_level INT,
	 safety_stock_level INT,
	 reorder_point INT,
);
BULK INSERT fact_inventory
FROM 'D:\compressed\Graduateproject\fact_inventory.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);
SELECT TOP 10 * FROM fact_inventory;
 --dim supplier
create table dim_supplier(
     supplier_id INT Primary key,
	 supplier_key nvarchar(100),
	 supplier_name nvarchar(100),
	 country nvarchar(100),
	 city nvarchar(100),
	 specialty nvarchar(100),
	 tier nvarchar(100),
	 avg_quality_score Decimal(10,2),
);
BULK INSERT dim_supplier
FROM 'D:\compressed\Graduateproject\dim_supplier.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);
SELECT TOP 10 * FROM dim_supplier;

--dim product
create table dim_product(
     product_id INT Primary key,
	 product_key nvarchar(100),
	 product_name nvarchar(100),
	 category nvarchar(100),
	 product_line nvarchar(100),
	 spec nvarchar(100),
	 color nvarchar(100),
	 unit_price Decimal(10,2),
	 unit_cost Decimal(10,2),
	 weight_kg Decimal(10,2),
	 Img nvarchar(100),
);
BULK INSERT dim_product
FROM 'D:\compressed\Graduateproject\dim_product.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);
SELECT TOP 10 * FROM dim_product;

--dim facility
create table dim_facility(
     facility_id INT Primary key,
	 facility_key nvarchar(100),
	 facility_name nvarchar(100),
	 country nvarchar(100),
	 city nvarchar(100),
	 facility_type nvarchar(100),
	 specialization nvarchar(100),
	 annual_capacity INT,
);
BULK INSERT dim_facility
FROM 'D:\compressed\Graduateproject\dim_facility.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);
SELECT TOP 10 * FROM dim_facility;

--dim date
create table dim_date(
     date_key INT Primary key,
	 full_date date,
	 year INT,
	 quarter INT,
	 month INT,
	 month_name nvarchar(100),
	 week INT,
	 day INT,
	 day_of_week INT,
	 day_name nvarchar(100),
	 is_weekend INT,
);
BULK INSERT dim_date
FROM 'D:\compressed\Graduateproject\dim_date.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);
SELECT TOP 10 * FROM dim_date;
--dim customer
create table dim_customer(
     customer_id INT Primary key,
	 customer_key nvarchar(100),
	 customer_name nvarchar(100),
	 country Nvarchar(100),
	 channel_type Nvarchar(100),
	 size nvarchar(100),
	 annual_volume_usd INT,
);
BULK INSERT dim_customer
FROM 'D:\compressed\Graduateproject\dim_customer.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);
SELECT TOP 10 * FROM dim_customer;

