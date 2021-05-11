-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema rzk
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema rzk
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `rzk` DEFAULT CHARACTER SET utf8 ;
USE `rzk` ;

-- -----------------------------------------------------
-- Table `rzk`.`Korisnikk`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rzk`.`Korisnikk` (
  `korisnicko_ime` VARCHAR(30) NOT NULL,
  `sifra` VARCHAR(45) NOT NULL,
  `ime` VARCHAR(45) NOT NULL,
  `prezime` VARCHAR(45) NOT NULL,
  `datum_rodjenja` DATE NOT NULL,
  PRIMARY KEY (`korisnicko_ime`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rzk`.`Kategorija`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rzk`.`Kategorija` (
  `id_kategorija` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_kategorija`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rzk`.`Film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rzk`.`Film` (
  `id_film` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(100) NOT NULL,
  `trajanje` VARCHAR(45) NOT NULL,
  `zanr` VARCHAR(45) NOT NULL,
  `opis` VARCHAR(200) NOT NULL,
  `trailer` VARCHAR(45) NOT NULL,
  `Kategorija_id_kategorija` INT NOT NULL,
  `Korisnikk_korisnicko_ime` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id_film`),
  INDEX `fk_Film_Kategorija1_idx` (`Kategorija_id_kategorija` ASC) ,
  INDEX `fk_Film_Korisnik1_idx` (`Korisnikk_korisnicko_ime` ASC) ,
  CONSTRAINT `fk_Film_Kategorija1`
    FOREIGN KEY (`Kategorija_id_kategorija`)
    REFERENCES `rzk`.`Kategorija` (`id_kategorija`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Film_Korisnik1`
    FOREIGN KEY (`Korisnikk_korisnicko_ime`)
    REFERENCES `rzk`.`Korisnikk` (`korisnicko_ime`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rzk`.`Zanimljivost`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rzk`.`Zanimljivost` (
  `id_zanimljivost` INT NOT NULL AUTO_INCREMENT,
  `naslov` VARCHAR(100) NOT NULL,
  `tekst` LONGTEXT NOT NULL,
  `slika` VARCHAR(45) NULL,
  `video` VARCHAR(45) NULL,
  `Korisnikk_korisnicko_ime` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id_zanimljivost`),
  INDEX `fk_Zanimljivost_Korisnik1_idx` (`Korisnikk_korisnicko_ime` ASC) ,
  CONSTRAINT `fk_Zanimljivost_Korisnik1`
    FOREIGN KEY (`Korisnikk_korisnicko_ime`)
    REFERENCES `rzk`.`Korisnikk` (`korisnicko_ime`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rzk`.`Tema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rzk`.`Tema` (
  `id_tema` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NOT NULL,
  `Korisnikk_korisnicko_ime` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id_tema`),
  INDEX `fk_Tema_Korisnik1_idx` (`Korisnikk_korisnicko_ime` ASC) ,
  CONSTRAINT `fk_Tema_Korisnik1`
    FOREIGN KEY (`Korisnikk_korisnicko_ime`)
    REFERENCES `rzk`.`Korisnikk` (`korisnicko_ime`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rzk`.`Odgovor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rzk`.`Odgovor` (
  `id_odgovor` INT NOT NULL AUTO_INCREMENT,
  `opis` VARCHAR(300) NOT NULL,
  `Tema_id_tema` INT NOT NULL,
  `Korisnikk_korisnicko_ime` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id_odgovor`),
  INDEX `fk_Odgovor_Tema1_idx` (`Tema_id_tema` ASC) ,
  INDEX `fk_Odgovor_Korisnik1_idx` (`Korisnikk_korisnicko_ime` ASC) ,
  CONSTRAINT `fk_Odgovor_Tema1`
    FOREIGN KEY (`Tema_id_tema`)
    REFERENCES `rzk`.`Tema` (`id_tema`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Odgovor_Korisnik1`
    FOREIGN KEY (`Korisnikk_korisnicko_ime`)
    REFERENCES `rzk`.`Korisnikk` (`korisnicko_ime`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rzk`.`Utisak`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rzk`.`Utisak` (
  `id_utisak` INT NOT NULL AUTO_INCREMENT,
  `opis` VARCHAR(200) NOT NULL,
  `Korisnik_korisnicko_ime` VARCHAR(30) NOT NULL,
  `Film_id_film` INT NOT NULL,
  PRIMARY KEY (`id_utisak`),
  INDEX `fk_Utisak_Korisnik1_idx` (`Korisnik_korisnicko_ime` ASC) ,
  INDEX `fk_Utisak_Film1_idx` (`Film_id_film` ASC) ,
  CONSTRAINT `fk_Utisak_Korisnik1`
    FOREIGN KEY (`Korisnik_korisnicko_ime`)
    REFERENCES `rzk`.`Korisnikk` (`korisnicko_ime`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Utisak_Film1`
    FOREIGN KEY (`Film_id_film`)
    REFERENCES `rzk`.`Film` (`id_film`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rzk`.`Glumac`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rzk`.`Glumac` (
  `id_glumac` INT NOT NULL AUTO_INCREMENT,
  `ime` VARCHAR(45) NOT NULL,
  `prezime` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_glumac`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rzk`.`Uloga`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rzk`.`Uloga` (
  `id_uloga` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NOT NULL,
  `Film_id_film` INT NOT NULL,
  `Glumac_id_glumac` INT NOT NULL,
  PRIMARY KEY (`id_uloga`),
  INDEX `fk_Uloga_Film1_idx` (`Film_id_film` ASC) ,
  INDEX `fk_Uloga_Glumac1_idx` (`Glumac_id_glumac` ASC) ,
  CONSTRAINT `fk_Uloga_Film1`
    FOREIGN KEY (`Film_id_film`)
    REFERENCES `rzk`.`Film` (`id_film`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Uloga_Glumac1`
    FOREIGN KEY (`Glumac_id_glumac`)
    REFERENCES `rzk`.`Glumac` (`id_glumac`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rzk`.`Slika`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rzk`.`Slika` (
  `id_slika` INT NOT NULL AUTO_INCREMENT,
  `url_slika` VARCHAR(200) NOT NULL,
  `Film_id_film` INT NOT NULL,
  `Zanimljivost_id_zanimljivost` INT NOT NULL,
  PRIMARY KEY (`id_slika`),
  INDEX `fk_Slika_Film1_idx` (`Film_id_film` ASC) ,
  INDEX `fk_Slika_Zanimljivost1_idx` (`Zanimljivost_id_zanimljivost` ASC) ,
  CONSTRAINT `fk_Slika_Film1`
    FOREIGN KEY (`Film_id_film`)
    REFERENCES `rzk`.`Film` (`id_film`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Slika_Zanimljivost1`
    FOREIGN KEY (`Zanimljivost_id_zanimljivost`)
    REFERENCES `rzk`.`Zanimljivost` (`id_zanimljivost`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rzk`.`Premijera`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rzk`.`Premijera` (
  `id_premijera` INT NOT NULL AUTO_INCREMENT,
  `datum` DATE NOT NULL,
  `grad` VARCHAR(45) NOT NULL,
  `Film_id_film` INT NOT NULL,
  PRIMARY KEY (`id_premijera`),
  INDEX `fk_Premijera_Film1_idx` (`Film_id_film` ASC) ,
  CONSTRAINT `fk_Premijera_Film1`
    FOREIGN KEY (`Film_id_film`)
    REFERENCES `rzk`.`Film` (`id_film`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rzk`.`Ocena`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rzk`.`Ocena` (
  `id_ocena` INT NOT NULL AUTO_INCREMENT,
  `broj` INT NOT NULL,
  `Film_id_film` INT NOT NULL,
  `Korisnikk_korisnicko_ime` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id_ocena`),
  INDEX `fk_Ocena_Film1_idx` (`Film_id_film` ASC) ,
  INDEX `fk_Ocena_Korisnik1_idx` (`Korisnikk_korisnicko_ime` ASC) ,
  CONSTRAINT `fk_Ocena_Film1`
    FOREIGN KEY (`Film_id_film`)
    REFERENCES `rzk`.`Film` (`id_film`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ocena_Korisnik1`
    FOREIGN KEY (`Korisnikk_korisnicko_ime`)
    REFERENCES `rzk`.`Korisnikk` (`korisnicko_ime`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
