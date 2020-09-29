-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Miricyl
-- -----------------------------------------------------
-- Database for storing Mental health service provider details

-- -----------------------------------------------------
-- Schema Miricyl
--
-- Database for storing Mental health service provider details
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Miricyl` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `Miricyl` ;

-- -----------------------------------------------------
-- Table `Miricyl`.`Needs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Miricyl`.`Needs` (
  `NeedsID` INT NOT NULL AUTO_INCREMENT,
  `NeedsDesc` VARCHAR(100) NOT NULL,
  `UserOption` VARCHAR(200) NULL,
  PRIMARY KEY (`NeedsID`),
  UNIQUE INDEX `NeedsID_UNIQUE` (`NeedsID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Miricyl`.`Type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Miricyl`.`Type` (
  `ServiceTypeID` INT NOT NULL AUTO_INCREMENT,
  `Description` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`ServiceTypeID`),
  UNIQUE INDEX `ServiceTypeID_UNIQUE` (`ServiceTypeID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Miricyl`.`Country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Miricyl`.`Country` (
  `CountryID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(100) NULL,
  PRIMARY KEY (`CountryID`),
  UNIQUE INDEX `CountryID_UNIQUE` (`CountryID` ASC) VISIBLE,
  UNIQUE INDEX `Name_UNIQUE` (`Name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Miricyl`.`Organisation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Miricyl`.`Organisation` (
  `OrgID` INT NOT NULL AUTO_INCREMENT,
  `OrgName` VARCHAR(255) NOT NULL,
  `LogoURl` VARCHAR(255) NULL,
  `ServiceDesc` VARCHAR(500) NULL,
  `Email` VARCHAR(100) NULL,
  `OrgURL` VARCHAR(100) NULL,
  `PlaceID` VARCHAR(100) NULL,
  `Country_CountryID` INT NOT NULL,
  PRIMARY KEY (`OrgID`),
  UNIQUE INDEX `OrgID_UNIQUE` (`OrgID` ASC) VISIBLE,
  INDEX `fk_Organisation_Country1_idx` (`Country_CountryID` ASC) VISIBLE,
  CONSTRAINT `fk_Organisation_Country1`
    FOREIGN KEY (`Country_CountryID`)
    REFERENCES `Miricyl`.`Country` (`CountryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Miricyl`.`Gender`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Miricyl`.`Gender` (
  `GenderID` INT NOT NULL AUTO_INCREMENT,
  `Gender` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`GenderID`),
  UNIQUE INDEX `GenderID_UNIQUE` (`GenderID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Miricyl`.`OrgService`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Miricyl`.`OrgService` (
  `OrgServiceID` INT NOT NULL AUTO_INCREMENT,
  `ServiceName` VARCHAR(100) NULL,
  `Description` VARCHAR(500) NULL,
  `Address1` VARCHAR(255) NULL,
  `Address2` VARCHAR(255) NULL,
  `OuterCode` VARCHAR(10) NULL,
  `InnerCode` VARCHAR(10) NULL,
  `PhoneNo` VARCHAR(100) NULL,
  `OpeningTime` VARCHAR(200) NULL,
  `Organisation_OrgID` INT NOT NULL,
  `Gender_GenderID` INT NOT NULL,
  PRIMARY KEY (`OrgServiceID`),
  UNIQUE INDEX `OrgServiceID_UNIQUE` (`OrgServiceID` ASC) VISIBLE,
  INDEX `fk_OrgService_Organisation_idx` (`Organisation_OrgID` ASC) VISIBLE,
  INDEX `fk_OrgService_Gender1_idx` (`Gender_GenderID` ASC) VISIBLE,
  CONSTRAINT `fk_OrgService_Organisation`
    FOREIGN KEY (`Organisation_OrgID`)
    REFERENCES `Miricyl`.`Organisation` (`OrgID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrgService_Gender1`
    FOREIGN KEY (`Gender_GenderID`)
    REFERENCES `Miricyl`.`Gender` (`GenderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Miricyl`.`Personalisation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Miricyl`.`Personalisation` (
  `PersonalisationID` INT NOT NULL AUTO_INCREMENT,
  `Description` VARCHAR(100) NOT NULL,
  `UserOption` VARCHAR(200) NULL,
  PRIMARY KEY (`PersonalisationID`),
  UNIQUE INDEX `PersonalisationID_UNIQUE` (`PersonalisationID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Miricyl`.`ServiceNeeds`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Miricyl`.`ServiceNeeds` (
  `OrgService_OrgServiceID` INT NOT NULL,
  `Needs_NeedsID` INT NOT NULL,
  `Type_ServiceTypeID` INT NULL,
  `Personalisation_PersonalisationID` INT NULL,
  INDEX `fk_ServiceNeeds_OrgService1_idx` (`OrgService_OrgServiceID` ASC) VISIBLE,
  INDEX `fk_ServiceNeeds_Needs1_idx` (`Needs_NeedsID` ASC) VISIBLE,
  INDEX `fk_ServiceNeeds_Type1_idx` (`Type_ServiceTypeID` ASC) VISIBLE,
  INDEX `fk_ServiceNeeds_Personalisation1_idx` (`Personalisation_PersonalisationID` ASC) VISIBLE,
  CONSTRAINT `fk_ServiceNeeds_OrgService1`
    FOREIGN KEY (`OrgService_OrgServiceID`)
    REFERENCES `Miricyl`.`OrgService` (`OrgServiceID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ServiceNeeds_Needs1`
    FOREIGN KEY (`Needs_NeedsID`)
    REFERENCES `Miricyl`.`Needs` (`NeedsID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ServiceNeeds_Type1`
    FOREIGN KEY (`Type_ServiceTypeID`)
    REFERENCES `Miricyl`.`Type` (`ServiceTypeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ServiceNeeds_Personalisation1`
    FOREIGN KEY (`Personalisation_PersonalisationID`)
    REFERENCES `Miricyl`.`Personalisation` (`PersonalisationID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `Miricyl` ;

-- -----------------------------------------------------
-- Placeholder table for view `Miricyl`.`ServiceDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Miricyl`.`ServiceDetails` (`NeedsDesc` INT, `UserOption` INT, `OrgServiceID` INT, `ServiceName` INT, `Description` INT, `Address1` INT, `Address2` INT, `OuterCode` INT, `InnerCode` INT, `PhoneNo` INT, `OpeningTime` INT, `Organisation_OrgID` INT, `Gender_GenderID` INT, `OrgName` INT, `LogoURL` INT, `ServiceArea` INT);

-- -----------------------------------------------------
-- View `Miricyl`.`ServiceDetails`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Miricyl`.`ServiceDetails`;
USE `Miricyl`;
CREATE  OR REPLACE VIEW `ServiceDetails` AS
SELECT B.NeedsDesc, B.UserOption, C.*, D.OrgName, D.LogoURL, E.Name as ServiceArea
FROM ServiceNeeds A
Inner Join Needs B on A.Needs_NeedsID = B.NeedsID
Inner Join OrgService C on C.OrgServiceID = A.OrgService_OrgServiceID
Inner Join Organisation D on D.OrgID = C.Organisation_OrgID
Inner Join Country E on E.CountryID = D.Country_CountryID
Left Join Personalisation F on F.PersonalisationID = A.Personalisation_PersonalisationID
Left Join Type G on G.ServiceTypeID = A.Type_ServiceTypeID;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
