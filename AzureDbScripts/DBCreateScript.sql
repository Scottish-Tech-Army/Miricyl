-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema __dbname__
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `__dbname__` ;

-- -----------------------------------------------------
-- Schema __dbname__
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `__dbname__` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `__dbname__` ;

-- -----------------------------------------------------
-- Table `__dbname__`.`Country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `__dbname__`.`Country` ;

CREATE TABLE IF NOT EXISTS `__dbname__`.`Country` (
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
-- Table `__dbname__`.`Gender`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `__dbname__`.`Gender` ;

CREATE TABLE IF NOT EXISTS `__dbname__`.`Gender` (
  `GenderID` INT NOT NULL AUTO_INCREMENT,
  `Gender` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`GenderID`),
  UNIQUE INDEX `GenderID_UNIQUE` (`GenderID` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 101
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `__dbname__`.`Needs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `__dbname__`.`Needs` ;

CREATE TABLE IF NOT EXISTS `__dbname__`.`Needs` (
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
-- Table `__dbname__`.`Organisation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `__dbname__`.`Organisation` ;

CREATE TABLE IF NOT EXISTS `__dbname__`.`Organisation` (
  `OrgID` INT NOT NULL AUTO_INCREMENT,
  `OrgName` VARCHAR(255) NOT NULL,
  `LogoURl` VARCHAR(255) NULL DEFAULT NULL,
  `OrgDesc` VARCHAR(500) NULL DEFAULT NULL,
  `Email` VARCHAR(100) NULL DEFAULT NULL,
  `OrgURL` VARCHAR(100) NULL DEFAULT NULL,
  `PlaceID` VARCHAR(100) NULL DEFAULT NULL,
  `Country_CountryID` INT NULL DEFAULT NULL,
  `NationalService` TINYINT NULL DEFAULT '0',
  `OrgAddress` VARCHAR(500) NULL DEFAULT NULL,  
  `GoogleRating` DECIMAL(5,2) NULL DEFAULT NULL,
  `FaceBookRating` DECIMAL(5,2) NULL DEFAULT NULL,
  `OrgPhoneNumber` VARCHAR(500) NULL DEFAULT NULL,  
  `OrgOpeningTime` VARCHAR(500) NULL DEFAULT NULL,  
  `OrgCharityNumber` VARCHAR(500) NULL DEFAULT NULL,
  `OrgPriority` INT NULL DEFAULT NULL,
  
  PRIMARY KEY (`OrgID`),
  UNIQUE INDEX `OrgID_UNIQUE` (`OrgID` ASC) VISIBLE,
  INDEX `fk_Organisation_Country1_idx` (`Country_CountryID` ASC) VISIBLE,
  CONSTRAINT `fk_Organisation_Country1`
    FOREIGN KEY (`Country_CountryID`)
    REFERENCES `__dbname__`.`Country` (`CountryID`))
ENGINE = InnoDB
AUTO_INCREMENT = 1200
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `__dbname__`.`OrgService`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `__dbname__`.`OrgService` ;

CREATE TABLE IF NOT EXISTS `__dbname__`.`OrgService` (
  `OrgServiceID` INT NOT NULL AUTO_INCREMENT,
  `ServiceName` VARCHAR(250) NULL DEFAULT NULL,
  `Description` VARCHAR(500) NULL DEFAULT NULL,
  `Address1` VARCHAR(255) NULL DEFAULT NULL,
  `Address2` VARCHAR(255) NULL DEFAULT NULL,
  `OuterCode` VARCHAR(10) NULL DEFAULT NULL,
  `InnerCode` VARCHAR(10) NULL DEFAULT NULL,
  `PhoneNo` VARCHAR(100) NULL DEFAULT NULL,
  `OpeningTime` VARCHAR(500) NULL DEFAULT NULL,
  `Organisation_OrgID` INT NOT NULL,
  `Gender_GenderID` INT NULL DEFAULT NULL,
  `ServiceURL` VARCHAR(200) NULL DEFAULT NULL,
  `ServiceEmail` VARCHAR(200) NULL DEFAULT NULL,
  `Country_CountryID` INT NULL DEFAULT NULL,
  `NationalService` TINYINT NULL DEFAULT '0',  
  `FaceBookURL` VARCHAR(200) NULL DEFAULT NULL,  
  `ChatURL` VARCHAR(200) NULL DEFAULT NULL,    
  `Latitude` DECIMAL(10,8) NULL DEFAULT NULL,
  `Longitude` DECIMAL(11,8) NULL DEFAULT NULL,
  `ServicePriority` INT NULL DEFAULT NULL,
  PRIMARY KEY (`OrgServiceID`),
  UNIQUE INDEX `OrgServiceID_UNIQUE` (`OrgServiceID` ASC) VISIBLE,
  INDEX `fk_OrgService_Organisation_idx` (`Organisation_OrgID` ASC) VISIBLE,
  INDEX `fk_OrgService_Gender1_idx` (`Gender_GenderID` ASC) VISIBLE,
  INDEX `fk_OrgService_Country1_idx` (`Country_CountryID` ASC) VISIBLE,
  CONSTRAINT `fk_OrgService_Country1`
    FOREIGN KEY (`Country_CountryID`)
    REFERENCES `__dbname__`.`Country` (`CountryID`),
  CONSTRAINT `fk_OrgService_Gender1`
    FOREIGN KEY (`Gender_GenderID`)
    REFERENCES `__dbname__`.`Gender` (`GenderID`),
  CONSTRAINT `fk_OrgService_Organisation`
    FOREIGN KEY (`Organisation_OrgID`)
    REFERENCES `__dbname__`.`Organisation` (`OrgID`))
ENGINE = InnoDB
AUTO_INCREMENT = 2500
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `__dbname__`.`Personalisation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `__dbname__`.`Personalisation` ;

CREATE TABLE IF NOT EXISTS `__dbname__`.`Personalisation` (
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
-- Table `__dbname__`.`Service_Import`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `__dbname__`.`Service_Import` ;

CREATE TABLE IF NOT EXISTS `__dbname__`.`Service_Import` (
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
  `Self_Reffered` VARCHAR(1) NULL DEFAULT '0',
  `Referred_By_Another_Party` VARCHAR(1) NULL DEFAULT '0',
  `Needs` VARCHAR(1) NULL DEFAULT '0',
  `Type_of_Support` VARCHAR(1) NULL DEFAULT '0',
  `Personalisation` VARCHAR(1) NULL DEFAULT '0')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `__dbname__`.`Type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `__dbname__`.`Type` ;

CREATE TABLE IF NOT EXISTS `__dbname__`.`Type` (
  `ServiceTypeID` INT NOT NULL AUTO_INCREMENT,
  `Description` VARCHAR(200) NOT NULL,
  `UserOption_Type` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`ServiceTypeID`),
  UNIQUE INDEX `ServiceTypeID_UNIQUE` (`ServiceTypeID` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 101
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `__dbname__`.`ServiceNeeds`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `__dbname__`.`ServiceNeeds` ;

CREATE TABLE IF NOT EXISTS `__dbname__`.`ServiceNeeds` (
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
    REFERENCES `__dbname__`.`Needs` (`NeedsID`),
  CONSTRAINT `fk_ServiceNeeds_OrgService1`
    FOREIGN KEY (`OrgService_OrgServiceID`)
    REFERENCES `__dbname__`.`OrgService` (`OrgServiceID`),
  CONSTRAINT `fk_ServiceNeeds_Personalisation1`
    FOREIGN KEY (`Personalisation_PersonalisationID`)
    REFERENCES `__dbname__`.`Personalisation` (`PersonalisationID`),
  CONSTRAINT `fk_ServiceNeeds_Type1`
    FOREIGN KEY (`Type_ServiceTypeID`)
    REFERENCES `__dbname__`.`Type` (`ServiceTypeID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

USE `__dbname__` ;

-- -----------------------------------------------------
-- Placeholder table for view `__dbname__`.`ServiceDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `__dbname__`.`ServiceDetails` (`OrgName` INT, `NationalService` INT, `SpecificArea` INT, `PostCode` INT, `OuterCode` INT, `InnerCode` INT, `PlaceID` INT, `Logo` INT, `OrgDescription` INT, `ServiceDescription` INT, `PhysicalAddress` INT, `EmailAddress` INT, `ServiceURL` INT, `PhoneNo` INT, `OpeningTime` INT, `Gender` INT, `Needs` INT, `UserOption` INT, `TypeOfSupport` INT, `Personalisation` INT);

-- -----------------------------------------------------
-- View `__dbname__`.`ServiceDetails`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `__dbname__`.`ServiceDetails`;
DROP VIEW IF EXISTS `__dbname__`.`ServiceDetails` ;
USE `__dbname__`;
CREATE  OR REPLACE VIEW `ServiceDetails` AS
SELECT distinct 
	O.OrgID,
	O.OrgName, 
    CASE WHEN OS.NationalService THEN 'YES' ELSE 'NO' END NationalService,
    C.Name SpecificArea,
    CONCAT(OS.OuterCode,' ',OS.InnerCode) PostCode,
    OS.OuterCode,
    OS.InnerCode,
    O.PlaceID,
    O.LogoURl as Logo,
    O.OrgDesc as OrgDescription,
	OS.ServiceName as ServiceName,
    OS.Description AS ServiceDescription,
    IF(ISNULL(OS.Address2),Address1,CONCAT(OS.Address1, ', ', OS.Address2 )) AS PhysicalAddress,
    OS.ServiceEmail as EmailAddress,
    OS.ServiceURL ,
    OS.PhoneNo,
    OS.OpeningTime,
    G.Gender,
    N.UserOption,
    T.Description as TypeOfSupport,
	T.UserOption_Type,
    P.Description as Personalisation,
	P.UserOption as UserOption_Personal,
    OS.FaceBookURL,
	OS.ChatURL,
    O.OrgPriority,
    OS.ServicePriority

FROM __dbname__.ServiceNeeds SN
INNER JOIN __dbname__.OrgService OS on OS.OrgServiceID = SN.OrgService_OrgServiceID
inner join __dbname__.Organisation O on O.OrgID = OS.Organisation_OrgID
LEFT JOIN __dbname__.Country C on C.CountryID = OS.Country_CountryID
LEFT JOIN __dbname__.Gender G on G.GenderID = OS.Gender_GenderID
INNER JOIN __dbname__.Needs N on N.NeedsID = SN.Needs_NeedsID
LEFT JOIN __dbname__.Type T on T.ServiceTypeID = SN.Type_ServiceTypeID
LEFT JOIN __dbname__.Personalisation P on P.PersonalisationID= SN.Personalisation_PersonalisationID
WHERE (NULLIF(`N`.`UserOption`, '') IS NOT NULL);


-- -----------------------------------------------------
-- Table `__dbname__`.`Serv_Import`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `__dbname__`.`Serv_Import` ;
CREATE TABLE `__dbname__`.`Serv_Import` (
  `Miricyl_DB_Id` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OrgName` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ServiceNationwide` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `Specific_Area` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `Org_PostCode` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `Short_Service_Description` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ServicePriority` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `Physical_Address` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `Email_Address` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `URL` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `Phone_No` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `Opening_Times` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `Gender_Specific` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `Needs_Abuse` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Needs_Addiction` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Needs_Alcohol` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Needs_Anger` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Needs_Anxiety` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Needs_Bereavement` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Needs_Body_image` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Needs_Bullying` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Needs_Care` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Needs_Debt` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Needs_Depression` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Needs_Discrimination` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Needs_Domestic_Abuse` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Needs_Drugs` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Needs_Eating_disorders` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Needs_Feeling_low` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Needs_Gender_identity` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Needs_General_Mental_Health` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Needs_Into_work_/unemployment` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Needs_Involved_in_crime` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Needs_LGBTQ+` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Needs_Loneliness` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Needs_Money` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Needs_New_parent` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Needs_Panic_Attacks` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Needs_Parenting` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Needs_Pregnant` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Needs_Ralationship_issue` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Needs_Self_harm` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Needs_Sleep` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Needs_Stress` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Needs_Suicide` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Needs_Victim_of_crime` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Type_Information` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Type_Helpline` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Type_Face_to_Face_Counselling` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Type_Free_services` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Type_Financial_help` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Type_Support_groups` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Type_Self_Help` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Type_Community_care` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Type_Online_support_-_Message_Boards` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Type_Online_support_-_Video_Support_Group` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Type_Online_support_-_Chat` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Type_Online_support_-_Text_Counselling` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Type_Online_support_-_E-Counselling` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Type_Online_support_-_Video_Counselling` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Personal_Under_16` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Personal_16+` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Personal_18+` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Personal_A_student` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Personal_A_parent` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Personal_LGBTQ+` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Personal_Unemployed` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Personal_A_carer` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Personal_BAME` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Self_Reffered` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Referred_By_Another_Party` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Needs` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Type_of_Support` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `Personalisation` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- -----------------------------------------------------
<<<<<<< HEAD
-- Table `__dbname__`.`Serv_Import`
=======
-- Table `__dbname__`.`Org_Import`
>>>>>>> develop
-- -----------------------------------------------------
DROP TABLE IF EXISTS `__dbname__`.`Org_Import` ;
CREATE TABLE `__dbname__`.`Org_Import` (
  `MiricylDBId` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OrgName` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OrgDescription` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OrgPhysicalAddress` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OrgNationwide` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OrgNation` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OrgPostCode` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,  
  `OrgPhoneNo` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OrgEmail` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OrgHomePage` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OrgOpeningTime` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OrgPriority` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,  
  `OrgCharityNumber` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OrgLogo` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OrgGooglePlaceId` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OrgFacebook` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OrgGooglerating` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OrgFacebookrating` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DELIMITER $$
CREATE PROCEDURE `__dbname__`.`TransformOrgData`()
BEGIN
INSERT INTO `__dbname__`.`Organisation`
	(`OrgName`, 
	`LogoURl`, 
    `OrgDesc`, 
    `Email`, 
    `OrgURL`, 
    `PlaceID`, 
    `Country_CountryID`, 
    `NationalService`, 
    `OrgAddress`,  
    `OrgPhoneNumber`, 
    `OrgOpeningTime`, 
    `OrgCharityNumber`,
	`OrgPriority`)

SELECT  A.`OrgName`,
   A.OrgLogo As LogoURL,
   A.`OrgDescription`,
   A.`OrgEmail`,
   A.`OrgHomePage`,    
   A.`OrgGooglePlaceId`,    
   B.CountryID,
case when A.`OrgNationwide` = 'Yes' Then 1 Else 0 ENd as NationalService,   
 
   A.`OrgPhysicalAddress`,
   A.`OrgPhoneNo`,
   A.`OrgOpeningTime`,
   A.`OrgCharityNumber`,
   A.`OrgPriority`
  
FROM `__dbname__`.`Org_Import`  A
left join `__dbname__`.`Country` B
	on A.`OrgNation` = B.Name	;
    
END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE `__dbname__`.`TransformServiceData`()
BEGIN
INSERT INTO `__dbname__`.`Orgservice`
( 
`ServiceName`,
`Description`,
`Address1`,
`Address2`,
`OuterCode`,
`InnerCode`,
`PhoneNo`,
`OpeningTime`,
`Organisation_OrgID`,
`Gender_GenderID`,
`ServiceURL`,
`ServiceEmail`,
`Country_CountryID`,
`NationalService`,
`FacebookURL`,
`ServicePriority`)

 SELECT distinct 
Short_Service_Description,
Short_Service_Description,
Physical_Address as ADdress1,
null as Address2,
SUBSTRING_INDEX(SUBSTRING_INDEX(Org_PostCode, ' ', 1), ' ', -1) AS Outer_Code,
TRIM( SUBSTR(Org_PostCode, LOCATE(' ', Org_PostCode )) ) AS InnerCode,
Phone_No,
Opening_Times,
B.OrgID,
D.GenderID,
URL,
Email_Address,
C.CountryID, 
case when `ServiceNationwide` = 'Yes' Then 1 Else 0 ENd as NationalService,
NULL as FacebookURL,
ServicePriority
FROM `__dbname__`.`Serv_Import` as A
inner join __dbname__.Organisation B
on B.OrgName = A.OrgName
left join __dbname__.Country as C
	on C.Name = A.Specific_Area
 left join __dbname__.Gender as D
	on D.Gender= A.Gender_Specific;
    
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `__dbname__`.`TransformServiceNeedsData`()
BEGIN

INSERT INTO `__dbname__`.`ServiceNeeds`
(`OrgService_OrgServiceID`,
`Needs_NeedsID`,
`Type_ServiceTypeID`,
`Personalisation_PersonalisationID`)

select OS.orgserviceID , N.NeedsID, T1.ServiceTypeID, P1.PersonalisationID
FROM (Select  OrgName, Short_Service_Description, 'Abuse' as Need From __dbname__.Serv_Import Where `Needs_Abuse` ='1' Union All
Select  OrgName, Short_Service_Description, 'Addiction' as Need From __dbname__.Serv_Import Where `Needs_Addiction` ='1' Union All
Select  OrgName, Short_Service_Description, 'Alcohol' as Need From __dbname__.Serv_Import Where `Needs_Alcohol` ='1' Union All
Select  OrgName, Short_Service_Description, 'Anger' as Need From __dbname__.Serv_Import Where `Needs_Anger` ='1' Union All
Select  OrgName, Short_Service_Description, 'Anxiety' as Need From __dbname__.Serv_Import Where `Needs_Anxiety` ='1' Union All
Select  OrgName, Short_Service_Description, 'Bereavement' as Need From __dbname__.Serv_Import Where `Needs_Bereavement` ='1' Union All
Select  OrgName, Short_Service_Description, 'Body image' as Need From __dbname__.Serv_Import Where `Needs_Body_image` ='1' Union All
Select  OrgName, Short_Service_Description, 'Bullying' as Need From __dbname__.Serv_Import Where `Needs_Bullying` ='1' Union All
Select  OrgName, Short_Service_Description, 'I am caring for someone else' as Need From __dbname__.Serv_Import Where `Needs_Care` ='1' Union All
Select  OrgName, Short_Service_Description, 'Debt' as Need From __dbname__.Serv_Import Where `Needs_Debt` ='1' Union All
Select  OrgName, Short_Service_Description, 'Depression' as Need From __dbname__.Serv_Import Where `Needs_Depression` ='1' Union All
Select  OrgName, Short_Service_Description, 'Discrimination' as Need From __dbname__.Serv_Import Where `Needs_Discrimination` ='1' Union All
Select  OrgName, Short_Service_Description, 'Domestic Abuse' as Need From __dbname__.Serv_Import Where `Needs_Domestic_Abuse` ='1' Union All
Select  OrgName, Short_Service_Description, 'Drugs' as Need From __dbname__.Serv_Import Where `Needs_Drugs` ='1' Union All
Select  OrgName, Short_Service_Description, 'Eating disorders' as Need From __dbname__.Serv_Import Where `Needs_Eating_disorders` ='1' Union All
Select  OrgName, Short_Service_Description, 'Feeling low' as Need From __dbname__.Serv_Import Where `Needs_Feeling_low` ='1' Union All
Select  OrgName, Short_Service_Description, 'Gender identity' as Need From __dbname__.Serv_Import Where `Needs_Gender_identity` ='1' Union All
Select  OrgName, Short_Service_Description, 'General Mental Health' as Need From __dbname__.Serv_Import Where `Needs_General_Mental_Health` ='1' Union All
Select  OrgName, Short_Service_Description, 'Into work /unemployment' as Need From __dbname__.Serv_Import Where `Needs_Into_work_/unemployment` ='1' Union All
Select  OrgName, Short_Service_Description, 'Involved in crime' as Need From __dbname__.Serv_Import Where `Needs_Involved_in_crime` ='1' Union All
Select  OrgName, Short_Service_Description, 'I was in care(foster/home)' as Need From __dbname__.Serv_Import Where `Needs_LGBTQ+` ='1' Union All
Select  OrgName, Short_Service_Description, 'Loneliness' as Need From __dbname__.Serv_Import Where `Needs_Loneliness` ='1' Union All
Select  OrgName, Short_Service_Description, 'Money' as Need From __dbname__.Serv_Import Where `Needs_Money` ='1' Union All
Select  OrgName, Short_Service_Description, 'New parent' as Need From __dbname__.Serv_Import Where `Needs_New_parent` ='1' Union All
Select  OrgName, Short_Service_Description, 'Panic Attacks' as Need From __dbname__.Serv_Import Where `Needs_Panic_Attacks` ='1' Union All
Select  OrgName, Short_Service_Description, 'Parenting' as Need From __dbname__.Serv_Import Where `Needs_Parenting` ='1' Union All
Select  OrgName, Short_Service_Description, 'Pregnant' as Need From __dbname__.Serv_Import Where `Needs_Pregnant` ='1' Union All
Select  OrgName, Short_Service_Description, 'Ralationship issue' as Need From __dbname__.Serv_Import Where `Needs_Ralationship_issue` ='1' Union All
Select  OrgName, Short_Service_Description, 'Self harm' as Need From __dbname__.Serv_Import Where `Needs_Self_harm` ='1' Union All
Select  OrgName, Short_Service_Description, 'Sleep' as Need From __dbname__.Serv_Import Where `Needs_Sleep` ='1' Union All
Select  OrgName, Short_Service_Description, 'Stress' as Need From __dbname__.Serv_Import Where `Needs_Stress` ='1' Union All
Select  OrgName, Short_Service_Description, 'Suicide' as Need From __dbname__.Serv_Import Where `Needs_Suicide` ='1' Union All
Select  OrgName, Short_Service_Description, 'Victim of crime' as Need From __dbname__.Serv_Import Where `Needs_Victim_of_crime` ='1' 
) X
INNER JOIN __dbname__.OrgService OS on OS.ServiceName = X.Short_Service_Description
INNER JOIN __dbname__.organisation O on O.OrgName = X.OrgName
       and O.OrgID = OS.Organisation_OrgID
 INNER JOIN __dbname__.Needs N on N.NeedsDesc = X.Need
LEFT join 
( Select  OrgName, Short_Service_Description, 'Information' as Type From __dbname__.Serv_Import Where `Type_Information` ='1' Union All
Select  OrgName, Short_Service_Description, 'Directory of local services' as Type From __dbname__.Serv_Import Where `Type_Helpline` ='1' Union All
Select  OrgName, Short_Service_Description, 'Face to Face Counselling' as Type From __dbname__.Serv_Import Where `Type_Face_to_Face_Counselling` ='1' Union All
Select  OrgName, Short_Service_Description, 'Free services' as Type From __dbname__.Serv_Import Where `Type_Free_services` ='1' Union All
Select  OrgName, Short_Service_Description, 'Drop in' as Type From __dbname__.Serv_Import Where `Type_Financial_help` ='1' Union All
Select  OrgName, Short_Service_Description, 'In a Group' as Type From __dbname__.Serv_Import Where `Type_Support_groups` ='1' Union All
Select  OrgName, Short_Service_Description, 'One to One' as Type From __dbname__.Serv_Import Where `Type_Self_Help` ='1' Union All
Select  OrgName, Short_Service_Description, 'Self Help' as Type From __dbname__.Serv_Import Where `Type_Community_care` ='1' Union All
Select  OrgName, Short_Service_Description, 'Online support - Message Boards/Forums' as Type From __dbname__.Serv_Import Where `Type_Online_support_-_Message_Boards` ='1' Union All
Select  OrgName, Short_Service_Description, 'Online support by Telephone' as Type From __dbname__.Serv_Import Where `Type_Online_support_-_Video_Support_Group` ='1' Union All
Select  OrgName, Short_Service_Description, 'Online support by Chat' as Type From __dbname__.Serv_Import Where `Type_Online_support_-_Chat` ='1' Union All
Select  OrgName, Short_Service_Description, 'Online support by Text' as Type From __dbname__.Serv_Import Where `Type_Online_support_-_Text_Counselling` ='1' Union All
Select  OrgName, Short_Service_Description, 'Online support by Email' as Type From __dbname__.Serv_Import Where `Type_Online_support_-_E-Counselling` ='1' Union All
Select  OrgName, Short_Service_Description, 'Online support by Video' as Type From __dbname__.Serv_Import Where `Type_Online_support_-_Video_Counselling` ='1' 
) T
on T.OrgName = O.OrgName
and T.Short_Service_Description = OS.ServiceName
 LEFT JOIN __dbname__.type T1 on T1.Description  = T.Type
LEFT join
 (Select  OrgName, Short_Service_Description, 'Under 16' as Personal From __dbname__.Serv_Import Where `Personal_Under_16` ='1' Union All
Select  OrgName, Short_Service_Description, '16+' as Personal From __dbname__.Serv_Import Where `Personal_16+` ='1' Union All
Select  OrgName, Short_Service_Description, '18+' as Personal From __dbname__.Serv_Import Where `Personal_18+` ='1' Union All
Select  OrgName, Short_Service_Description, 'A student' as Personal From __dbname__.Serv_Import Where `Personal_A_student` ='1' Union All
Select  OrgName, Short_Service_Description, 'A parent' as Personal From __dbname__.Serv_Import Where `Personal_A_parent` ='1' Union All
Select  OrgName, Short_Service_Description, 'LGBTQ+' as Personal From __dbname__.Serv_Import Where `Personal_LGBTQ+` ='1' Union All
Select  OrgName, Short_Service_Description, 'Unemployed' as Personal From __dbname__.Serv_Import Where `Personal_Unemployed` ='1' Union All
Select  OrgName, Short_Service_Description, 'A carer' as Personal From __dbname__.Serv_Import Where `Personal_A_carer` ='1' Union All
Select  OrgName, Short_Service_Description, 'BAME' as Personal From __dbname__.Serv_Import Where `Personal_BAME` ='1' 
) P
ON P.OrgName = O.OrgName
and P.Short_Service_Description = OS.ServiceName
LEFT JOIN __dbname__.personalisation P1 
	ON P1.Description = P.Personal;
    
END$$
DELIMITER ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Create A User for App
-- -----------------------------------------------------
CREATE USER IF NOT EXISTS 'appuser'  IDENTIFIED BY 'Mi@0r!9c)l' PASSWORD EXPIRE NEVER;

-- -----------------------------------------------------
-- Grant appuser to AppReader role
-- -----------------------------------------------------
GRANT SELECT on `__dbname__`.* to appuser;

-- -----------------------------------------------------
FLUSH PRIVILEGES;

