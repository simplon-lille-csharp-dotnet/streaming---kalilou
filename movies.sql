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

-- Création des tables jointes
CREATE TABLE performances (
    role_id INT PRIMARY KEY AUTO_INCREMENT,
    acteur_id INT,
    film_id INT,
    role_principal BOOL,
    role VARCHAR(100) NOT NULL,
    FOREIGN KEY (acteur_id) REFERENCES acteurs(acteur_id),
    FOREIGN KEY (film_id) REFERENCES films(id)
);

CREATE TABLE realisation (
    film_realisateur_id INT PRIMARY KEY AUTO_INCREMENT,
    realisateur_id INT,
    film_id INT,
    FOREIGN KEY (realisateur_id) REFERENCES realisateurs(realisateur_id),
    FOREIGN KEY (film_id) REFERENCES films(id)
);

CREATE TABLE favoris_utilisateurs (
    favori_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    film_id INT,
    FOREIGN KEY (user_id) REFERENCES utilisateurs(user_id),
    FOREIGN KEY (film_id) REFERENCES films(id)
);

