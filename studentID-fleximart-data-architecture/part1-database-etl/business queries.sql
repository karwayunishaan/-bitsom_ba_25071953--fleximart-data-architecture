-- Database: fleximart
drop database fleximart;
create database fleximart;
use fleximart;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    city VARCHAR(50),
    registration_date DATE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT DEFAULT 0
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


use fleximart;
#query 1
select c.first_name as customer_name, c.email as email, x.total_orders, x.total_spent
from customers as c
join (select o.customer_id, count(o.order_id) as total_orders , sum(ot.amount) as total_spent from
orders as o join
(select order_id, subtotal as amount from order_items ) as ot
on o.order_id = ot.order_id
group by o.customer_id
) x 
on c.customer_id = x.customer_id
having x.total_orders >=2 and x.total_spent >= 5000
ORDER BY x.total_spent DESC;
select * from order_items;
#query 2
select p.category, count(distinct p.product_id) as num_product, sum(o.quantity) as total_quantity, sum(o.subtotal) as total_revenue
from products as p
left join order_items as o
on p.product_id = o.product_id
group by p.category;

# query 3
SELECT 
    MONTHNAME(order_date) AS month_name,
    COUNT(order_id) AS total_orders,
    SUM(total_amount) AS monthly_revenue,
    SUM(SUM(total_amount)) OVER (
        ORDER BY MONTH(order_date)
    ) AS cumulative_revenue
FROM orders
WHERE YEAR(order_date) = 2024
GROUP BY MONTH(order_date), MONTHNAME(order_date)
ORDER BY MONTH(order_date);
