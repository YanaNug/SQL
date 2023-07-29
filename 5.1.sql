
USE lesson_5;
CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT *
FROM cars;
-- Создаём представление, в которое попадут автомобили стоимостью до 25 000 долларов
CREATE VIEW cars_less_25000
AS SELECT *
FROM cars
WHERE cost < 25000;

-- Изменяем в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор OR REPLACE)
CREATE OR REPLACE VIEW cars_less_25000 
AS SELECT *
FROM cars
WHERE cost < 30000;

-- Создаём представление, в котором будут только автомобили марки “Шкода” и “Ауди”
CREATE VIEW Skoda_and_Audi
AS SELECT *
FROM cars
WHERE name='Skoda' OR name='Audi';