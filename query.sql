-- Requêtes de base
SELECT pseudo, email, date_inscription
FROM MEMBRE;

SELECT titre, genre, studio_developpement
FROM JEU;

SELECT *
FROM TOURNOI
WHERE nom_tournoi = 'Tournoi Puzzle';

SELECT MEMBRE.pseudo, JEU.titre
FROM EMPRENTER
JOIN MEMBRE ON EMPRENTER.membre_id = MEMBRE.id
JOIN JEU ON EMPRENTER.jeu_id = JEU.id
WHERE EMPRENTER.date_retour_reelle IS NULL;

-- Requêtes avec Jointures

SELECT MEMBRE.pseudo, TOURNOI.nom_tournoi, PARTICIPER.rang_final
FROM PARTICIPER
JOIN MEMBRE ON PARTICIPER.membre_id = MEMBRE.id
JOIN TOURNOI ON PARTICIPER.tournoi_id = TOURNOI.id;


SELECT MEMBRE.pseudo, ABONNEMENT.type_abonnement
FROM ABONNEMENT
JOIN MEMBRE ON ABONNEMENT.membre_id = MEMBRE.id
WHERE ABONNEMENT.type_abonnement = 'Annuel';


SELECT JEU.titre, JEU.studio_developpement
FROM EMPRENTER
JOIN MEMBRE ON EMPRENTER.membre_id = MEMBRE.id
JOIN JEU ON EMPRENTER.jeu_id = JEU.id
WHERE MEMBRE.pseudo = 'Charlie';


SELECT MEMBRE.pseudo, JEU.titre, JEU.studio_developpement
FROM EMPRENTER
JOIN MEMBRE ON EMPRENTER.membre_id = MEMBRE.id
JOIN JEU ON EMPRENTER.jeu_id = JEU.id;


SELECT MEMBRE.pseudo, ABONNEMENT.type_abonnement
FROM MEMBRE
JOIN ABONNEMENT ON MEMBRE.id = ABONNEMENT.membre_id;

-- Requêtes avec Agrégation

SELECT genre, COUNT(*) AS total_jeux
FROM JEU
GROUP BY genre;


SELECT TOURNOI.nom_tournoi, COUNT(PARTICIPER.id) AS nombre_participants
FROM PARTICIPER
JOIN TOURNOI ON PARTICIPER.tournoi_id = TOURNOI.id
GROUP BY TOURNOI.nom_tournoi
ORDER BY nombre_participants DESC;


SELECT MEMBRE.pseudo, COUNT(EMPRENTER.id) AS nombre_emprunts
FROM EMPRENTER
JOIN MEMBRE ON EMPRENTER.membre_id = MEMBRE.id
GROUP BY MEMBRE.pseudo;

-- Requêtes avec Filtres et Tri


SELECT titre
FROM JEU
WHERE annee_sortie > 2020
ORDER BY titre ASC;


SELECT MEMBRE.pseudo
FROM EMPRENTER
JOIN MEMBRE ON EMPRENTER.membre_id = MEMBRE.id
WHERE EMPRENTER.date_retour_reelle IS NULL;


SELECT nom_tournoi, date_tournoi
FROM TOURNOI
WHERE date_tournoi BETWEEN '2023-08-10' AND '2023-08-16';



