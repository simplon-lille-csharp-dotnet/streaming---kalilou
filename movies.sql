//Création de la base de données
CREATE movies;
//Création des tables
CREATE TABLE utilisateurs (id INT PRIMARY KEY NOT NULL, email VARCHAR(100) NOT Null, password VARCHAR(100) NOT NULL);
CREATE TABLE films (id INT PRIMARY KEY NOT NULL, titre VARCHAR(100) NOT Null, durée TIMESTAMP NOT NULL, sortie DATETIME NOT NULL);
CREATE TABLE acteurs (id INT PRIMARY KEY NOT NULL, nom VARCHAR(100) NOT Null, prenom VARCHAR(100) NOT NULL, date_de_naissance DATETIME NOT NULL);
CREATE TABLE realisateurs (id INT PRIMARY KEY NOT NULL, nom VARCHAR(100) NOT Null, prenom VARCHAR(100) NOT NULL);

