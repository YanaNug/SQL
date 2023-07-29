USE test;
CREATE TABLE orders
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	employee_id VARCHAR(10),
	amount DECIMAL(10, 2),
    order_status VARCHAR(45)
);
INSERT orders (employee_id, amount, order_status)
VALUES
('e03', 15, 'OPEN'),
('e01', 25.5, 'OPEN'),
('e05', 100.7, 'CLOSED'),
('e02', 22.18, 'OPEN'),
('e04', 9.5, 'CANCELLED');
SELECT *, IF(order_status = 'OPEN', 'Order is in open state', 
IF(order_status = 'CLOSED', 'Order is closed', 'Order is cancelled')) AS full_order_status 
FROM orders;