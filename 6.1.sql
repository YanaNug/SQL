
-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней, часов, минут и секунд.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
USE lesson_6;
DELIMITER $$
CREATE PROCEDURE translation_of_seconds(sec INT)
BEGIN
	CASE
		WHEN sec < 60 THEN
			SELECT CONCAT(sec, ' ', 'seconds') AS result;
        WHEN sec >= 60 AND sec < 3600 THEN
			SELECT CONCAT_WS(' ', sec DIV 60, 'minutes', MOD(sec, 60), 'seconds') AS result;
        WHEN sec >= 3600 AND sec < 86400 THEN
			SELECT CONCAT_WS(' ', sec DIV 3600, 'hours', MOD(sec, 3600) DIV 60, 'minutes', MOD(MOD(sec, 3600),60), 'seconds') AS result;
        ELSE
			SELECT CONCAT_WS(' ', sec DIV 86400, 'days', MOD(sec, 86400) DIV 3600, 'hours', MOD(MOD(sec, 86400),3600) DIV 60, 'minutes',
                             MOD(MOD(MOD(sec, 86400),3600),60), 'seconds') AS result;
    END CASE;
END$$

DELIMITER ;
CALL translation_of_seconds(12345);