-- MySQL Workbench Synchronization
-- Generated: 2023-01-15 00:23
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Anna Santasusana Berch

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `optical_shop` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `optical_shop`.`provider` (
  `provider_id` INT(11) NOT NULL AUTO_INCREMENT,
  `provider_name` VARCHAR(60) NOT NULL,
  `provider_phone` VARCHAR(9) NOT NULL,
  `provider_fax` VARCHAR(9) NULL DEFAULT NULL,
  `provider_nif` VARCHAR(9) NULL DEFAULT NULL,
  `address_address_id` INT(11) NOT NULL,
  PRIMARY KEY (`provider_id`),
  UNIQUE INDEX `provider_phone_UNIQUE` (`provider_phone` ASC) VISIBLE,
  UNIQUE INDEX `provider_nif_UNIQUE` (`provider_nif` ASC) VISIBLE,
  INDEX `provider_name` (`provider_name` ASC) VISIBLE,
  INDEX `fk_provider_address1_idx` (`address_address_id` ASC) VISIBLE,
  CONSTRAINT `fk_provider_address1`
    FOREIGN KEY (`address_address_id`)
    REFERENCES `optical_shop`.`address` (`address_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optical_shop`.`glasses` (
  `glasses_id` INT(11) NOT NULL AUTO_INCREMENT,
  `glasses_brand` VARCHAR(45) NOT NULL,
  `glasses_left_eye_graduation` FLOAT(11) NOT NULL,
  `glasses_right_eye_graduation` FLOAT(11) NOT NULL,
  `glasses_frame_type` VARCHAR(45) NOT NULL,
  `glasses_frame_color` VARCHAR(45) NOT NULL,
  `glasses_glass_color` VARCHAR(45) NOT NULL,
  `glasses_price` DECIMAL(10,2) NOT NULL,
  `provider_provider_id` INT(11) NOT NULL,
  `sale_sale_id` INT(11) NOT NULL,
  PRIMARY KEY (`glasses_id`),
  INDEX `fk_glasses_provider1_idx` (`provider_provider_id` ASC) VISIBLE,
  INDEX `glasses_brand` (`glasses_brand` ASC) VISIBLE,
  INDEX `fk_glasses_sale1_idx` (`sale_sale_id` ASC) VISIBLE,
  CONSTRAINT `fk_glasses_provider1`
    FOREIGN KEY (`provider_provider_id`)
    REFERENCES `optical_shop`.`provider` (`provider_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_glasses_sale1`
    FOREIGN KEY (`sale_sale_id`)
    REFERENCES `optical_shop`.`sale` (`sale_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optical_shop`.`address` (
  `address_id` INT(11) NOT NULL AUTO_INCREMENT,
  `address_street` VARCHAR(45) NOT NULL,
  `address_number` VARCHAR(10) NOT NULL,
  `address_floor` VARCHAR(10) NULL DEFAULT NULL,
  `address_door` VARCHAR(10) NULL DEFAULT NULL,
  `address_city` VARCHAR(45) NOT NULL,
  `address_postal_address` VARCHAR(5) NOT NULL,
  `address_country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`address_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optical_shop`.`customer` (
  `customer_id` INT(11) NOT NULL AUTO_INCREMENT,
  `customer_name` VARCHAR(45) NOT NULL,
  `customer_phone` VARCHAR(9) NOT NULL,
  `customer_mail` VARCHAR(100) NOT NULL,
  `customer_postal_address` VARCHAR(5) NULL DEFAULT NULL,
  `customer_registration_data` DATE NULL DEFAULT NULL,
  `customer_recommendation_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE INDEX `customer_phone_UNIQUE` (`customer_phone` ASC) VISIBLE,
  UNIQUE INDEX `customer_mail_UNIQUE` (`customer_mail` ASC) VISIBLE,
  INDEX `customer_name` (`customer_name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optical_shop`.`sale` (
  `sale_id` INT(11) NOT NULL AUTO_INCREMENT,
  `sale_seller_name` VARCHAR(60) NOT NULL,
  `sale_date` DATE NOT NULL,
  `customer_customer_id` INT(11) NOT NULL,
  PRIMARY KEY (`sale_id`),
  INDEX `fk_sale_customer1_idx` (`customer_customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_sale_customer1`
    FOREIGN KEY (`customer_customer_id`)
    REFERENCES `optical_shop`.`customer` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
