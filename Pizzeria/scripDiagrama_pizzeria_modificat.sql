-- MySQL Workbench Synchronization
-- Generated: 2023-01-13 17:16
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Anna Santasusana Berch

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `pizzeria` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `pizzeria`.`province` (
  `province_id` INT(11) NOT NULL AUTO_INCREMENT,
  `province_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`province_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`locality` (
  `locality_id` INT(11) NOT NULL AUTO_INCREMENT,
  `locality_name` VARCHAR(45) NOT NULL,
  `province_province_id` INT(11) NOT NULL,
  PRIMARY KEY (`locality_id`),
  INDEX `fk_locality_province_idx` (`province_province_id` ASC) VISIBLE,
  CONSTRAINT `fk_locality_province`
    FOREIGN KEY (`province_province_id`)
    REFERENCES `pizzeria`.`province` (`province_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`customer` (
  `customer_id` INT(11) NOT NULL AUTO_INCREMENT,
  `customer_name` VARCHAR(45) NOT NULL,
  `customer_surnames` VARCHAR(100) NOT NULL,
  `customer_address` VARCHAR(100) NULL DEFAULT NULL,
  `customer_zipCode` VARCHAR(5) NULL DEFAULT NULL,
  `customer_phoneNumber` VARCHAR(9) NOT NULL,
  `locality_locality_id` INT(11) NOT NULL,
  PRIMARY KEY (`customer_id`),
  INDEX `fk_customer_locality1_idx` (`locality_locality_id` ASC) VISIBLE,
  CONSTRAINT `fk_customer_locality1`
    FOREIGN KEY (`locality_locality_id`)
    REFERENCES `pizzeria`.`locality` (`locality_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`storeOrder` (
  `storeOrder_id` INT(11) NOT NULL AUTO_INCREMENT,
  `storeOrder_datetime` DATETIME NOT NULL,
  `storeOrder_home_or_store` ENUM('Home delivery', 'Pick up in store') NOT NULL,
  `storeOrder_totalPrice` DECIMAL(10,2) NOT NULL,
  `customer_customer_id` INT(11) NOT NULL,
  `store_store_id` INT(11) NOT NULL,
  PRIMARY KEY (`storeOrder_id`),
  INDEX `fk_order_customer1_idx` (`customer_customer_id` ASC) VISIBLE,
  INDEX `fk_order_store1_idx` (`store_store_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_customer1`
    FOREIGN KEY (`customer_customer_id`)
    REFERENCES `pizzeria`.`customer` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_order_store1`
    FOREIGN KEY (`store_store_id`)
    REFERENCES `pizzeria`.`store` (`store_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`order_has_products` (
  `product_product_id` INT(11) NOT NULL,
  `storeOrder_storeOrder_id` INT(11) NOT NULL,
  `order_has_products_amount` INT(11) NOT NULL,
  PRIMARY KEY (`product_product_id`, `storeOrder_storeOrder_id`),
  INDEX `fk_order_has_products_product1_idx` (`product_product_id` ASC) VISIBLE,
  INDEX `fk_order_has_products_storeOrder1_idx` (`storeOrder_storeOrder_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_has_products_product1`
    FOREIGN KEY (`product_product_id`)
    REFERENCES `pizzeria`.`product` (`product_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_order_has_products_storeOrder1`
    FOREIGN KEY (`storeOrder_storeOrder_id`)
    REFERENCES `pizzeria`.`storeOrder` (`storeOrder_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`product` (
  `product_id` INT(11) NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(45) NOT NULL,
  `product_description` VARCHAR(200) NULL DEFAULT NULL,
  `product_image` VARCHAR(200) NULL DEFAULT NULL,
  `product_price` DECIMAL(10,2) NOT NULL,
  `category_category_id` INT(11) NOT NULL,
  PRIMARY KEY (`product_id`),
  INDEX `fk_product_category1_idx` (`category_category_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_category1`
    FOREIGN KEY (`category_category_id`)
    REFERENCES `pizzeria`.`category` (`category_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`category` (
  `category_id` INT(11) NOT NULL AUTO_INCREMENT,
  `category_name` ENUM('Classic Pizza ', 'Vegan Pizza', 'Gourmet Pizza', 'Hamburguer', 'Drink') NOT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`store` (
  `store_id` INT(11) NOT NULL AUTO_INCREMENT,
  `store_address` VARCHAR(100) NOT NULL,
  `store_zipCode` VARCHAR(5) NOT NULL,
  `locality_locality_id` INT(11) NOT NULL,
  PRIMARY KEY (`store_id`),
  INDEX `fk_store_locality1_idx` (`locality_locality_id` ASC) VISIBLE,
  CONSTRAINT `fk_store_locality1`
    FOREIGN KEY (`locality_locality_id`)
    REFERENCES `pizzeria`.`locality` (`locality_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`employee` (
  `employee_id` INT(11) NOT NULL AUTO_INCREMENT,
  `employee_name` VARCHAR(45) NOT NULL,
  `employee_surnames` VARCHAR(100) NOT NULL,
  `employee_nif` VARCHAR(9) NULL DEFAULT NULL,
  `employee_phoneNumber` VARCHAR(45) NULL DEFAULT NULL,
  `employee_position` ENUM('Cook', 'Delivery person') NOT NULL,
  `store_store_id` INT(11) NOT NULL,
  PRIMARY KEY (`employee_id`),
  INDEX `fk_employee_store1_idx` (`store_store_id` ASC) VISIBLE,
  CONSTRAINT `fk_employee_store1`
    FOREIGN KEY (`store_store_id`)
    REFERENCES `pizzeria`.`store` (`store_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`home_order_delivery` (
  `employee_employee_id` INT(11) NOT NULL,
  `storeOrder_storeOrder_id` INT(11) NOT NULL,
  `home_order_delivery_datetime` DATETIME NOT NULL,
  PRIMARY KEY (`employee_employee_id`, `storeOrder_storeOrder_id`),
  INDEX `fk_home_order_delivery_storeOrder1_idx` (`storeOrder_storeOrder_id` ASC) VISIBLE,
  CONSTRAINT `fk_home_order_delivery_employee1`
    FOREIGN KEY (`employee_employee_id`)
    REFERENCES `pizzeria`.`employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_home_order_delivery_storeOrder1`
    FOREIGN KEY (`storeOrder_storeOrder_id`)
    REFERENCES `pizzeria`.`storeOrder` (`storeOrder_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
