-- INIT database

DROP DATABASE IF EXISTS kochrezepte;

CREATE DATABASE IF NOT EXISTS kochrezepte CHARACTER SET utf8 COLLATE utf8_unicode_ci;

USE kochrezepte;

-- create table rezept_kategorie - 1:n

DROP TABLE IF EXISTS rezept_kategorie;

CREATE TABLE IF NOT EXISTS rezept_kategorie (
	rezept_kategorie_id INT NOT NULL AUTO_INCREMENT,
	rezept_kategorie_name VARCHAR(50),
	rezept_kategorie_beschreibung VARCHAR(100),
	PRIMARY KEY (rezept_kategorie_id)	
);

INSERT INTO rezept_kategorie (rezept_kategorie_name, rezept_kategorie_beschreibung)
		VALUES('Frühstück', 'Alles rund ums Frühstück'), ('Vorspeisen', 'Für den kleinen Hunger'), ('Lunch', 'Ein entspanntes Mittagessen wirkt wunder'), ('Salate', 'Frisch durch den Tag'), ('Suppen', 'Zu jeder Jahreszeit eine Freude'), ('Desserts', 'Süße Träume am Tage');

-- create table rezept

DROP TABLE IF EXISTS rezept;

CREATE TABLE IF NOT EXISTS rezept (
	rezept_id INT NOT NULL AUTO_INCREMENT,
	rezept_name VARCHAR(50),
	rezept_beschreibung VARCHAR(100),
	rezept_tipp VARCHAR(200),
	rezept_portionen INT,
	fk_rezept_kategorie_id INT,
	PRIMARY KEY (rezept_id),
	FOREIGN KEY rezept (fk_rezept_kategorie_id) REFERENCES rezept_kategorie (rezept_kategorie_id)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
);

INSERT INTO rezept (rezept_name, rezept_portionen, fk_rezept_kategorie_id)
VALUES ('Giselas genialer Hefekranz', 1, 1), ('Lowcarb-Semmeln selbst gemacht', 4, 1), ('Rinderfile am Wildsaumagen', 4, 3), ('Kalte Platte', 4, 3), ('Grießbrei wie von Muttern', 4, 6), ('Waldpilz Salat', 1, 4), ('Mexikanischer Tofu-Salat', 1, 4);


-- create table rezept_zutat - n:m

DROP TABLE IF EXISTS rezept_zutat;

CREATE TABLE IF NOT EXISTS rezept_zutat (
	fk_rezept_id INT,
	fk_zutat_id INT,
	fk_mengeneinheit_id INT,
	rezept_zutat_menge INT
);

-- create table zutat_kategorie

DROP TABLE IF EXISTS zutat_kategorie;

CREATE TABLE IF NOT EXISTS zutat_kategorie (
	zutat_kategorie_id INT NOT NULL AUTO_INCREMENT,
	zutat_kategorie_name VARCHAR(50),
	zutat_kategorie_beschreibung VARCHAR(100),
	PRIMARY KEY (zutat_kategorie_id)
);

INSERT INTO zutat_kategorie (zutat_kategorie_name, zutat_kategorie_id)
VALUES('Nudeln', 1), ('Gemüse/Salate', 2), ('Fisch', 3), ('Fleisch', 4), ('Sonstiges', 5);

-- create table zutat

DROP TABLE IF EXISTS zutat;

CREATE TABLE IF NOT EXISTS zutat (
	zutat_id INT NOT NULL AUTO_INCREMENT,
	zutat_name VARCHAR(50),
	zutat_kalorien FLOAT,
	zutat_beschreibung VARCHAR(100),
	fk_zutat_kategorie_id INT,
	PRIMARY KEY (zutat_id),
	FOREIGN KEY zutat (fk_zutat_kategorie_id) REFERENCES zutat_kategorie (zutat_kategorie_id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
);

INSERT INTO zutat (zutat_name, fk_zutat_kategorie_id)
VALUES 	('Spaghetti', 1), ('Tagliatelle', 1), ('Makkaroni', 1), ('Farfalle', 1),
				('Brokkoli', 2), ('Blumenkohl', 2), ('Bärlauch', 2), ('Eichblattsalat', 2), ('Rucola', 2),
				('Seelachs', 3), ('Barsch', 3), ('Forelle', 3),
				('Schweinefleisch', 4), ('Rindfleisch', 4),
				('Butter', 5), ('Wasser', 5);

-- create table mengeneinheit

DROP TABLE IF EXISTS mengeneinheit;

CREATE TABLE IF NOT EXISTS mengeneinheit (
	mengeneinheit_id INT NOT NULL AUTO_INCREMENT,
	mengeneinheit_name VARCHAR(20),
	mengeneinheit_kurz CHAR(3),
	PRIMARY KEY (mengeneinheit_id)
);

INSERT INTO mengeneinheit (mengeneinheit_name, mengeneinheit_kurz)
VALUES('Milligramm', 'mg'), ('Gramm', 'g'), ('Kilogramm', 'kg'), ('Liter', 'L'), ('Milliliter', 'ml'), ('Esslöffel', 'EL');