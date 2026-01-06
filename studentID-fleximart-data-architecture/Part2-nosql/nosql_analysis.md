Section A: Limitations of RDBMS (4 marks - 150 words)
Explain why the current relational database would struggle with:

1) Products having different attributes (e.g., laptops have RAM/processor, shoes have size/color)
2) Frequent schema changes when adding new product types
3) Storing customer reviews as nested data
(Ans) Relational databases struggle when products have different attributes because they require a fixed schema. When multiple product categories such as laptops and shoes have different attributes, RDBMS designs either result in many nullable columns or multiple category-specific tables, increasing complexity and reducing flexibility. Frequent schema changes further create problems, as adding new product types requires ALTER TABLE operations. These changes can be expensive, cause table locks, and slow down development in a rapidly evolving product catalog. RDBMS also handles nested data poorly. Customer reviews, which are naturally hierarchical (product → reviews → users), must be flattened into separate tables. Reconstructing this data requires complex joins over large tables, increasing query complexity and reducing performance. Therefore, RDBMS becomes inefficient for semi-structured, frequently changing, and nested data models.

Section B: NoSQL Benefits (4 marks - 150 words)
Explain how MongoDB solves these problems using:
1) Flexible schema (document structure)
2) Embedded documents (reviews within products)
3) Horizontal scalability

Ans) Nosql stands for not only sql and it is designed for modern, large-scale, and flexible data needs that the traditional databases often struggle with. 
Nosql has a flexible schema design such that each record can have a different field and not restricted by rigid schema structure. Document databases (like MongoDB, CouchDB, or Firestore) store data as JSON-like documents. Each record can have unique fields and nested structures. For instance, products having different attributes can be stored with unique field and nested structure. It does not require complex joins or flattened table structure. 
{
  "product_id": "TV123",
  "category": "Television",
  "brand": "Samsung",
  "screen_size": "55 inch",
  "price": 55000
}
{
  "product_id": "TS567",
  "category": "Apparel",
  "brand": "Nike",
  "fabric": "Cotton",
  "size": "M",
  "price": 1200
} different records can have different attributes.
Nosql can store reviews by embedding them within products. Nosql allows records to store embedded documents.
For instance, [
  {
    "product_id": "ELEC001",
    "name": "Samsung Galaxy S21 Ultra",
    "category": "Electronics",
    "subcategory": "Smartphones",
    "price": 79999.00,
    "stock": 150,
    "specifications": {
      "brand": "Samsung",
      "ram": "12GB",
      "storage": "256GB",
      "screen_size": "6.8 inches",
      "processor": "Exynos 2100",
      "battery": "5000mAh",
      "camera": "108MP + 12MP + 10MP"
    },
    "reviews": [
      {
        "user_id": "U001",
        "username": "TechGuru",
        "rating": 5,
        "comment": "Excellent phone with amazing camera quality!",
        "date": "2024-01-15"
      }, here reviews in an embedded array inside the product (root document) stored in a one to many relationship where one product can have different reviews.

Where SQL relies on heavy joins and normalized data. Horizontal scalling into different servers can become difficult since distributing data on servers might cause different tables sharing relationships it causes Joins to become network operations, transactions span machines and performance drops sharply.
NoSQL is designed by default assuming data will be distributed, scalling schema and flexible structure, horizontal scalling and availability of networks. It avoids heavy joins,  uses denormalized/ embedded data, flexible schema and compromise consistency for availability and partition tolerance.


Section C: Trade-offs (2 marks - 100 words)
What are two disadvantages of using MongoDB instead of MySQL for this product catalog?

Ans) While MongoDB or Nosql offers flexibility and scalability. it does not fully enforces ACID properties. Mysql offers strong support to ACID properties, it has strong referencial capabilities through foreign keys, which are important for maintaining strict consistency. On the other hand, NOsql sacrifices consistency for availabilit and partition tolerance. It offers weak support for complex joins or advanced analytical queries. Queries involving strong and defined relations and complex joins are easier and more efficent to execute on Mysql. As a result, MongoDB may be less suitable for applications that require strong consistency, complex relational queries, and structured reporting.























