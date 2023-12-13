--Création de la base de données
CREATE movies;
--Création des tables
CREATE TABLE utilisateurs (id INT PRIMARY KEY NOT NULL, email VARCHAR(100) NOT Null, password VARCHAR(100) NOT NULL);
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
