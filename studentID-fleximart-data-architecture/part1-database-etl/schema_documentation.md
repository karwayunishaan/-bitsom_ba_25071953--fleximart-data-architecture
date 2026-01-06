ENTITY: customers
Purpose: Stores customer information
Attributes:
  - customer_id (INT,PK): Unique identifier (Primary Key)
  - first_name: Customer's first name
  - last_name: Customer's last name
  - email (VARCHAR, UNIQUE): Customer’s email address
  - phone (VARCHAR): Contact phone number
  - city (VARCHAR): City of residence
  - registration_date (DATE): Date the customer registered on the platform

Relationships:
  - One customer can place MANY orders (1:M with orders table)
ENTITY: Products
Purpose: Stores Product level information
Attributes:
   - Product_id (INT,PK): Unique Identifier
   - product_name (VARCHAR): Name of the product
   - Category (VARCHAR): category of products grouped
   - Price (DECIMAL)(10,2): Monetary Value of the product
   - stock_quantity (INT): total stock quantity of product available in inventory
Relationship:
   - One Product can be in many orders
   - Relationship: products (1) → order_items (M)

ENTITY: orders
Purpose: Stores order level information
Attributes:
  - Order_id (INT,PK): Unique Identifier (surrogate key)
  - Customer_id(INT,FK): Foreign Key referencing customers table
  - order_date (DATE): Date of order placement
  - total_amount(INT): Total monetary value of the transaction
  - status(VARCHAR): Order status (Pending, Completed, etc.)
Relationships:
  - One order belongs to one customer
  - One order can have many order items

ENTITY: Order_items
Purpose: Stores line-level details of products within an order.
Attributes: 
  - order_item_id(PK, INT): Unique Identifier
  - order_id (FK,INT): referencing orders
  - product_id (FK,INT): referencing products
  - Quantity (INT): total quantity ordered
  - unit_price (DECIMAL): Price per unit at time of order
  - subtotal (DECIMAL): quantity × unit_price

Relationships:
  - Many order_items belong to one order
  - Many order_items reference one product

Normalization Explanation:
The Fleximart database is designed in 3 Normal form to minimize data redundancy, double storage and any insert, update or delete anomalies

In the customers table, the customer_id is the primary key and all key and non key attributes are depended on the primary key. first_name, email, phone, city etc are only functionally depended on customer_id and not transitively depended on any other key.
In the products table, product_id is the primary key and follows the same principle, where product_id determines product_name, category, price, and stock_quantity. Product pricing and category information are stored only once, preventing update anomalies when product details change.
In the orders table, it ensures in avoiding order line level data and stores only order level data avoiding any transitive dependencies. all non key attributes like order_date, total_amount, status are depended only on order_id
The order_items table avoids the many to many relationships between orders and products. One order can have many products and one product can be ordered multiple times, this voilates the 1NF. In order to avoid this the order_items table solve this problem as its attributes depend entirely on the primary key order_item_id, with foreign keys linking to orders and products. 
This design avoids update anomalies by preventing duplicate storage of customer and product information, insert anomalies by allowing orders and products to exist independently, and delete anomalies by ensuring that removing an order does not delete customer or product records. Overall, the schema adheres to 3NF by ensuring that every non-key attribute depends only on the key, the whole key, and nothing but the key.



























