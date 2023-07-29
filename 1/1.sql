-- 1.2

SELECT ProductName, Manufacturer, Price FROM phones.phone
WHERE ProductCount > 2;

-- 1.3

SELECT ProductName, ProductCount, Price FROM phones.phone
WHERE Manufacturer = 'Samsung';

-- 1.4

SELECT ProductName, Manufacturer, ProductCount, Price FROM phones.phone
WHERE ProductCount*Price BETWEEN 100000 AND 145000;

-- 1.4_1

SELECT ProductName, Manufacturer, ProductCount, Price FROM phones.phone
WHERE ProductName LIKE '%IPhone%';

-- 1.4_2

SELECT ProductName, Manufacturer, ProductCount, Price FROM phones.phone
WHERE ProductName LIKE '%Galaxy%';

-- 1.4_3

SELECT ProductName, Manufacturer, ProductCount, Price FROM phones.phone
WHERE ProductName RLIKE '[0-9]';

-- 1.4_4

SELECT ProductName, Manufacturer, ProductCount, Price FROM phones.phone
WHERE ProductName LIKE '%8%';