USE lesson_6;
-- Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. 
-- С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
-- с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".
DELIMITER $$
CREATE FUNCTION hello() 
	RETURNS VARCHAR(25)
	DETERMINISTIC
BEGIN
DECLARE result_text VARCHAR(25);
SELECT CASE 
	WHEN current_time() >= "06:00:00" AND  current_time() < "12:00:00" THEN 'Доброе утро'
    WHEN current_time() >= "12:00:00" AND  current_time() < "18:00:00" THEN 'Добрый день'
	WHEN current_time() >= "18:00:00" AND  current_time() < "00:00:00" THEN 'Добрый вечер'
	ELSE 'Доброй ночи'
END INTO result_text;
RETURN result_text;
END $$
DELIMITER ;
SELECT hello();