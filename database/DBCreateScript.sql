-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Miricyl
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Miricyl` ;

-- -----------------------------------------------------
-- Schema Miricyl
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Miricyl` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `Miricyl` ;

-- -----------------------------------------------------
-- Table `Miricyl`.`Country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Miricyl`.`Country` ;

CREATE TABLE IF NOT EXISTS `Miricyl`.`Country` (
  `CountryID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`CountryID`),
  UNIQUE INDEX `CountryID_UNIQUE` (`CountryID` ASC) VISIBLE,
  UNIQUE INDEX `Name_UNIQUE` (`Name` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 101
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `Miricyl`.`Gender`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Miricyl`.`Gender` ;

CREATE TABLE IF NOT EXISTS `Miricyl`.`Gender` (
  `GenderID` INT NOT NULL AUTO_INCREMENT,
  `Gender` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`GenderID`),
  UNIQUE INDEX `GenderID_UNIQUE` (`GenderID` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 101
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `Miricyl`.`Needs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Miricyl`.`Needs` ;

CREATE TABLE IF NOT EXISTS `Miricyl`.`Needs` (
  `NeedsID` INT NOT NULL AUTO_INCREMENT,
  `NeedsDesc` VARCHAR(100) NOT NULL,
  `UserOption` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`NeedsID`),
  UNIQUE INDEX `NeedsID_UNIQUE` (`NeedsID` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 101
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `Miricyl`.`Organisation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Miricyl`.`Organisation` ;

CREATE TABLE IF NOT EXISTS `Miricyl`.`Organisation` (
  `OrgID` INT NOT NULL AUTO_INCREMENT,
  `OrgName` VARCHAR(255) NOT NULL,
  `LogoURl` VARCHAR(255) NULL DEFAULT NULL,
  `ServiceDesc` VARCHAR(500) NULL DEFAULT NULL,
  `Email` VARCHAR(100) NULL DEFAULT NULL,
  `OrgURL` VARCHAR(100) NULL DEFAULT NULL,
  `PlaceID` VARCHAR(100) NULL DEFAULT NULL,
  `Country_CountryID` INT NULL DEFAULT NULL,
  `NationalService` TINYINT NULL DEFAULT '0',
  PRIMARY KEY (`OrgID`),
  UNIQUE INDEX `OrgID_UNIQUE` (`OrgID` ASC) VISIBLE,
  INDEX `fk_Organisation_Country1_idx` (`Country_CountryID` ASC) VISIBLE,
  CONSTRAINT `fk_Organisation_Country1`
    FOREIGN KEY (`Country_CountryID`)
    REFERENCES `Miricyl`.`Country` (`CountryID`))
ENGINE = InnoDB
AUTO_INCREMENT = 1001
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `Miricyl`.`OrgService`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Miricyl`.`OrgService` ;

CREATE TABLE IF NOT EXISTS `Miricyl`.`OrgService` (
  `OrgServiceID` INT NOT NULL AUTO_INCREMENT,
  `ServiceName` VARCHAR(100) NULL DEFAULT NULL,
  `Description` VARCHAR(500) NULL DEFAULT NULL,
  `Address1` VARCHAR(255) NULL DEFAULT NULL,
  `Address2` VARCHAR(255) NULL DEFAULT NULL,
  `OuterCode` VARCHAR(10) NULL DEFAULT NULL,
  `InnerCode` VARCHAR(10) NULL DEFAULT NULL,
  `PhoneNo` VARCHAR(100) NULL DEFAULT NULL,
  `OpeningTime` VARCHAR(200) NULL DEFAULT NULL,
  `Organisation_OrgID` INT NOT NULL,
  `Gender_GenderID` INT NULL DEFAULT NULL,
  `ServiceURL` VARCHAR(200) NULL DEFAULT NULL,
  `ServiceEmail` VARCHAR(200) NULL DEFAULT NULL,
  `Country_CountryID` INT NULL DEFAULT NULL,
  `NationalService` TINYINT NULL DEFAULT '0',  
  PRIMARY KEY (`OrgServiceID`),
  UNIQUE INDEX `OrgServiceID_UNIQUE` (`OrgServiceID` ASC) VISIBLE,
  INDEX `fk_OrgService_Organisation_idx` (`Organisation_OrgID` ASC) VISIBLE,
  INDEX `fk_OrgService_Gender1_idx` (`Gender_GenderID` ASC) VISIBLE,
  INDEX `fk_OrgService_Country1_idx` (`Country_CountryID` ASC) VISIBLE,
  CONSTRAINT `fk_OrgService_Country1`
    FOREIGN KEY (`Country_CountryID`)
    REFERENCES `Miricyl`.`Country` (`CountryID`),
  CONSTRAINT `fk_OrgService_Gender1`
    FOREIGN KEY (`Gender_GenderID`)
    REFERENCES `Miricyl`.`Gender` (`GenderID`),
  CONSTRAINT `fk_OrgService_Organisation`
    FOREIGN KEY (`Organisation_OrgID`)
    REFERENCES `Miricyl`.`Organisation` (`OrgID`))
ENGINE = InnoDB
AUTO_INCREMENT = 2001
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `Miricyl`.`Personalisation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Miricyl`.`Personalisation` ;

CREATE TABLE IF NOT EXISTS `Miricyl`.`Personalisation` (
  `PersonalisationID` INT NOT NULL AUTO_INCREMENT,
  `Description` VARCHAR(100) NOT NULL,
  `UserOption` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`PersonalisationID`),
  UNIQUE INDEX `PersonalisationID_UNIQUE` (`PersonalisationID` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 101
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `Miricyl`.`Service_Import`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Miricyl`.`Service_Import` ;

CREATE TABLE IF NOT EXISTS `Miricyl`.`Service_Import` (
  `Miricyl_DB_Id` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL,
  `Service_known_as_to_Miricyl` VARCHAR(500) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL,
  `National_Service?` VARCHAR(500) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL,
  `Specific_Area` VARCHAR(500) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL,
  `Org_PostCode` VARCHAR(500) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL,
  `Place_Id` VARCHAR(500) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL,
  `Logo` VARCHAR(500) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL,
  `Org_Description` VARCHAR(500) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL,
  `Short_Service_Description` VARCHAR(500) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL,
  `Physical_Address` VARCHAR(500) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL,
  `Email_Address` VARCHAR(500) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL,
  `URL` VARCHAR(500) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL,
  `Facebook` VARCHAR(500) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL,
  `Phone_No` VARCHAR(500) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL,
  `Opening_Times` VARCHAR(500) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL,
  `Gender_Specific` VARCHAR(500) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL,
  `Needs_Abuse` VARCHAR(1) NULL DEFAULT '0',
  `Needs_Addiction` VARCHAR(1) NULL DEFAULT '0',
  `Needs_Alcohol` VARCHAR(1) NULL DEFAULT '0',
  `Needs_Anger` VARCHAR(1) NULL DEFAULT '0',
  `Needs_Anxiety` VARCHAR(1) NULL DEFAULT '0',
  `Needs_Bereavement` VARCHAR(1) NULL DEFAULT '0',
  `Needs_Body_image` VARCHAR(1) NULL DEFAULT '0',
  `Needs_Bullying` VARCHAR(1) NULL DEFAULT '0',
  `Needs_Care` VARCHAR(1) NULL DEFAULT '0',
  `Needs_Debt` VARCHAR(1) NULL DEFAULT '0',
  `Needs_Depression` VARCHAR(1) NULL DEFAULT '0',
  `Needs_Discrimination` VARCHAR(1) NULL DEFAULT '0',
  `Needs_Domestic_Abuse` VARCHAR(1) NULL DEFAULT '0',
  `Needs_Drugs` VARCHAR(1) NULL DEFAULT '0',
  `Needs_Eating_disorders` VARCHAR(1) NULL DEFAULT '0',
  `Needs_Feeling_low` VARCHAR(1) NULL DEFAULT '0',
  `Needs_Gender_identity` VARCHAR(1) NULL DEFAULT '0',
  `Needs_General_Mental_Health` VARCHAR(1) NULL DEFAULT '0',
  `Needs_Into_work_/unemployment` VARCHAR(1) NULL DEFAULT '0',
  `Needs_Involved_in_crime` VARCHAR(1) NULL DEFAULT '0',
  `Needs_LGBTQ+` VARCHAR(1) NULL DEFAULT '0',
  `Needs_Loneliness` VARCHAR(1) NULL DEFAULT '0',
  `Needs_Money` VARCHAR(1) NULL DEFAULT '0',
  `Needs_New_parent` VARCHAR(1) NULL DEFAULT '0',
  `Needs_Panic_Attacks` VARCHAR(1) NULL DEFAULT '0',
  `Needs_Parenting` VARCHAR(1) NULL DEFAULT '0',
  `Needs_Pregnant` VARCHAR(1) NULL DEFAULT '0',
  `Needs_Ralationship_issue` VARCHAR(1) NULL DEFAULT '0',
  `Needs_Self_harm` VARCHAR(1) NULL DEFAULT '0',
  `Needs_Sleep` VARCHAR(1) NULL DEFAULT '0',
  `Needs_Stress` VARCHAR(1) NULL DEFAULT '0',
  `Needs_Suicide` VARCHAR(1) NULL DEFAULT '0',
  `Needs_Victim_of_crime` VARCHAR(1) NULL DEFAULT '0',
  `Type_Information` VARCHAR(1) NULL DEFAULT '0',
  `Type_Helpline` VARCHAR(1) NULL DEFAULT '0',
  `Type_Face_to_Face_Counselling` VARCHAR(1) NULL DEFAULT '0',
  `Type_Free_services` VARCHAR(1) NULL DEFAULT '0',
  `Type_Financial_help` VARCHAR(1) NULL DEFAULT '0',
  `Type_Support_groups` VARCHAR(1) NULL DEFAULT '0',
  `Type_Self_Help` VARCHAR(1) NULL DEFAULT '0',
  `Type_Community_care` VARCHAR(1) NULL DEFAULT '0',
  `Type_Online_support_-_Message_Boards` VARCHAR(1) NULL DEFAULT '0',
  `Type_Online_support_-_Video_Support_Group` VARCHAR(1) NULL DEFAULT '0',
  `Type_Online_support_-_Chat` VARCHAR(1) NULL DEFAULT '0',
  `Type_Online_support_-_Text_Counselling` VARCHAR(1) NULL DEFAULT '0',
  `Type_Online_support_-_E-Counselling` VARCHAR(1) NULL DEFAULT '0',
  `Type_Online_support_-_Video_Counselling` VARCHAR(1) NULL DEFAULT '0',
  `Personal_Under_16` VARCHAR(1) NULL DEFAULT '0',
  `Personal_16+` VARCHAR(1) NULL DEFAULT '0',
  `Personal_18+` VARCHAR(1) NULL DEFAULT '0',
  `Personal_A_student` VARCHAR(1) NULL DEFAULT '0',
  `Personal_A_parent` VARCHAR(1) NULL DEFAULT '0',
  `Personal_LGBTQ+` VARCHAR(1) NULL DEFAULT '0',
  `Personal_Unemployed` VARCHAR(1) NULL DEFAULT '0',
  `Personal_A_carer` VARCHAR(1) NULL DEFAULT '0',
  `Personal_BAME` VARCHAR(1) NULL DEFAULT '0',
  `Needs` VARCHAR(1) NULL DEFAULT '0',
  `Type_of_Support` VARCHAR(1) NULL DEFAULT '0',
  `Personalisation` VARCHAR(1) NULL DEFAULT '0')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `Miricyl`.`Type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Miricyl`.`Type` ;

CREATE TABLE IF NOT EXISTS `Miricyl`.`Type` (
  `ServiceTypeID` INT NOT NULL AUTO_INCREMENT,
  `Description` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`ServiceTypeID`),
  UNIQUE INDEX `ServiceTypeID_UNIQUE` (`ServiceTypeID` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 101
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `Miricyl`.`ServiceNeeds`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Miricyl`.`ServiceNeeds` ;

CREATE TABLE IF NOT EXISTS `Miricyl`.`ServiceNeeds` (
  `OrgService_OrgServiceID` INT NOT NULL,
  `Needs_NeedsID` INT NOT NULL,
  `Type_ServiceTypeID` INT NULL DEFAULT NULL,
  `Personalisation_PersonalisationID` INT NULL DEFAULT NULL,
  INDEX `fk_ServiceNeeds_OrgService1_idx` (`OrgService_OrgServiceID` ASC) VISIBLE,
  INDEX `fk_ServiceNeeds_Needs1_idx` (`Needs_NeedsID` ASC) VISIBLE,
  INDEX `fk_ServiceNeeds_Type1_idx` (`Type_ServiceTypeID` ASC) VISIBLE,
  INDEX `fk_ServiceNeeds_Personalisation1_idx` (`Personalisation_PersonalisationID` ASC) VISIBLE,
  CONSTRAINT `fk_ServiceNeeds_Needs1`
    FOREIGN KEY (`Needs_NeedsID`)
    REFERENCES `Miricyl`.`Needs` (`NeedsID`),
  CONSTRAINT `fk_ServiceNeeds_OrgService1`
    FOREIGN KEY (`OrgService_OrgServiceID`)
    REFERENCES `Miricyl`.`OrgService` (`OrgServiceID`),
  CONSTRAINT `fk_ServiceNeeds_Personalisation1`
    FOREIGN KEY (`Personalisation_PersonalisationID`)
    REFERENCES `Miricyl`.`Personalisation` (`PersonalisationID`),
  CONSTRAINT `fk_ServiceNeeds_Type1`
    FOREIGN KEY (`Type_ServiceTypeID`)
    REFERENCES `Miricyl`.`Type` (`ServiceTypeID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

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
	O.OrgID,
	O.OrgName, 
    CASE WHEN OS.NationalService THEN 'YES' ELSE 'NO' END NationalService,
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
LEFT JOIN Miricyl.Country C on C.CountryID = OS.Country_CountryID
LEFT JOIN Miricyl.Gender G on G.GenderID = OS.Gender_GenderID
INNER JOIN Miricyl.Needs N on N.NeedsID = SN.Needs_NeedsID
LEFT JOIN Miricyl.Type T on T.ServiceTypeID = SN.Type_ServiceTypeID
LEFT JOIN Miricyl.Personalisation P on P.PersonalisationID= SN.Personalisation_PersonalisationID
WHERE (NULLIF(`N`.`UserOption`, '') IS NOT NULL);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
