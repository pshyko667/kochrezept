-- MENGENEINHEITEN

SELECT
  mengeneinheit_id AS ID,
  mengeneinheit_name AS 'Einheit',
  mengeneinheit_kurz AS 'Kurz'
FROM
  mengeneinheit;

-- REZEPTE nach KATEGORIE

SELECT
  rezept_id AS 'ID',
  rezept_name AS 'Rezeptname',
  rezept_kategorie_name AS 'Kategorie'
FROM
  rezept,
  rezept_kategorie
WHERE
  fk_rezept_kategorie_id = rezept_kategorie_id
;

-- REZEPTE mit ZUTATEN

SELECT
    rezept_name AS 'Rezept',
    GROUP_CONCAT(zutat_name SEPARATOR ' - ') AS 'Zutat'
FROM
    zutat,
    rezept,
    rezept_zutat
WHERE
    fk_rezept_id = rezept_id
    AND fk_zutat_id = zutat_id
GROUP BY
    rezept_name
;

-- REZEPTE nach KATEGORIE mit PORTIONEN und ZUTATEN

SELECT
    rezept_name AS 'Rezept',
    zutat_name AS 'Zutat',
    rezept_zutat_menge AS 'Menge',
    mengeneinheit_kurz AS 'Einheit'
FROM
    zutat,
    rezept,
    rezept_zutat,
    mengeneinheit
WHERE
    fk_rezept_id = rezept_id
    AND fk_zutat_id = zutat_id
    AND fk_mengeneinheit_id = mengeneinheit_id
    AND rezept_id  = 1
;

-- 

SELECT
  rezept_kategorie_name 'Rezept-Typ',
  rezept_name AS 'Rezept',
  rezept_beschreibung AS 'Beschreibung',
  rezept_portionen AS 'Portionen',
  GROUP_CONCAT(zutat_name SEPARATOR ' - ') AS Zutaten
FROM
  zutat,
  zutat_kategorie,
  rezept,
  rezept_zutat,
  rezept_kategorie
WHERE
  fk_rezept_id = rezept_id
  AND fk_zutat_id = zutat_id
  AND fk_zutat_kategorie_id
  AND fk_rezept_kategorie_id = rezept_kategorie_id
  AND fk_zutat_kategorie_id = zutat_kategorie_id
GROUP BY
  rezept_kategorie_name,
  rezept_name,
  rezept_beschreibung,
  rezept_portionen
;

--












