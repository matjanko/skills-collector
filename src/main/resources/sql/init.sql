CREATE DATABASE IF NOT EXISTS skills_collector CHARACTER SET utf8 COLLATE utf8_polish_ci;
USE skills_collector;

DROP TABLE If EXISTS users_known_sources;
DROP TABLE If EXISTS sources_attached_skills;
DROP TABLE If EXISTS users;
DROP TABLE If EXISTS skills;
DROP TABLE If EXISTS sources;

CREATE TABLE IF NOT EXISTS users 
(
	id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(255),
	last_name VARCHAR(255),
	password VARCHAR(255) NOT NULL,
	username VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS skills
(
	id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS sources 
(
	id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
	description VARCHAR(255),
	name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS users_known_sources 
(
	user_id BIGINT(20) NOT NULL ,
	source_id BIGINT(20) NOT NULL ,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (source_id) REFERENCES sources(id)
);

CREATE TABLE IF NOT EXISTS sources_attached_skills 
(
	source_id BIGINT(20) NOT NULL ,
	skill_id BIGINT(20) NOT NULL ,
    FOREIGN KEY (skill_id) REFERENCES skills(id),
    FOREIGN KEY (source_id) REFERENCES sources(id)
);

-- Testowe umiejętności
INSERT INTO skills (name) VALUES ('Programowanie proceduralne');
INSERT INTO skills (name) VALUES ('Programowanie obiektowe');
INSERT INTO skills (name) VALUES ('Algorytmy i struktury danych');
INSERT INTO skills (name) VALUES ('Strumienie i wyrażenia lambda');
INSERT INTO skills (name) VALUES ('HTML i CSS');
INSERT INTO skills (name) VALUES ('JvaScript');
INSERT INTO skills (name) VALUES ('Servlety i JSP');
INSERT INTO skills (name) VALUES ('JPA i Hibernate');
INSERT INTO skills (name) VALUES ('Spring Framework');
INSERT INTO skills (name) VALUES ('Spring Data');
INSERT INTO skills (name) VALUES ('Spring Security');
INSERT INTO skills (name) VALUES ('Czysty kod');
INSERT INTO skills (name) VALUES ('Wzorce Projektowe');

-- Testowe źródła wiedzy i powiązania z umiejętnościami
INSERT INTO sources (name, description) VALUES ('Java. Podstawy', 'Książka opisująca podstawy języka Java');
INSERT INTO sources_attached_skills (source_id, skill_id) VALUES (1, 1);
INSERT INTO sources_attached_skills (source_id, skill_id) VALUES (1, 2);
INSERT INTO sources_attached_skills (source_id, skill_id) VALUES (1, 3);
​
INSERT INTO sources (name, description) VALUES ('Java. Programowanie funkcyjne', 'Książka omawiająca programowanie proceduralne i funkcyjne w językuja Java');
INSERT INTO sources_attached_skills (source_id, skill_id) VALUES (2, 1);
INSERT INTO sources_attached_skills (source_id, skill_id) VALUES (2, 4);
​
INSERT INTO sources (name, description) VALUES ('Java. Algorytmy. 2-edycja', 'Książka omawiająca algorytmy klasyczne bazujące na iteracji oraz programowaniu funkcyjnym');
INSERT INTO sources_attached_skills (source_id, skill_id) VALUES (3, 3);
INSERT INTO sources_attached_skills (source_id, skill_id) VALUES (3, 4);
​
INSERT INTO sources (name, description) VALUES ('Podstawy HTML', 'Kurs przygotowujący do podstaw pracy z HTML, CSS i JavaScript');
INSERT INTO sources_attached_skills (source_id, skill_id) VALUES (4, 5);
INSERT INTO sources_attached_skills (source_id, skill_id) VALUES (4, 6);
​
INSERT INTO sources (name, description) VALUES ('Servlety i JPA', 'Tutorial pokazujący tworzenie aplikacji w technologii Servletów i JPA');
INSERT INTO sources_attached_skills (source_id, skill_id) VALUES (5, 7);
INSERT INTO sources_attached_skills (source_id, skill_id) VALUES (5, 10);
​
INSERT INTO sources (name, description) VALUES ('Nowoczesne aplikacje webowe', 'Kurs omawiający tworzenie aplikacji webowych wykorzystujących technologie Servletów i framework Spring');
INSERT INTO sources_attached_skills (source_id, skill_id) VALUES (6, 7);
INSERT INTO sources_attached_skills (source_id, skill_id) VALUES (6, 8);
INSERT INTO sources_attached_skills (source_id, skill_id) VALUES (6, 9);
INSERT INTO sources_attached_skills (source_id, skill_id) VALUES (6, 10);
INSERT INTO sources_attached_skills (source_id, skill_id) VALUES (6, 11);
​
INSERT INTO sources (name, description) VALUES ('Mistrzostwo Programowania', 'Podstawy wzorców projektowych i czystego kodu');
INSERT INTO sources_attached_skills (source_id, skill_id) VALUES (7, 12);
INSERT INTO sources_attached_skills (source_id, skill_id) VALUES (7, 13);

