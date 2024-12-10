CREATE database club_jeux;
USE club_jeux;
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
    membre_id int ,
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
    id int AUTO_INCREMENT ,
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
    recompenses VARCHAR(255)
);

CREATE TABLE PARTICIPER (
    membre_id INT PRIMARY KEY,
    tournoi_id INT PRIMARY key,
    score INT,
    rang_final INT,
    FOREIGN KEY (membre_id) REFERENCES MEMBRE(id),
    FOREIGN KEY (tournoi_id) REFERENCES TOURNOI(id)
);

INSERT INTO MEMBRE (pseudo, email, date_inscription)
VALUES
('othman', 'othman@example.com', '2023-05-01'),
('khalid', 'khalid@example.com', '2023-06-15'),
('adnan', 'adnan@example.com', '2023-07-20');

INSERT INTO ABONNEMENT (type_abonnement, date_debut, date_fin)
VALUES
('Mensuel', '2023-01-01', '2023-01-31'),
('Annuel', '2023-01-01', '2023-12-31'),
('Trimestriel', '2023-04-01', '2023-06-30');

INSERT INTO JEU (titre, studio_developpement, annee_sortie, genre, multijoueur)
VALUES
('Jeu d\'aventure', 'Studio Alpha', 2022, 'Aventure', TRUE),
('Course rapide', 'Beta Games', 2021, 'Course', TRUE),
('Puzzle Master', 'Gamma Studios', 2020, 'Puzzle', FALSE);

