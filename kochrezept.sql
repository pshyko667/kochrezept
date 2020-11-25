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
		VALUES('Frühstück', 'Alles rund ums Frühstück'), ('Vorspeisen', 'Für den kleinen Hunger'), ('Lunch', 'Ein entspanntes Mittagessen wirkt wunder'), ('Salate', 'Frisch durch den Tag'), ('Suppen', 'Zu jeder Jahreszeit eine Freude'), ('Saucen', 'Die perfekte Beilage für einfach Alles!'), ('Desserts', 'Süße Träume am Tage'), ('Snacks/Sonstiges', 'Alles, was das Herz begehrt');

-- create table rezept

DROP TABLE IF EXISTS rezept;

CREATE TABLE IF NOT EXISTS rezept (
	rezept_id INT NOT NULL AUTO_INCREMENT,
	rezept_name VARCHAR(50),
	rezept_beschreibung VARCHAR(500),
	rezept_tipp VARCHAR(500),
	rezept_portionen INT,
	fk_rezept_kategorie_id INT,
	PRIMARY KEY (rezept_id),
	FOREIGN KEY rezept (fk_rezept_kategorie_id) REFERENCES rezept_kategorie (rezept_kategorie_id)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
);

INSERT INTO rezept (
    rezept_name,
    rezept_beschreibung,
    rezept_tipp,
    rezept_portionen,
    fk_rezept_kategorie_id
  )
VALUES(
    'Giselas genialer Hefekranz',
    -- rezept_name
    'In der Major oder Chef wird das Rezept genau so gemacht allerdings mit lauwarmer Milch und weicher Butter.',
    -- rezept_beschreibung
    'Claudia Hu`s Übernachtvariante von Fridas Hefezopf: Claudia bereitet ihn abend zu und nimmt nur 4 gr. Hefe. Lässt ihn bei Raumtemperatur übernacht gehen.',
    -- rezept_tipp
    1,
    -- rezept_portionen
    1 -- fk_rezept_kategorie_id
  ),
  (
    'Lowcarb-Semmeln selbst gemacht',
    'Leckere Brötchen müssen auch bei einer Low-Carb-Ernährung nicht fehlen: Wenn du deine Zutaten geschickt auswählst, kannst du zuhause im Handumdrehen kohlenhydratarme Brötchen backen.',
    'Achte beim Einkaufen darauf, dass du deine Lebensmittel IN Bio-Qualität kaufst. Damit tust du nicht nur dir, sondern auch deiner Umwelt etwas Gutes.',
    4,
    1
  ),
  (
    'Rinderfile am Wildsaumagen',
    'Ein hochwertiges, teures Stück Fleisch zu verarbeiten braucht etwas Mut und das passende Rezept. Letzteres liefern wir Ihnen mit unserem Rinderfilet-Rezept. Den Mut bekommen Sie von ganz alleine, denn die Zubereitung ist kein Hexenwerk!',
    'Bei unserem Rinderfilet-Rezept und IN vielen anderen Kochideen, zum Beispiel auch bei unserem Rezept für Rinderfilet mit Kräutern, ist der absolute Höhepunkt des Essens das Fleisch.' 
    4,
    3
  ),
  (
    'Schinken-Mozzarella Platte',
    'Als Vorspeise für 2, als Hauptgericht für 1 Person',
    'Dazu schmeckt natürlich italienisches Weißbrot (Ciabatta).',
    4,
    3
  ),
  (
    'Grießbrei wie von Muttern',
    'So hat ihn meine Omi gemacht und ich liebe diesen luftig lockeren Grießbrei.',
    'Dazu schmeckt Kompott nach Wahl, Zimt und Zucker oder braune Butter.',
    4,
    6
  ),
  (
    'Waldpilz Salat',
    'Pilze zum Säubern nur trocken abreiben, falls nötig kurz abbrausen und grob würfeln. Knoblauch und Schalotte schälen und fein würfeln.',
    'Pilze zum Säubern nur trocken abreiben, falls nötig kurz abbrausen und grob würfeln. Knoblauch und Schalotte schälen und fein würfeln.',
    1,
    4
  ),
  (
    'Mexikanischer Tofu-Salat',
    'Reisen erweitert den Horizont! Und diese Rezept hat meinen ganz sicher erweitert!',
    'Auch lecker & mit Bohnen ist mein Quinoa-Bohnen Salat sowie meine Nacho-Bowl mit Ananas-Salsa!',
    1,
    4
  ),
  (
    'Quinoa-Bohnen Salat',
    'Salat ist nicht nur Blätter und Gemüse mit Essig-Dressing.',
    'Salat kann so viel mehr, zum Beispiel dieser Quinoa-Bohnen Salat, der warm wie kalt lecker schmeckt!' 1,
    4
  ),
  (
    'Nacho-Bowl mit Ananas-Salsa',
    'Der perfekte Snack für jeden Spieleabend, zum Binge-Watchen oder einfach nur so',
    'Dazu benötigtest du diese Ananas-Salsa, die auch sehr lecker als Burger-Soße oder zum Grillen verwendet werden kann',
    1,
    8
  ),
  (
    'Ananas-Salsa',
    'Dein perfekter Begleiter für Nachos, Burger oder zum Grillen',
    'Egal, ob du alleine deine Lieblingssendung binge schaust oder ob du zu einem Spieleabend eingeladen hast',
    1,
    6
  ),
  (
    'Mandel-Spargel Risotto',
    'Traumhaftes Risotto mit dezentem Geschmack nach Mandel und gebratenem Spargel!',
    'Noch ist ja Spargelzeit und das alleine ist schon Grund genug, unbedingt diese Mandel-Spargel Risotto zu probieren.'
  ),
  4,
  3
  (
    'Couscous-Gemüse-Salat mit Joghurt-Minz-Dip',
    'Wie kann man einen schönen Sommer-Abend besser ausklingen lassen als mit Freunden und einem kaltem Couscous-Gemüse-Salat mit Joghurt-Minz Dip?',
    'Für den Gemüse-Couscous-Salat wird das Gemüse kurz angebraten, Pinienkerne geröstet und für eine süße note sorgen Sultaninen.'
  1,
  4
  ),
  (
    'Pfirsich-Joghurt-Schnitten mit Streuseln',
    'Es wird Frühling! Und wie könnte man den Frühling besser willkommen heißen',
    'Dazu ein einfacher Joghurt-Zitronen Teig, Pfirsiche und Himbeeren und schon sind die Pfirsich-Joghurt-Schnitten bereit',
    4,
    8
  ),
  (
    'Gebratener Spargel mit knusprigen Ofen-Kartoffeln und Sauce Hollandaise',
    'Grüner Spargel ist mein Liebling: Er ist geschmacksintensiver und viel leichter im Umgang, anbraten IN der Pfanne reicht, kochen nicht nötig.',
    'Worauf noch warten? Spargel-Zeit ist jetzt, also los!',
    1,
    3
  ),
  (
    'Linsen-Curry',
    'Eine Linsen-Curry wie für uns gemacht: Fix zubereit und super lecker, auf Wunsch auch mit einer gewissen Schärfe.',
    'Ich empfehle dazu Naturreis, aber schmeckt sicherlich auch mit Couscous oder anderen Getreiden (oder Pseudogetreiden).',
    4,
    3
  ),
  (
    'Mexikanischer Bohnensalat mit geräuchertem Tofu',
    'Reisen erweitert den Horizont! Und diese Rezept hat meinen ganz sicher erweitert!',
    'Auch lecker & mit Bohnen ist mein Quinoa-Bohnen Salat sowie meine Nacho-Bowl mit Ananas-Salsa!',
    1,
    4
  ),
  (
    'Zitronen-Mohn Muffins',
    'Muffins! Und wenn du jetzt denkst Wird aber auch Zeit…',
    'Zitrone-Mohn ist eine simple, aber auch wirklich leckere Geschmackskombi'
  ),
  4,
  8
  (
    'Mi-Nudeln mit gebratenem Tofu',
    'Schnelles Hauptgericht gesucht? Dann probier doch diesen lecker marinierten und gebraten Tofu mit Mi-Nudeln, Erbsen und Granatapfel!',
    'Da die Mi-Nudeln nur kurz IN heißes Wasser müssen, steht das Gericht IN weniger als 30 Minuten auf dem Tisch!'
  ),
  1,
  3
  (
    'Gemüse-Tofu Curry',
    'Wenn es draußen kälter wird, muss es drinnen umso wärmer werden',
    'Ich habe darauf geachtet, dass es nicht zu scharf xist, aber mehr Chili ist natürlich immer möglich. '
  ),
  1,
  3
  (
    'Karottenkuchen',
    'Karottenkuchen für Alle! Ok, eigentlich lieber nur für mich, denn wenn es um diesen Kuchen geht',
    'Damit du trotzdem auch von ihm kosten kannst, verrate ich dir hier mein Rezept.',
    1,
    8
	);


-- create table rezept_zutat - n:m

DROP TABLE IF EXISTS rezept_zutat;

CREATE TABLE IF NOT EXISTS rezept_zutat (
	fk_rezept_id INT,
	fk_zutat_id INT,
	fk_mengeneinheit_id INT,
	rezept_zutat_menge INT,
	FOREIGN KEY (fk_mengeneinheit_id) REFERENCES mengeneinheit (mengeneinheit_id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
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