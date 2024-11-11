-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema hw02
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hw02
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hw02` DEFAULT CHARACTER SET utf8 ;
USE `hw02` ;

-- -----------------------------------------------------
-- Table `hw02`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hw02`.`clients` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(256) NULL,
  `name` VARCHAR(256) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hw02`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hw02`.`orders` (
  `id` INT NOT NULL,
  `client_id` INT NOT NULL,
  `data` DATE NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `client_id_fk_idx` (`client_id` ASC) VISIBLE,
  CONSTRAINT `client_id_fk`
    FOREIGN KEY (`client_id`)
    REFERENCES `hw02`.`clients` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hw02`.`products_orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hw02`.`products_orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `quantity` INT ZEROFILL NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `order_id_fk_idx` (`order_id` ASC) VISIBLE,
  CONSTRAINT `order_id_fk`
    FOREIGN KEY (`order_id`)
    REFERENCES `hw02`.`orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `hw02`.`clients`
-- -----------------------------------------------------
START TRANSACTION;
USE `hw02`;
INSERT INTO `hw02`.`clients` (`id`, `address`, `name`) VALUES (1, 'Хрещатик 1', 'Мельник');
INSERT INTO `hw02`.`clients` (`id`, `address`, `name`) VALUES (2, 'Басейна 2', 'Шевченко');
INSERT INTO `hw02`.`clients` (`id`, `address`, `name`) VALUES (3, 'Компютерна 3', 'Коваленко');

COMMIT;


-- -----------------------------------------------------
-- Data for table `hw02`.`orders`
-- -----------------------------------------------------
START TRANSACTION;
USE `hw02`;
INSERT INTO `hw02`.`orders` (`id`, `client_id`, `data`) VALUES (101, 1, '2023-03-15');
INSERT INTO `hw02`.`orders` (`id`, `client_id`, `data`) VALUES (102, 2, '2023-03-16');
INSERT INTO `hw02`.`orders` (`id`, `client_id`, `data`) VALUES (103, 3, '2023-03-17');

COMMIT;


-- -----------------------------------------------------
-- Data for table `hw02`.`products_orders`
-- -----------------------------------------------------
START TRANSACTION;
USE `hw02`;
INSERT INTO `hw02`.`products_orders` (`id`, `order_id`, `name`, `quantity`) VALUES (1, 101, 'Лептоп', 3);
INSERT INTO `hw02`.`products_orders` (`id`, `order_id`, `name`, `quantity`) VALUES (2, 101, 'Мишка', 2);
INSERT INTO `hw02`.`products_orders` (`id`, `order_id`, `name`, `quantity`) VALUES (3, 102, 'Принтер', 1);
INSERT INTO `hw02`.`products_orders` (`id`, `order_id`, `name`, `quantity`) VALUES (4, 103, 'Мишка', 4);

COMMIT;

