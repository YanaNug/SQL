USE lesson_3;

-- Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания

SELECT * FROM staff
ORDER BY salary DESC; -- убывание зарплаты 

SELECT * FROM staff
ORDER BY salary; -- возрастание зарплаты

-- Выведите 5 максимальных заработных плат (saraly)

SELECT * FROM staff
ORDER BY salary DESC
LIMIT 5;

-- Посчитайте суммарную зарплату (salary) по каждой специальности (роst)

SELECT post, SUM(salary) AS Суммарная_зарплата
FROM staff
GROUP BY post;

-- Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.

SELECT post AS Рабочих, COUNT(*)  AS в_возрасте_от_24_до_49 
FROM staff 
WHERE post = 'Рабочий' AND age >= 24 AND age <= 49
GROUP BY post;

-- Найдите количество специальностей

SELECT COUNT(DISTINCT post) AS Количество_специальностей
FROM staff;

-- Выведите специальности, у которых средний возраст сотрудников меньше 30 лет

SELECT post AS Специальность, ROUND(AVG(age), 2)  AS Средний_возраст 
FROM staff 
GROUP BY post
HAVING AVG(age) <= 30;

-- Доп:
-- Внутри каждой должности вывести ТОП-2 по ЗП (2 самых высокооплачиваемых сотрудника по ЗП внутри каждой должности)

SELECT 
	b.post, CONCAT(b.firstname," ", b.lastname) AS fullname, b.salary
FROM (
  SELECT post, firstname, lastname, salary, RANK() OVER (PARTITION BY post ORDER BY salary DESC) AS rnk
  FROM staff
) b
WHERE rnk=1 OR rnk=2;