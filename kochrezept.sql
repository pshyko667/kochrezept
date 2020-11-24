-- INIT database

DROP DATABASE IF EXISTS kochrezept;

CREATE DATABASE kochrezept CHARACTER SET utf8 COLLATE utf8_unicode_ci;

USE kochrezept;

-- create table foto

DROP TABLE IF EXISTS foto;

CREATE TABLE IF NOT EXISTS foto (
	foto_id INT NOT NULL AUTO_INCREMENT,
	foto_titel VARCHAR(50),
	foto_beschreibung VARCHAR(100),
	foto_kategorie VARCHAR(50),
	foto_datei BLOB,
	PRIMARY KEY (foto_id)
);

-- create table rezept

DROP TABLE IF EXISTS rezept;

CREATE TABLE IF NOT EXISTS rezept (
	rezept_id INT NOT NULL AUTO_INCREMENT,
	rezept_kategorie VARCHAR(50),
	rezept_name VARCHAR(50),
	rezept_beschreibung VARCHAR(100),
	rezept_tipp VARCHAR(200),
	fk_foto_ID INT,
	PRIMARY KEY (rezept_id)
);

-- create table zutat

DROP TABLE IF EXISTS zutat;

CREATE TABLE IF NOT EXISTS zutat (
	zutat_id INT NOT NULL AUTO_INCREMENT,
	zutat_name VARCHAR(50),
	zutat_beschreibung VARCHAR(100),
	zutat_kategorie VARCHAR(50),
	fk_foto_ID INT,
	PRIMARY KEY (zutat_id)
);