//Création de la base de données
CREATE movies;
//Création des tables
CREATE TABLE utilisateurs (id INT PRIMARY KEY NOT NULL, email VARCHAR(100) NOT Null, password VARCHAR(100) NOT NULL);
CREATE TABLE films (id INT PRIMARY KEY NOT NULL, titre VARCHAR(100) NOT Null, durée TIMESTAMP NOT NULL, sortie DATETIME NOT NULL);
CREATE TABLE acteurs (id INT PRIMARY KEY NOT NULL, nom VARCHAR(100) NOT Null, prenom VARCHAR(100) NOT NULL, date_de_naissance DATETIME NOT NULL);
CREATE TABLE realisateurs (id INT PRIMARY KEY NOT NULL, nom VARCHAR(100) NOT Null, prenom VARCHAR(100) NOT NULL);
//Création des clés étrangères
ALTER TABLE films ADD CONSTRAINT fk_realisateur FOREIGN KEY (id) REFERENCES realisateurs(id);
ALTER TABLE films ADD CONSTRAINT fk_acteurs FOREIGN KEY (id) REFERENCES acteurs(id);
//Insertion des données dans la table réalisateurs
INSERT INTO realisateurs (id, nom, prenom) VALUES
    (1, 'Nolan', 'Christopher'),
    (2, 'Zemeckis', 'Robert'),
    (3, 'Tarantino', 'Quentin'),
    (4, 'Darabont', 'Frank'),
    (5, 'Wachowski', 'Lana'),
    (6, 'Cameron', 'James'),
    (7, 'Spielberg', 'Steven'),
    (8, 'Coppola', 'Francis Ford'),
    (9, 'Cameron', 'James')
