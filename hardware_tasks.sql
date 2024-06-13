SELECT * FROM db_f7d6fc.hardware;
-- Вывести суммарное количество единиц техники на складе
SELECT SUM(`amount`) AS `total_amount` FROM `hardware`;

-- Вывести какие товары на складе закончились
SELECT `title` FROM `hardware` WHERE `amount` = 0;

-- Вывести среднюю цену монитора
SELECT AVG(`price`) AS `average_monitor_price` FROM `hardware` WHERE `title` LIKE '%Монитор%';

-- Вывести все клавиатуры, при этом результаты отсортировать от самой дешевой до самой дорогой
SELECT `title`, `price` FROM `hardware` WHERE `title` LIKE '%Клавиатура%' ORDER BY `price` ASC;

-- Вывести в рамках одного запроса количество товарных позиций по каждому тегу с использованием группировки, результаты отсортировать от максимального количества до минимального (товары без тегов не учитываем)
SELECT `tag`, COUNT(*) AS `amount` FROM `hardware` WHERE `tag` IS NOT NULL GROUP BY `tag` ORDER BY `amount` DESC;

-- Вывести количество товарных позиций со скидками на складе
SELECT COUNT(*) AS `discount_amount` FROM `hardware` WHERE `tag` = 'discount';

-- Вывести название и цену самой дорогой новинки
SELECT `title`, `price` FROM `hardware` WHERE `tag` = 'new' ORDER BY `price` DESC LIMIT 1;

-- Добавить в таблицу товар Ноутбук Lenovo 2BXKQ7E9XD как новинку по цене 54500 руб. в единственном экземпляре
INSERT INTO `hardware` (`title`, `price`, `amount`, `tag`) VALUES ('Ноутбук Lenovo 2BXKQ7E9XD', 54500.00, 1, 'new');

-- Найти и удалить по названию из базы ошибочно добавленный товар Очки PS VR 2 
-- Удаление с использованием JOIN и первичного ключа
 DELETE `hardware` FROM `hardware` INNER JOIN `hardware` AS `h` ON `hardware`.`id` = `h`.`id` WHERE `h`.`title` = 'Очки PS VR 2';

INSERT INTO `hardware` (`title`, `price`, `amount`, `tag`)
VALUES
  ('Ноутбук Lenovo 2BXKQ7E9XD', '54500', '1', 'new');