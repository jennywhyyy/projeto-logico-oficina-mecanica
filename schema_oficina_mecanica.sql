-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema oficina_mecanica
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema oficina_mecanica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `oficina_mecanica` DEFAULT CHARACTER SET utf8 ;
USE `oficina_mecanica` ;

-- -----------------------------------------------------
-- Table `oficina_mecanica`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina_mecanica`.`cliente` (
  `cod_cliente` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Contato` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cod_cliente`),
  UNIQUE INDEX `cod_cliente_UNIQUE` (`cod_cliente` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina_mecanica`.`veículo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina_mecanica`.`veículo` (
  `cod_veículo` INT NOT NULL AUTO_INCREMENT,
  `cod_cliente` INT NOT NULL,
  `Categoria` ENUM("carros de luxo", "carros antigos", "caminhão", "máquinas agrícolas") NULL,
  `Placa` CHAR(9) NULL,
  PRIMARY KEY (`cod_veículo`, `cod_cliente`),
  UNIQUE INDEX `cod_veículo_UNIQUE` (`cod_veículo` ASC) VISIBLE,
  INDEX `fk_veículo_cliente_idx` (`cod_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_veículo_cliente`
    FOREIGN KEY (`cod_cliente`)
    REFERENCES `oficina_mecanica`.`cliente` (`cod_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina_mecanica`.`profissional_de_mecanica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina_mecanica`.`profissional_de_mecanica` (
  `cod_profissional` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `endereço` VARCHAR(45) NOT NULL,
  `especialidade` ENUM("carros de luxo", "carros antigos", "caminhão", "máquinas agrícolas", "customização") NOT NULL,
  PRIMARY KEY (`cod_profissional`),
  UNIQUE INDEX `cod_profissional_UNIQUE` (`cod_profissional` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina_mecanica`.`equipe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina_mecanica`.`equipe` (
  `cod_equipe` INT NOT NULL AUTO_INCREMENT,
  `cod_veículo` INT NOT NULL,
  `cod_cliente` INT NOT NULL,
  PRIMARY KEY (`cod_equipe`, `cod_veículo`, `cod_cliente`),
  UNIQUE INDEX `idequipe_UNIQUE` (`cod_equipe` ASC) VISIBLE,
  INDEX `fk_equipe_veículo1_idx` (`cod_veículo` ASC, `cod_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_equipe_veículo1`
    FOREIGN KEY (`cod_veículo` , `cod_cliente`)
    REFERENCES `oficina_mecanica`.`veículo` (`cod_veículo` , `cod_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina_mecanica`.`serviço`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina_mecanica`.`serviço` (
  `cod_serviço` INT NOT NULL AUTO_INCREMENT,
  `cliente_cod_cliente` INT NOT NULL,
  `Status` ENUM("Autorizado", "Não autorizado", "Autorização pendente") NOT NULL DEFAULT 'Autorização pendente',
  PRIMARY KEY (`cod_serviço`, `cliente_cod_cliente`),
  UNIQUE INDEX `cod_serviço_UNIQUE` (`cod_serviço` ASC) VISIBLE,
  INDEX `fk_serviço_cliente1_idx` (`cliente_cod_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_serviço_cliente1`
    FOREIGN KEY (`cliente_cod_cliente`)
    REFERENCES `oficina_mecanica`.`cliente` (`cod_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina_mecanica`.`valor_item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina_mecanica`.`valor_item` (
  `cod_item` INT NOT NULL AUTO_INCREMENT,
  `descrição` VARCHAR(45) NULL,
  `preço` FLOAT NULL,
  PRIMARY KEY (`cod_item`),
  UNIQUE INDEX `cod_item_UNIQUE` (`cod_item` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina_mecanica`.`valor_maodeobra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina_mecanica`.`valor_maodeobra` (
  `cod_maodeobra` INT NOT NULL AUTO_INCREMENT,
  `descrição` VARCHAR(45) NULL,
  `preço` FLOAT NULL,
  PRIMARY KEY (`cod_maodeobra`),
  UNIQUE INDEX `cod_maodeobra_UNIQUE` (`cod_maodeobra` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina_mecanica`.`ordem_serviço`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina_mecanica`.`ordem_serviço` (
  `cod_os` INT NOT NULL AUTO_INCREMENT,
  `equipe_cod_equipe` INT NOT NULL,
  `data_emissão` CHAR(10) NOT NULL,
  `data_conclusão` CHAR(10) NULL,
  `status` ENUM("em andamento", "concluída") NULL,
  `cod_veículo` INT NOT NULL,
  `cod_cliente` INT NOT NULL,
  `cod_serviço` INT NOT NULL,
  `cod_item` INT NOT NULL,
  `cod_maodeobra` INT NOT NULL,
  PRIMARY KEY (`cod_os`, `equipe_cod_equipe`, `cod_veículo`, `cod_cliente`, `cod_serviço`, `cod_item`, `cod_maodeobra`),
  UNIQUE INDEX `idordem_serviço_UNIQUE` (`cod_os` ASC) VISIBLE,
  INDEX `fk_ordem_serviço_equipe1_idx` (`equipe_cod_equipe` ASC, `cod_veículo` ASC, `cod_cliente` ASC) VISIBLE,
  INDEX `fk_ordem_serviço_serviço1_idx` (`cod_serviço` ASC) VISIBLE,
  INDEX `fk_ordem_serviço_valor_item1_idx` (`cod_item` ASC) VISIBLE,
  INDEX `fk_ordem_serviço_valor_maodeobra1_idx` (`cod_maodeobra` ASC) VISIBLE,
  CONSTRAINT `fk_ordem_serviço_equipe1`
    FOREIGN KEY (`equipe_cod_equipe` , `cod_veículo` , `cod_cliente`)
    REFERENCES `oficina_mecanica`.`equipe` (`cod_equipe` , `cod_veículo` , `cod_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordem_serviço_serviço1`
    FOREIGN KEY (`cod_serviço`)
    REFERENCES `oficina_mecanica`.`serviço` (`cod_serviço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordem_serviço_valor_item1`
    FOREIGN KEY (`cod_item`)
    REFERENCES `oficina_mecanica`.`valor_item` (`cod_item`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordem_serviço_valor_maodeobra1`
    FOREIGN KEY (`cod_maodeobra`)
    REFERENCES `oficina_mecanica`.`valor_maodeobra` (`cod_maodeobra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina_mecanica`.`profissionais_por_equipe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina_mecanica`.`profissionais_por_equipe` (
  `cod_equipe` INT NOT NULL,
  `cod_veículo` INT NOT NULL,
  `cod_cliente` INT NOT NULL,
  `cod_profissional` INT NOT NULL,
  PRIMARY KEY (`cod_equipe`, `cod_veículo`, `cod_cliente`, `cod_profissional`),
  INDEX `fk_equipe_has_profissional_de_mecanica_profissional_de_meca_idx` (`cod_profissional` ASC) VISIBLE,
  INDEX `fk_equipe_has_profissional_de_mecanica_equipe1_idx` (`cod_equipe` ASC, `cod_veículo` ASC, `cod_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_equipe_has_profissional_de_mecanica_equipe1`
    FOREIGN KEY (`cod_equipe` , `cod_veículo` , `cod_cliente`)
    REFERENCES `oficina_mecanica`.`equipe` (`cod_equipe` , `cod_veículo` , `cod_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_equipe_has_profissional_de_mecanica_profissional_de_mecani1`
    FOREIGN KEY (`cod_profissional`)
    REFERENCES `oficina_mecanica`.`profissional_de_mecanica` (`cod_profissional`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
