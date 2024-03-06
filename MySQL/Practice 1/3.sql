-- 3. Create a database structure for worldwide cricket team. 
-- Database will contain, each player’s name, its country, it’s expertise and so on. 

CREATE DATABASE cricketWorlddb;
USE cricketWorlddb;

CREATE TABLE countries (
    country_id INT PRIMARY KEY AUTO_INCREMENT,
    country_name VARCHAR(100) NOT NULL
);

CREATE TABLE players (
    player_id INT PRIMARY KEY AUTO_INCREMENT,
    player_name VARCHAR(100) NOT NULL,
    expertise VARCHAR(100),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES countries(country_id)
);