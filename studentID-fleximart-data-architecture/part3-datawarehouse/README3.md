

**File path:**  
`part3-datawarehouse/README.md`

```md
# Part 3: Data Warehouse and Analytics

## Objective
This part builds a data warehouse for FlexiMart using a star schema design. It enables historical sales analysis and supports OLAP queries for business decision-making.

## Files in this Folder
- `star_schema_design.md`  
  Documentation explaining the star schema, fact table, dimensions, and design decisions.

- `warehouse_schema.sql`  
  SQL script to create dimension tables and fact table in the data warehouse.

- `warehouse_data.sql`  
  Contains INSERT statements to populate dimension and fact tables with sample data.

- `analytics_queries.sql`  
  SQL queries that perform OLAP analysis such as sales trends, product performance, and customer segmentation.

## How to Run
1. Create the data warehouse database:
   ```bash
   mysql -u root -p -e "CREATE DATABASE fleximart_dw;"
   mysql -u root -p fleximart_dw < warehouse_schema.sql
   mysql -u root -p fleximart_dw < warehouse_data.sql
   mysql -u root -p fleximart_dw < analytics_queries.sql

