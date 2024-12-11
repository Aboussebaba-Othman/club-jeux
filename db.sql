CREATE database jeux_club;
USE jeux_club;
CREATE TABLE MEMBRE (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pseudo VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    date_inscription DATE NOT NULL,
    
);

CREATE TABLE ABONNEMENT (
    id INT PRIMARY KEY AUTO_INCREMENT,
    type_abonnement VARCHAR(50) NOT NULL,
    date_debut DATE NOT NULL,
    date_fin DATE NOT NULL,
    membre_id int NOT NULL,
    FOREIGN KEY (membre_id ) REFERENCES  MEMBRE(id);

);

CREATE TABLE JEU (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titre VARCHAR(100) NOT NULL,
    studio_developpement VARCHAR(100),
    annee_sortie YEAR,
    genre VARCHAR(50),
    multijoueur BOOLEAN,
);

CREATE TABLE EMPRENTER (
    id int AUTO_INCREMENT PRIMARY KEY,
    membre_id INT NOT NULL,
    jeu_id INT NOT NULL,
    date_emprunt DATE NOT NULL,
    date_retour_prevue DATE,
    date_retour_reelle DATE,
    UNIQUE (membre_id, jeu_id),
    FOREIGN KEY (membre_id) REFERENCES MEMBRE(id),
    FOREIGN KEY (jeu_id) REFERENCES JEU(id)
);

CREATE TABLE TOURNOI (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom_tournoi VARCHAR(100) NOT NULL,
    date_tournoi DATE NOT NULL,
    recompenses VARCHAR(255),
    id_jeux INT NOT NULL,
    FOREIGN KEY (id_jeux) REFERENCES JEU (id)
);

CREATE TABLE PARTICIPER (
    id int AUTO_INCREMENT PRIMARY KEY,
    score INT,
    rang_final INT,
    membre_id INT ,
    tournoi_id INT ,
    FOREIGN KEY (membre_id) REFERENCES MEMBRE(id),
    FOREIGN KEY (tournoi_id) REFERENCES TOURNOI(id)
);

INSERT INTO MEMBRE (pseudo, email, date_inscription)
VALUES
('Alice', 'alice@example.com', '2023-01-15'),
('Bob', 'bob@example.com', '2023-02-20'),
('Charlie', 'charlie@example.com', '2023-03-10');

INSERT INTO ABONNEMENT (type_abonnement, date_debut, date_fin, membre_id)
VALUES
('Mensuel', '2023-01-15', '2023-02-15', 1),
('Annuel', '2023-02-20', '2024-02-20', 2),
('Mensuel', '2023-03-10', '2023-04-10', 3);

INSERT INTO JEU (titre, studio_developpement, annee_sortie, genre, multijoueur)
VALUES
('Jeu Aventure', 'Studio Alpha', 2020, 'Aventure', TRUE),
('Jeu Puzzle', 'Studio Beta', 2019, 'Puzzle', FALSE),
('Jeu Combat', 'Studio Gamma', 2021, 'Combat', TRUE);

INSERT INTO EMPRENTER (membre_id, jeu_id, date_emprunt, date_retour_prevue, date_retour_reelle)
VALUES
(1, 1, '2023-04-01', '2023-04-15', '2023-04-14'),
(2, 2, '2023-05-05', '2023-05-19', NULL),
(3, 3, '2023-06-10', '2023-06-24', '2023-06-20');

INSERT INTO TOURNOI (nom_tournoi, date_tournoi, recompenses, id_jeux)
VALUES
('Tournoi Aventure', '2023-07-15', '1000€', 1),
('Tournoi Puzzle', '2023-08-10', '500€', 2),
('Tournoi Combat', '2023-08-10', '1500€', 3);

INSERT INTO PARTICIPER (score, rang_final, membre_id, tournoi_id)
VALUES
(150, 1, 1, 1),
(120, 2, 2, 2),
(180, 1, 3, 3);


