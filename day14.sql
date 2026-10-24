
USE world;

DROP PROCEDURE IF EXISTS show_countries;
DROP PROCEDURE IF EXISTS show_country;
DROP PROCEDURE IF EXISTS get_country_count;

DELIMITER $$

CREATE PROCEDURE show_countries()
BEGIN
    SELECT Code, Name, Population
    FROM country;
END $$

CREATE PROCEDURE show_country(IN p_code CHAR(3))
BEGIN
    SELECT Code, Name, Population
    FROM country
    WHERE Code = p_code;
END $$

CREATE PROCEDURE get_country_count()
BEGIN
    SELECT COUNT(*) AS total_countries
    FROM country;
END $$

DELIMITER ;

CALL show_countries();

CALL show_country('IND');

CALL get_country_count();


DROP TABLE IF EXISTS population_log;
DROP TABLE IF EXISTS population_test;

CREATE TABLE population_test (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    population BIGINT
);

CREATE TABLE population_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    action_type VARCHAR(20),
    country_id INT,
    old_population BIGINT,
    new_population BIGINT,
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP TRIGGER IF EXISTS before_insert_population;
DROP TRIGGER IF EXISTS after_insert_population;
DROP TRIGGER IF EXISTS before_update_population;
DROP TRIGGER IF EXISTS after_update_population;
DROP TRIGGER IF EXISTS after_delete_population;

DELIMITER $$

CREATE TRIGGER before_insert_population
BEFORE INSERT ON population_test
FOR EACH ROW
BEGIN
    IF NEW.population < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Population cannot be negative';
    END IF;
END $$

CREATE TRIGGER after_insert_population
AFTER INSERT ON population_test
FOR EACH ROW
BEGIN
    INSERT INTO population_log
        (action_type, country_id, new_population)
    VALUES
        ('INSERT', NEW.id, NEW.population);
END $$

CREATE TRIGGER before_update_population
BEFORE UPDATE ON population_test
FOR EACH ROW
BEGIN
    IF NEW.population < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Population cannot be negative';
    END IF;
END $$

CREATE TRIGGER after_update_population
AFTER UPDATE ON population_test
FOR EACH ROW
BEGIN
    INSERT INTO population_log
        (action_type, country_id, old_population, new_population)
    VALUES
        ('UPDATE', NEW.id, OLD.population, NEW.population);
END $$

CREATE TRIGGER after_delete_population
AFTER DELETE ON population_test
FOR EACH ROW
BEGIN
    INSERT INTO population_log
        (action_type, country_id, old_population)
    VALUES
        ('DELETE', OLD.id, OLD.population);
END $$

DELIMITER ;

INSERT INTO population_test
VALUES
(1, 'India', 1400000000),
(2, 'Australia', 26000000),
(3, 'Japan', 125000000);

SELECT * FROM population_test;

SELECT * FROM population_log;

UPDATE population_test
SET population = 1450000000
WHERE id = 1;

SELECT * FROM population_test;

SELECT * FROM population_log;

DELETE FROM population_test
WHERE id = 3;

SELECT * FROM population_test;

SELECT * FROM population_log;
