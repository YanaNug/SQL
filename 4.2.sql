USE lesson_4;
CREATE TABLE `shops` (
	`id` INT,
    `shopname` VARCHAR (100),
    PRIMARY KEY (id)
);
CREATE TABLE `cats` (
	`name` VARCHAR (100),
    `id` INT,
    PRIMARY KEY (id),
    shops_id INT,
    CONSTRAINT fk_cats_shops_id FOREIGN KEY (shops_id)
        REFERENCES `shops` (id)
);

INSERT INTO `shops`
VALUES 
		(1, "Четыре лапы"),
        (2, "Мистер Зоо"),
        (3, "МурзиЛЛа"),
        (4, "Кошки и собаки");

INSERT INTO `cats`
VALUES 
		("Murzik",1,1),
        ("Nemo",2,2),
        ("Vicont",3,1),
        ("Zuza",4,3);
-- Вывести всех котиков по магазинам по id (условие соединения shops.id = cats.shops_id)

SELECT cats.name, shops.shopname
FROM cats
JOIN shops ON shops.id = cats.shops_id;

-- Вывести магазин, в котором продается кот “Murzik” (попробуйте выполнить 2 способами)
-- 1 способ используем INNER JOIN и WHERE

SELECT shops.shopname
FROM shops
INNER JOIN cats
ON shops.id = cats.shops_id
WHERE cats.name = "Murzik";

-- Используя подзапрос

SELECT shopname
FROM shops
WHERE id = (SELECT shops_id FROM cats WHERE name = 'Murzik');


-- Вывести магазины, в которых НЕ продаются коты “Murzik” и “Zuza”

SELECT s.shopname 
   
FROM shops s
LEFT JOIN cats c ON s.id = c.shops_id AND (c.name = 'Murzik' OR c.name = 'Zuza')
WHERE c.name IS NULL; 