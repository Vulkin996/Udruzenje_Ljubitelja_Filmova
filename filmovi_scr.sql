-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Korisnik`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Korisnik` (
  `korisnicko_ime` INT NOT NULL AUTO_INCREMENT,
  `sifra` VARCHAR(45) NOT NULL,
  `ime` VARCHAR(45) NOT NULL,
  `prezime` VARCHAR(45) NOT NULL,
  `datum_rodjenja` DATE NOT NULL,
  PRIMARY KEY (`korisnicko_ime`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Kategorija`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Kategorija` (
  `id_kategorija` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_kategorija`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Film` (
  `id_film` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(100) NOT NULL,
  `trajanje` VARCHAR(45) NOT NULL,
  `zanr` VARCHAR(45) NOT NULL,
  `opis` VARCHAR(200) NOT NULL,
  `trailer` VARCHAR(45) NOT NULL,
  `Kategorija_id_kategorija` INT NOT NULL,
  `Korisnik_korisnicko_ime` INT NOT NULL,
  PRIMARY KEY (`id_film`),
  INDEX `fk_Film_Kategorija1_idx` (`Kategorija_id_kategorija` ASC) ,
  INDEX `fk_Film_Korisnik1_idx` (`Korisnik_korisnicko_ime` ASC) ,
  CONSTRAINT `fk_Film_Kategorija1`
    FOREIGN KEY (`Kategorija_id_kategorija`)
    REFERENCES `mydb`.`Kategorija` (`id_kategorija`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Film_Korisnik1`
    FOREIGN KEY (`Korisnik_korisnicko_ime`)
    REFERENCES `mydb`.`Korisnik` (`korisnicko_ime`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Zanimljivost`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Zanimljivost` (
  `id_zanimljivost` INT NOT NULL AUTO_INCREMENT,
  `naslov` VARCHAR(100) NOT NULL,
  `tekst` LONGTEXT NOT NULL,
  `slika` BLOB NULL,
  `video` VARCHAR(45) NULL,
  `Korisnik_korisnicko_ime` INT NOT NULL,
  PRIMARY KEY (`id_zanimljivost`),
  INDEX `fk_Zanimljivost_Korisnik1_idx` (`Korisnik_korisnicko_ime` ASC) ,
  CONSTRAINT `fk_Zanimljivost_Korisnik1`
    FOREIGN KEY (`Korisnik_korisnicko_ime`)
    REFERENCES `mydb`.`Korisnik` (`korisnicko_ime`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tema` (
  `id_tema` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NOT NULL,
  `Korisnik_korisnicko_ime` INT NOT NULL,
  PRIMARY KEY (`id_tema`),
  INDEX `fk_Tema_Korisnik1_idx` (`Korisnik_korisnicko_ime` ASC) ,
  CONSTRAINT `fk_Tema_Korisnik1`
    FOREIGN KEY (`Korisnik_korisnicko_ime`)
    REFERENCES `mydb`.`Korisnik` (`korisnicko_ime`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Odgovor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Odgovor` (
  `id_odgovor` INT NOT NULL AUTO_INCREMENT,
  `Korisnik_korisnicko_ime` INT NOT NULL,
  `Tema_id_tema` INT NOT NULL,
  `Tema_Korisnik_korisnicko_ime` INT NOT NULL,
  `Odgovor_id_odgovor` INT NOT NULL,
  PRIMARY KEY (`id_odgovor`),
  INDEX `fk_Odgovor_Korisnik1_idx` (`Korisnik_korisnicko_ime` ASC) ,
  INDEX `fk_Odgovor_Tema1_idx` (`Tema_id_tema` ASC, `Tema_Korisnik_korisnicko_ime` ASC) ,
  INDEX `fk_Odgovor_Odgovor1_idx` (`Odgovor_id_odgovor` ASC) ,
  CONSTRAINT `fk_Odgovor_Korisnik1`
    FOREIGN KEY (`Korisnik_korisnicko_ime`)
    REFERENCES `mydb`.`Korisnik` (`korisnicko_ime`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Odgovor_Tema1`
    FOREIGN KEY (`Tema_id_tema`)
    REFERENCES `mydb`.`Tema` (`id_tema`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Odgovor_Odgovor1`
    FOREIGN KEY (`Odgovor_id_odgovor`)
    REFERENCES `mydb`.`Odgovor` (`id_odgovor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Utisak`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Utisak` (
  `id_utisak` INT NOT NULL AUTO_INCREMENT,
  `opis` VARCHAR(200) NOT NULL,
  `Korisnik_korisnicko_ime` INT NOT NULL,
  `Film_id_film` INT NOT NULL,
  PRIMARY KEY (`id_utisak`),
  INDEX `fk_Utisak_Korisnik1_idx` (`Korisnik_korisnicko_ime` ASC) ,
  INDEX `fk_Utisak_Film1_idx` (`Film_id_film` ASC) ,
  CONSTRAINT `fk_Utisak_Korisnik1`
    FOREIGN KEY (`Korisnik_korisnicko_ime`)
    REFERENCES `mydb`.`Korisnik` (`korisnicko_ime`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Utisak_Film1`
    FOREIGN KEY (`Film_id_film`)
    REFERENCES `mydb`.`Film` (`id_film`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Glumac`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Glumac` (
  `id_glumac` INT NOT NULL AUTO_INCREMENT,
  `ime` VARCHAR(45) NOT NULL,
  `prezime` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_glumac`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Uloga`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Uloga` (
  `id_uloga` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NOT NULL,
  `Film_id_film` INT NOT NULL,
  `Glumac_id_glumac` INT NOT NULL,
  PRIMARY KEY (`id_uloga`),
  INDEX `fk_Uloga_Film1_idx` (`Film_id_film` ASC) ,
  INDEX `fk_Uloga_Glumac1_idx` (`Glumac_id_glumac` ASC) ,
  CONSTRAINT `fk_Uloga_Film1`
    FOREIGN KEY (`Film_id_film`)
    REFERENCES `mydb`.`Film` (`id_film`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Uloga_Glumac1`
    FOREIGN KEY (`Glumac_id_glumac`)
    REFERENCES `mydb`.`Glumac` (`id_glumac`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Slika`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Slika` (
  `id_slika` INT NOT NULL AUTO_INCREMENT,
  `url_slika` VARCHAR(200) NOT NULL,
  `Film_id_film` INT NOT NULL,
  `Zanimljivost_id_zanimljivost` INT NOT NULL,
  PRIMARY KEY (`id_slika`),
  INDEX `fk_Slika_Film1_idx` (`Film_id_film` ASC) ,
  INDEX `fk_Slika_Zanimljivost1_idx` (`Zanimljivost_id_zanimljivost` ASC) ,
  CONSTRAINT `fk_Slika_Film1`
    FOREIGN KEY (`Film_id_film`)
    REFERENCES `mydb`.`Film` (`id_film`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Slika_Zanimljivost1`
    FOREIGN KEY (`Zanimljivost_id_zanimljivost`)
    REFERENCES `mydb`.`Zanimljivost` (`id_zanimljivost`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Premijera`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Premijera` (
  `id_premijera` INT NOT NULL AUTO_INCREMENT,
  `datum` DATE NOT NULL,
  `grad` VARCHAR(45) NOT NULL,
  `Film_id_film` INT NOT NULL,
  PRIMARY KEY (`id_premijera`),
  INDEX `fk_Premijera_Film1_idx` (`Film_id_film` ASC) ,
  CONSTRAINT `fk_Premijera_Film1`
    FOREIGN KEY (`Film_id_film`)
    REFERENCES `mydb`.`Film` (`id_film`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ocena`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ocena` (
  `id_ocena` INT NOT NULL,
  `broj` INT NOT NULL,
  `Film_id_film` INT NOT NULL,
  `Korisnik_korisnicko_ime` INT NOT NULL,
  PRIMARY KEY (`id_ocena`),
  INDEX `fk_Ocena_Film1_idx` (`Film_id_film` ASC) ,
  INDEX `fk_Ocena_Korisnik1_idx` (`Korisnik_korisnicko_ime` ASC) ,
  CONSTRAINT `fk_Ocena_Film1`
    FOREIGN KEY (`Film_id_film`)
    REFERENCES `mydb`.`Film` (`id_film`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ocena_Korisnik1`
    FOREIGN KEY (`Korisnik_korisnicko_ime`)
    REFERENCES `mydb`.`Korisnik` (`korisnicko_ime`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
