--Création de la base de données
CREATE movies;

--Création des tables
CREATE TABLE utilisateurs (user_id INT PRIMARY KEY NOT NULL, email VARCHAR(100) NOT Null, password VARCHAR(100) NOT NULL);
CREATE TABLE films (id INT PRIMARY KEY NOT NULL, titre VARCHAR(100) NOT Null, duree INT NOT NULL, annee INT NOT NULL);
CREATE TABLE acteurs (acteur_id INT PRIMARY KEY NOT NULL, nom VARCHAR(100) NOT Null, prenom VARCHAR(100) NOT NULL, date_de_naissance DATETIME NOT NULL);
CREATE TABLE realisateurs (realisateur_id INT PRIMARY KEY NOT NULL, nom VARCHAR(100) NOT Null, prenom VARCHAR(100) NOT NULL);

--Création des clés étrangères
ALTER TABLE Films ADD COLUMN acteur_id INT
ALTER TABLE Films ADD COLUMN realisateur_id INT
ALTER TABLE Films ADD CONSTRAINT fk_acteur FOREIGN KEY (acteur_id) REFERENCES Acteurs(acteur_id)
ALTER TABLE films ADD CONSTRAINT fk_realisateur FOREIGN KEY (realisateur_id) REFERENCES realisateurs(realisateur_id);

--Insertion des réalisateurs
INSERT INTO Réalisateurs (réalisateur_id, nom, prénom) VALUES
    (1, 'Nolan', 'Christopher'),
    (2, 'Zemeckis', 'Robert'),
    (3, 'Tarantino', 'Quentin'),
    (4, 'Darabont', 'Frank'),
    (5, 'Wachowski', 'Lana'),
    (6, 'Cameron', 'James'),
    (7, 'Spielberg', 'Steven'),
    (8, 'Coppola', 'Francis Ford'),
    (9, 'Cameron', 'James');

--Insertion des films
INSERT INTO films (id, titre, realisateur_id, duree, annee) VALUES
    (1,'Inception', 1, 148, 2010),
    (2,'The Dark Knight', 1, 152, 2008),
    (3,'Forrest Gump', 2, 142, 1994),
    (4,'Pulp Fiction', 3, 154, 1994),
    (5,'The Shawshank Redemption', 4, 142, 1994),
    (6,'The Matrix', 5, 136, 1999),
    (7,'Titanic', 6, 195, 1997),
    (8,'Jurassic Park', 7, 127, 1993),
    (9,'The Godfather', 8, 175, 1972),
    (10,'Avatar', 9, 162, 2009);

-- Mise à jour des données de la colonne acteur_id
UPDATE films     SET acteur_id = 1     WHERE realisateur_id = 6;
UPDATE films     SET acteur_id = 6     WHERE realisateur_id = 5;
UPDATE films     SET acteur_id = 2     WHERE id = 2;
UPDATE films     SET acteur_id = 3     WHERE realisateur_id = 2;
UPDATE films     SET acteur_id = 9     WHERE realisateur_id = 8;
UPDATE films     SET acteur_id = 10     WHERE realisateur_id = 9;
UPDATE films     SET acteur_id = 8     WHERE realisateur_id = 7;
UPDATE films     SET acteur_id = 5     WHERE realisateur_id = 4;
UPDATE films     SET acteur_id = 4     WHERE realisateur_id = 3;
UPDATE films     SET acteur_id = 1     WHERE id = 1;

--Insertion des acteurs
INSERT INTO Acteurs (nom, prenom, date_de_naissance, acteur_id) VALUES
    ('DiCaprio', 'Leonardo', '1974-11-11', 1),
    ('Bale', 'Christian', '1974-01-30', 2),
    ('Hanks', 'Tom', '1956-07-09', 3),
    ('Travolta', 'John', '1954-02-18', 4),
    ('Robbins', 'Tim', '1958-10-16', 5),
    ('Reeves', 'Keanu', '1964-09-02', 6),
    ('Neill', 'Sam', '1947-09-14', 8),
    ('Brando', 'Marlon', '1924-04-03', 9),
    ('Worthington', 'Sam', '1976-08-02', 10);

--Insertion des utilisateurs
INSERT INTO Utilisateurs (user_id, email, password) VALUES
    (1, 'admin@example.com', 'motdepasse1'),  -- Admin
    (2, 'john.doe@gmail.com', 'securepassword2'),
    (3, 'alice.smith@yahoo.com', 'strongpassword3'),
    (4, 'bob.jones@hotmail.com', 'mypassword4'),
    (5, 'emily.davis@gmail.com', 'secretword5'),
    (6, 'alex.martin@yahoo.com', 'mypassword6'),
    (7, 'lisa.white@gmail.com', 'securepassword7'),
    (8, 'mike.brown@hotmail.com', 'mypassword8'),
    (9, 'sarah.jenkins@gmail.com', 'strongpassword9'),
    (10, 'chris.anderson@yahoo.com', 'mypassword10'),
    (11, 'olivia.miller@gmail.com', 'securepassword11'),
    (12, 'david.hall@hotmail.com', 'mypassword12'),
    (13, 'amy.wilson@yahoo.com', 'secretword13'),
    (14, 'ryan.evans@gmail.com', 'mypassword14'),
    (15, 'jessica.moore@yahoo.com', 'strongpassword15');

--Ajout des colonnes date_creation et et date_modification pour la table utilisateurs
    ALTER TABLE utilisateurs ADD COLUMN date_creation TIMESTAMP 
    DEFAULT CURRENT_TIMESTAMP, ADD COLUMN date_modification TIMESTAMP 
    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP

--Ajout des colonnes date_creation et et date_modification pour la table films
    ALTER TABLE films ADD COLUMN date_creation TIMESTAMP 
    DEFAULT CURRENT_TIMESTAMP, ADD COLUMN date_modification TIMESTAMP 
    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
--Ajout des colonnes date_creation et et date_modification pour la table acteurs
    ALTER TABLE acteurs ADD COLUMN date_creation TIMESTAMP 
    DEFAULT CURRENT_TIMESTAMP, ADD COLUMN date_modification TIMESTAMP 
    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
--Ajout des colonnes date_creation et et date_modification pour la table realisateurs
    ALTER TABLE realisateurs ADD COLUMN date_creation TIMESTAMP 
    DEFAULT CURRENT_TIMESTAMP, ADD COLUMN date_modification TIMESTAMP 
    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP

-- Création des tables jointes
CREATE TABLE performances (
    acteur_id INT,
    film_id INT,
    role_principal BOOL,
    role VARCHAR(100) NOT NULL,
    FOREIGN KEY (acteur_id) REFERENCES acteurs(acteur_id),
    FOREIGN KEY (film_id) REFERENCES films(id)
);

CREATE TABLE favoris_utilisateurs (
    user_id INT,
    film_id INT,
    FOREIGN KEY (user_id) REFERENCES utilisateurs(user_id),
    FOREIGN KEY (film_id) REFERENCES films(id)
);

-- Insertion des données dans la table jointe performances
INSERT INTO performances (acteur_id, film_id, role) VALUES
    (1, 1, 'Cobb');
INSERT INTO performances (acteur_id, film_id, role) VALUES
    (2, 2, 'Bruce Wayne / Batman');
    INSERT INTO performances (acteur_id, film_id, role) VALUES
    (3, 3, 'Forrest Gump');
    INSERT INTO performances (acteur_id, film_id, role) VALUES
    (4, 4, 'Vincent Vega');
    INSERT INTO performances (acteur_id, film_id, role) VALUES
    (5, 5, 'Andy Dufresne');

    UPDATE performances
    SET role_principal = true
    WHERE acteur_id = 1 ;
    
    UPDATE performances
    SET role_principal = true
    WHERE acteur_id = 2 ;
    
    UPDATE performances
    SET role_principal = true
    WHERE acteur_id = 3 ;
    
    UPDATE performances
    SET role_principal = true
    WHERE acteur_id = 4 ;
    
    UPDATE performances
    SET role_principal = true
    WHERE acteur_id = 5 ;

-- Insertion des données dans la table jointe favoris_utilisateurs
INSERT INTO favoris_utilisateurs (user_id, film_id) VALUES
    (1, 1),
    (1, 2),
    (1, 3);

INSERT INTO favoris_utilisateurs (user_id, film_id) VALUES
    (2, 4);
    
INSERT INTO favoris_utilisateurs (user_id, film_id) VALUES
    (3, 1),
    (3, 5);

-- Selectionner les titres et dates de sortie des films du plus récent au plus ancien
SELECT titre, annee FROM films ORDER BY annee DESC;

-- Selectionner les noms, prénoms et âges des acteurs/actrices de plus de 30 ans dans l'ordre alphabétique (prénom d'abord, puis nom)
SELECT nom, prenom, DATEDIFF(CURDATE(), date_de_naissance) AS age
FROM acteurs
WHERE DATEDIFF(CURDATE(), date_de_naissance) > 30
ORDER BY prenom, nom;

-- Sélectionner la liste des acteurs/actrices principaux pour un film donné
SELECT acteurs.nom, acteurs.prenom, films.titre
FROM performances
INNER JOIN acteurs ON performances.acteur_id = acteurs.acteur_id
INNER JOIN films ON performances.film_id = films.id
WHERE performances.film_id = 5 AND performances.role_principal = true;

-- Sélectionner la liste des films pour un acteur/actrice donné
SELECT films.titre, films.annee, performances.role
FROM performances
INNER JOIN acteurs ON performances.acteur_id = acteurs.acteur_id
INNER JOIN films ON performances.film_id = films.id
WHERE acteurs.nom = 'DiCaprio' AND acteurs.prenom = 'Leonardo';

-- Ajout d'un film
INSERT INTO films (id, titre, realisateur_id, duree, annee)
VALUES (11, 'Tenet', 1, 150, 2020);

-- Ajout d'un acteur/actrice
INSERT INTO acteurs (acteur_id, nom, prenom, date_de_naissance)
VALUES (11, 'Doe', 'Jane', '1990-01-01');

--Insertion de l'acteur/actrice dans la table des performances
INSERT INTO performances (acteur_id, film_id, role_principal, role)
VALUES (11, 11, false, 'Personnage secondaire');

-- Modification d'un film
UPDATE filmsvSET duree = 160 WHERE id = 11;

-- Suppression des performances associées à l'acteur
DELETE FROM performances WHERE acteur_id = 11;

-- Suppression de l'acteur
DELETE FROM acteurs WHERE acteur_id = 11;

-- Affichage des 3 derniers acteurs/actrices ajouté(e)s
SELECT *
FROM acteurs
ORDER BY date_creation DESC
LIMIT 3;
