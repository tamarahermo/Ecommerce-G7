-- MySQL Script generated by MySQL Workbench
-- lun 02 mar 2020 15:51:53 -03
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema proyecto_ecommerce
-- -----------------------------------------------------
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Direccion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Direccion` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Direccion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `calle` VARCHAR(45) NOT NULL,
  `numero` INT NOT NULL,
  `codigoPostal` VARCHAR(45) NOT NULL,
  `localidad` VARCHAR(45) NOT NULL,
  `provincia` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`privilegio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`privilegio` ;

CREATE TABLE IF NOT EXISTS `mydb`.`privilegio` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `privilegio` TINYINT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Contacto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Contacto` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Contacto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `telefono` VARCHAR(45) NOT NULL,
  `celular` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Usuario` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `usuario` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `contraseña` VARCHAR(45) NOT NULL,
  `fechaRegistracion` VARCHAR(45) NOT NULL,
  `dni` VARCHAR(45) NOT NULL,
  `loginStatus` TINYINT NOT NULL,
  `privilegio_id` INT NOT NULL,
  `Contacto_id` INT NOT NULL,
  `Direccion_id` INT NOT NULL,
  PRIMARY KEY (`id`, `privilegio_id`, `Contacto_id`, `Direccion_id`),
  INDEX `fk_Usuario_privilegio1_idx` (`privilegio_id` ASC),
  INDEX `fk_Usuario_Contacto1_idx` (`Contacto_id` ASC),
  INDEX `fk_Usuario_Direccion1_idx` (`Direccion_id` ASC),
  CONSTRAINT `fk_Usuario_privilegio1`
    FOREIGN KEY (`privilegio_id`)
    REFERENCES `mydb`.`privilegio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Contacto1`
    FOREIGN KEY (`Contacto_id`)
    REFERENCES `mydb`.`Contacto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Direccion1`
    FOREIGN KEY (`Direccion_id`)
    REFERENCES `mydb`.`Direccion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`InformacionEnvio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`InformacionEnvio` ;

CREATE TABLE IF NOT EXISTS `mydb`.`InformacionEnvio` (
  `idInformacionEnvio` INT NOT NULL,
  `formaEnvio` VARCHAR(45) NULL,
  `costoEnvio` VARCHAR(45) NULL,
  PRIMARY KEY (`idInformacionEnvio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Pedido` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Pedido` (
  `id` INT NOT NULL AUTO_INCREMENT,
  ` numeroPedido` INT NOT NULL,
  ` fechaCreacion` TIMESTAMP NOT NULL,
  ` fechaDespacho` VARCHAR(45) NOT NULL,
  `formaPago` VARCHAR(45) NOT NULL,
  `pagado` TINYINT NOT NULL,
  `entregado` TINYINT NOT NULL,
  ` costoTransporte` DOUBLE NOT NULL,
  `estadoCompraEnvio` VARCHAR(45) NOT NULL,
  ` numeroGuiaEnvio` VARCHAR(45) NOT NULL,
  `Usuario_id` INT NOT NULL,
  `Usuario_privilegio_id` INT NOT NULL,
  `Usuario_id1` INT NOT NULL,
  `Usuario_privilegio_id` INT NOT NULL,
  `Usuario_Contacto_id` INT NOT NULL,
  `Usuario_Direccion_id` INT NOT NULL,
  `InformacionEnvio_idInformacionEnvio` INT NOT NULL,
  PRIMARY KEY (`id`, `Usuario_id`, `Usuario_privilegio_id`, `Usuario_id1`, `Usuario_privilegio_id`, `Usuario_Contacto_id`, `Usuario_Direccion_id`, `InformacionEnvio_idInformacionEnvio`),
  UNIQUE INDEX ` numeroPedido_UNIQUE` (` numeroPedido` ASC),
  INDEX `fk_Pedido_Usuario1_idx` (`Usuario_id1` ASC, `Usuario_privilegio_id` ASC, `Usuario_Contacto_id` ASC, `Usuario_Direccion_id` ASC),
  INDEX `fk_Pedido_InformacionEnvio1_idx` (`InformacionEnvio_idInformacionEnvio` ASC),
  CONSTRAINT `fk_Pedido_Usuario1`
    FOREIGN KEY (`Usuario_id1` , `Usuario_privilegio_id` , `Usuario_Contacto_id` , `Usuario_Direccion_id`)
    REFERENCES `mydb`.`Usuario` (`id` , `privilegio_id` , `Contacto_id` , `Direccion_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_InformacionEnvio1`
    FOREIGN KEY (`InformacionEnvio_idInformacionEnvio`)
    REFERENCES `mydb`.`InformacionEnvio` (`idInformacionEnvio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Categoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Categoria` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Categoria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Producto` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Producto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `talle` VARCHAR(45) NOT NULL,
  `precio` VARCHAR(45) NOT NULL,
  `cantidadStock` VARCHAR(45) NOT NULL,
  `Categoria_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Categoria_id`),
  INDEX `fk_Producto_Categoria1_idx` (`Categoria_id` ASC),
  CONSTRAINT `fk_Producto_Categoria1`
    FOREIGN KEY (`Categoria_id`)
    REFERENCES `mydb`.`Categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Facturacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Facturacion` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Facturacion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cantidadPedido` DOUBLE NOT NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PedidoProducto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`PedidoProducto` ;

CREATE TABLE IF NOT EXISTS `mydb`.`PedidoProducto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `precio` DOUBLE NOT NULL,
  `cantidad` INT NOT NULL,
  `Producto_id` INT NOT NULL,
  `Producto_Categoria_id` INT NOT NULL,
  `Pedido_id` INT NOT NULL,
  `Pedido_Usuario_id` INT NOT NULL,
  `Pedido_Usuario_privilegio_id` INT NOT NULL,
  `Pedido_Usuario_id1` INT NOT NULL,
  `Pedido_Usuario_privilegio_id1` INT NOT NULL,
  `Pedido_Usuario_Contacto_id` INT NOT NULL,
  `Pedido_Usuario_Direccion_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Producto_id`, `Producto_Categoria_id`, `Pedido_id`, `Pedido_Usuario_id`, `Pedido_Usuario_privilegio_id`, `Pedido_Usuario_id1`, `Pedido_Usuario_privilegio_id1`, `Pedido_Usuario_Contacto_id`, `Pedido_Usuario_Direccion_id`),
  INDEX `fk_PedidoProducto_Producto1_idx` (`Producto_id` ASC, `Producto_Categoria_id` ASC),
  INDEX `fk_PedidoProducto_Pedido1_idx` (`Pedido_id` ASC, `Pedido_Usuario_id` ASC, `Pedido_Usuario_privilegio_id` ASC, `Pedido_Usuario_id1` ASC, `Pedido_Usuario_privilegio_id1` ASC, `Pedido_Usuario_Contacto_id` ASC, `Pedido_Usuario_Direccion_id` ASC),
  CONSTRAINT `fk_PedidoProducto_Producto1`
    FOREIGN KEY (`Producto_id` , `Producto_Categoria_id`)
    REFERENCES `mydb`.`Producto` (`id` , `Categoria_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PedidoProducto_Pedido1`
    FOREIGN KEY (`Pedido_id` , `Pedido_Usuario_id` , `Pedido_Usuario_privilegio_id` , `Pedido_Usuario_id1` , `Pedido_Usuario_privilegio_id1` , `Pedido_Usuario_Contacto_id` , `Pedido_Usuario_Direccion_id`)
    REFERENCES `mydb`.`Pedido` (`id` , `Usuario_id` , `Usuario_privilegio_id` , `Usuario_id1` , `Usuario_privilegio_id` , `Usuario_Contacto_id` , `Usuario_Direccion_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
