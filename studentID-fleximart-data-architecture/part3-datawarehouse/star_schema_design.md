FACT TABLE: fact_sales
Grain: One row per product per order line item
Business Process: Sales transactions

Measures (Numeric Facts):
- quantity_sold: Number of units sold
- unit_price: Price per unit at time of sale
- discount_amount: Discount applied
- total_amount: Final amount (quantity × unit_price - discount)

Foreign Keys:
- date_key → dim_date
- product_key → dim_product
- customer_key → dim_customer

DIMENSION TABLE: dim_date
Purpose: Date dimension for time-based analysis
Type: Conformed dimension
Attributes:
- date_key (PK): Surrogate key (integer, format: YYYYMMDD)
- full_date: Actual date
- day_of_week: Monday, Tuesday, etc.
- month: 1-12
- month_name: January, February, etc.
- quarter: Q1, Q2, Q3, Q4
- year: 2023, 2024, etc.
- is_weekend: Boolean

DIMENSION TABLE: dim_product
Purpose: Product dimension for product level information
Attributes:
 - Product_key (PK): Surrogate key ( INT)
 - Product_id :(VARCHAR)
 - Product_name :(VARCHAR) name of the product eg: "HP thinkpad", "nike sneakers"
 - Category :(VARCHAR) name of the category from which the product belongs egs ;" laptop", "shirts" etc
 - Subcategory : (VARCHAR)  further categorization of products.
 - unit_price : (INT) monetary value of product

DIMENSION TABLE : dim_customer
Purpose : provides customer level information
Attributes:
 - customer_key: INT PK  autro increment
 - customer_id: (VARCHAR)
 - customer_name: (VARCHAR) provides name of customer
 - city : VARCHAR(50) provides name of cities
 - state VARCHAR(50) provides name of states
 - customer_segment VARCHAR(20) High/Medium/Low value classification (used for marketing)

Section 2: Design Decisions (3 marks - 150 words)
Q1) Why you chose this granularity (transaction line-item level)
ans) it allows to store each and every part of the data by individually storing the product sold. It helps in precise product level analysis, calculation of monthly level sales data, product performance analysis, customer segmentation analysis etc.

Q2) Why surrogate keys instead of natural keys
ans) PK from source code might lack schema integrity usually stored using different nomenclature frequenlty using non int or VARCHAR level schema to store data which becomes incompatible when ensuring constistency and might cause issue in running querry and analysis. using a SK ensures consistency across data marts and allows for cleaner joins between fact and dimension tables.

Q3) How this design supports drill-down and roll-up operations
ans) it allows roll up operations for eg category -> sub category -> product_name
 and drill down by date Year -> quarter -> month -> day of week

 Section 3: Sample Data Flow (3 marks)
Show an example of how one transaction flows from source to data warehouse:
Source Transaction:
Order #101, Customer "John Doe", Product "Laptop", Qty: 2, Price: 50000

Becomes in Data Warehouse:
fact_sales: {
  date_key: 20240115,
  product_key: 5,
  customer_key: 12,
  quantity_sold: 2,
  unit_price: 50000,
  total_amount: 100000
}

dim_date: {date_key: 20240115, full_date: '2024-01-15', month: 1, quarter: 'Q1', year: '2024', is_weekend: 'True'}
dim_product: {product_key: 5,product_id: 'P003', product_name: 'HP pavillion', category: 'Electronics', sub_category: 'consumer_electronics', unit_price: 50000 }
dim_customer: {customer_key: 12, customer_name: 'John Doe', city: 'Mumbai', state: 'Maharashtra', customer_segment: 'high'}












