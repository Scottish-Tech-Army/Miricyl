-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Miricyl
-- -----------------------------------------------------
-- Database for storing Mental health service provider details
DROP SCHEMA IF EXISTS `Miricyl` ;

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
DROP TABLE IF EXISTS `Miricyl`.`Needs` ;

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
DROP TABLE IF EXISTS `Miricyl`.`Type` ;

CREATE TABLE IF NOT EXISTS `Miricyl`.`Type` (
  `ServiceTypeID` INT NOT NULL AUTO_INCREMENT,
  `Description` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`ServiceTypeID`),
  UNIQUE INDEX `ServiceTypeID_UNIQUE` (`ServiceTypeID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Miricyl`.`Country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Miricyl`.`Country` ;

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
DROP TABLE IF EXISTS `Miricyl`.`Organisation` ;

CREATE TABLE IF NOT EXISTS `Miricyl`.`Organisation` (
  `OrgID` INT NOT NULL AUTO_INCREMENT,
  `OrgName` VARCHAR(255) NOT NULL,
  `LogoURl` VARCHAR(255) NULL,
  `ServiceDesc` VARCHAR(500) NULL,
  `Email` VARCHAR(100) NULL,
  `OrgURL` VARCHAR(100) NULL,
  `PlaceID` VARCHAR(100) NULL,
  `Country_CountryID` INT NOT NULL,
  `NationalService` TINYINT NULL DEFAULT 0,
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
DROP TABLE IF EXISTS `Miricyl`.`Gender` ;

CREATE TABLE IF NOT EXISTS `Miricyl`.`Gender` (
  `GenderID` INT NOT NULL AUTO_INCREMENT,
  `Gender` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`GenderID`),
  UNIQUE INDEX `GenderID_UNIQUE` (`GenderID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Miricyl`.`OrgService`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Miricyl`.`OrgService` ;

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
  `ServiceURL` VARCHAR(200) NULL,
  `ServiceEmail` VARCHAR(200) NULL,
  `Country_CountryID` INT NOT NULL,
  PRIMARY KEY (`OrgServiceID`),
  UNIQUE INDEX `OrgServiceID_UNIQUE` (`OrgServiceID` ASC) VISIBLE,
  INDEX `fk_OrgService_Organisation_idx` (`Organisation_OrgID` ASC) VISIBLE,
  INDEX `fk_OrgService_Gender1_idx` (`Gender_GenderID` ASC) VISIBLE,
  INDEX `fk_OrgService_Country1_idx` (`Country_CountryID` ASC) VISIBLE,
  CONSTRAINT `fk_OrgService_Organisation`
    FOREIGN KEY (`Organisation_OrgID`)
    REFERENCES `Miricyl`.`Organisation` (`OrgID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrgService_Gender1`
    FOREIGN KEY (`Gender_GenderID`)
    REFERENCES `Miricyl`.`Gender` (`GenderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrgService_Country1`
    FOREIGN KEY (`Country_CountryID`)
    REFERENCES `Miricyl`.`Country` (`CountryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Miricyl`.`Personalisation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Miricyl`.`Personalisation` ;

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
DROP TABLE IF EXISTS `Miricyl`.`ServiceNeeds` ;

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
CREATE TABLE IF NOT EXISTS `Miricyl`.`ServiceDetails` (`OrgName` INT, `NationalService` INT, `SpecificArea` INT, `PostCode` INT, `OuterCode` INT, `InnerCode` INT, `PlaceID` INT, `Logo` INT, `OrgDescription` INT, `ServiceDescription` INT, `PhysicalAddress` INT, `EmailAddress` INT, `ServiceURL` INT, `PhoneNo` INT, `OpeningTime` INT, `Gender` INT, `Needs` INT, `UserOption` INT, `TypeOfSupport` INT, `Personalisation` INT);

-- -----------------------------------------------------
-- View `Miricyl`.`ServiceDetails`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Miricyl`.`ServiceDetails`;
DROP VIEW IF EXISTS `Miricyl`.`ServiceDetails` ;
USE `Miricyl`;
CREATE  OR REPLACE VIEW `ServiceDetails` AS
SELECT 
	O.OrgName, 
    CASE WHEN O.NationalService THEN 'YES' ELSE 'NO' END NationalService,
    C.Name SpecificArea,
    CONCAT(OS.OuterCode,' ',OS.InnerCode) PostCode,
    OS.OuterCode,
    OS.InnerCode,
    O.PlaceID,
    O.LogoURl as Logo,
    O.ServiceDesc as OrgDescription,
    OS.Description AS ServiceDescription,
    CONCAT(OS.Address1, ', ', OS.Address2 ) AS PhysicalAddress,
    OS.ServiceEmail as EmailAddress,
    OS.ServiceURL ,
    OS.PhoneNo,
    OS.OpeningTime,
    G.Gender,
    N.NeedsDesc as Needs,
    N.UserOption,
    T.Description as TypeOfSupport,
    P.Description as Personalisation

FROM Miricyl.ServiceNeeds SN
INNER JOIN Miricyl.OrgService OS on OS.OrgServiceID = SN.OrgService_OrgServiceID
inner join Miricyl.Organisation O on O.OrgID = OS.Organisation_OrgID
INNER JOIN Miricyl.Country C on C.CountryID = OS.Country_CountryID
INNER JOIN Miricyl.Gender G on G.GenderID = OS.Gender_GenderID
INNER JOIN Miricyl.Needs N on N.NeedsID = SN.Needs_NeedsID
LEFT JOIN Miricyl.Type T on T.ServiceTypeID = SN.Type_ServiceTypeID
LEFT JOIN Miricyl.Personalisation P on P.PersonalisationID= SN.Personalisation_PersonalisationID;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
