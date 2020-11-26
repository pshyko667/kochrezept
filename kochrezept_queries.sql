-- ALLE mengeneinheiten

SELECT
  mengeneinheit_id AS ID,
  mengeneinheit_name AS 'Einheit',
  mengeneinheit_kurz AS 'Kurz'
FROM
  mengeneinheit;

-- ALLE rezepte nach kategorie

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

-- ALLE zutaten mit kategorien

SELECT
    rezept_name AS 'Rezept',
    GROUP_CONCAT(zutat_name SEPARATOR ' - ') AS 'Zutat'
FROM
    zutat,
    rezept,
    rezept_zutat,
    mengeneinheit
WHERE
    fk_rezept_id = rezept_id
    AND fk_zutat_id = zutat_id
    AND fk_mengeneinheit_id = mengeneinheit_id
   
GROUP BY
    rezept_name
;