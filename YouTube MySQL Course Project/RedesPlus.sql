-- MySQL Script generated by MySQL Workbench
-- Wed 05 Apr 2023 08:49:31 PM -05
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema RedesPlus
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema RedesPlus
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `RedesPlus` ;
USE `RedesPlus` ;

-- -----------------------------------------------------
-- Table `RedesPlus`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RedesPlus`.`Cliente` (
  `dni` INT NOT NULL,
  `nombre` VARCHAR(30) NOT NULL,
  `apellidos` VARCHAR(45) NULL,
  `fechaNac` DATE NULL,
  `tlfn` VARCHAR(9) NULL,
  PRIMARY KEY (`dni`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RedesPlus`.`Proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RedesPlus`.`Proveedor` (
  `nif` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NULL,
  PRIMARY KEY (`nif`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RedesPlus`.`Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RedesPlus`.`Producto` (
  `codigo` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL DEFAULT 'Producto sin nombre',
  `precio` FLOAT NULL,
  `Proveedor_nif` INT NOT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `fk_Producto_Proveedor1_idx` (`Proveedor_nif` ASC),
  CONSTRAINT `fk_Producto_Proveedor1`
    FOREIGN KEY (`Proveedor_nif`)
    REFERENCES `RedesPlus`.`Proveedor` (`nif`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RedesPlus`.`Compras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RedesPlus`.`Compras` (
  `Cliente_dni` INT NOT NULL,
  `Producto_codigo` INT NOT NULL,
  PRIMARY KEY (`Cliente_dni`, `Producto_codigo`),
  INDEX `fk_Cliente_has_Producto_Producto1_idx` (`Producto_codigo` ASC),
  INDEX `fk_Cliente_has_Producto_Cliente_idx` (`Cliente_dni` ASC),
  CONSTRAINT `fk_Cliente_has_Producto_Cliente`
    FOREIGN KEY (`Cliente_dni`)
    REFERENCES `RedesPlus`.`Cliente` (`dni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_has_Producto_Producto1`
    FOREIGN KEY (`Producto_codigo`)
    REFERENCES `RedesPlus`.`Producto` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
