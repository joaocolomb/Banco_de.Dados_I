-- MySQL Script generated by MySQL Workbench
-- Mon Sep  9 13:57:23 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema locadora
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema locadora
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `locadora` DEFAULT CHARACTER SET utf8 ;
USE `locadora` ;

-- -----------------------------------------------------
-- Table `locadora`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `locadora`.`Cliente` (
  `idCliente` 	INT NOT NULL,
  `nome` 		VARCHAR(50) 	NOT NULL,
  `cnh`		 	VARCHAR(11) 	NOT NULL,
  `endereco` 	VARCHAR(100) 	NOT NULL,
				PRIMARY KEY 	(`idCliente`))
		ENGINE = InnoDB;

select * from cliente;
-- -----------------------------------------------------
-- Table `locadora`.`Telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `locadora`.`Telefone` (
  `idTelefone` INT NOT NULL,
  `telefone` VARCHAR(15) NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idTelefone`, `Cliente_idCliente`),
  -- INDEX `fk_Telefone_Cliente_idx` (`Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Telefone_Cliente`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `locadora`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `locadora`.`Carro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `locadora`.`Carro` (
  `idCarro` INT NOT NULL,
  `placa` VARCHAR(8) NOT NULL,
  `modelo` VARCHAR(25) NOT NULL,
  `cor` VARCHAR(15) NOT NULL,
  `ano` INT NOT NULL,
  `diaria` DOUBLE NOT NULL,
  PRIMARY KEY (`idCarro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `locadora`.`Alugar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `locadora`.`Alugar` (
  `idAlugar` VARCHAR(45) NOT NULL,
  `DataInicial` DATE NOT NULL,
  `DataFinal` DATE NOT NULL,
  `Carro_idCarro1` INT NOT NULL,
  `Carro_idCarro` INT NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idAlugar`),
 -- INDEX `fk_Alugar_Carro1_idx` (`Carro_idCarro` ASC) VISIBLE,
 -- INDEX `fk_Alugar_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Alugar_Carro1`
    FOREIGN KEY (`Carro_idCarro`)
    REFERENCES `locadora`.`Carro` (`idCarro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alugar_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `locadora`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `locadora`.`Esportivo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `locadora`.`Esportivo` (
  `Velocidade` DOUBLE NOT NULL,
  `Carro_idCarro` INT NOT NULL,
  PRIMARY KEY (`Carro_idCarro`),
  CONSTRAINT `fk_Esportivo_Carro1`
    FOREIGN KEY (`Carro_idCarro`)
    REFERENCES `locadora`.`Carro` (`idCarro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `locadora`.`Seda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `locadora`.`Seda` (
  `Passageiros` INT NOT NULL,
  `Carro_idCarro` INT NOT NULL,
  PRIMARY KEY (`Carro_idCarro`),
  CONSTRAINT `fk_Seda_Carro1`
    FOREIGN KEY (`Carro_idCarro`)
    REFERENCES `locadora`.`Carro` (`idCarro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
