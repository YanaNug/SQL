USE test;
CREATE TABLE sales
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	order_date DATE,
	count_product INT
);
INSERT sales (order_date,count_product)
VALUES
  ("2022-01-01", 156), 
  ("2022-01-02", 180), 
  ("2022-01-03", 21),
  ("2022-01-04", 124),
  ("2022-01-05", 341); 
 SELECT id AS id_заказа,  IF(count_product < 100, 'Маленький заказ', IF(count_product > 300, 'Большой заказ', 'Средний заказ')) AS Тип_заказа 
 FROM sales;