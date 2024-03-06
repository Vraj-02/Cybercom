CREATE DATABASE indexEmaildb;
USE indexEmaildb;

CREATE TABLE Users (
    id INT PRIMARY KEY,
    email VARCHAR(255)
);

CREATE INDEX idx_email ON Users(email);
