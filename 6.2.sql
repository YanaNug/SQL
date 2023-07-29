USE lesson_6;
-- Выведите только четные числа от 1 до 10 (Через цикл).  Пример: 2,4,6,8,10

DELIMITER $$
CREATE PROCEDURE get_even_numbers(`start` INT, `end` INT)
BEGIN
	DECLARE i INT DEFAULT `start`;
    DECLARE res_str TEXT DEFAULT NULL;
    WHILE  i<=`end` DO
        IF i%2 = 0 THEN
			IF res_str IS NULL THEN
				SET res_str = concat(i);
			ELSE
				SET res_str = concat(res_str, ', ', i);
			END IF;
		END IF;
        SET i = i + 1;
    END WHILE;
	SELECT res_str;
END $$
DELIMITER ;

CALL get_even_numbers(1, 10);