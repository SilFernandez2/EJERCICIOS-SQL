CREATE DATABASE  Championship_Formula1;

CREATE TABLE circuits (
  circuitId INT PRIMARY KEY AUTO_INCREMENT,  
  circuitRef VARCHAR(255) NOT NULL UNIQUE,  
  name VARCHAR(255) NOT NULL,
  location VARCHAR(255),  
  country VARCHAR(100) NOT NULL,
  lat DECIMAL(10,6),  
  lng DECIMAL(10,6),  
  alt DECIMAL(10,2),   
  url VARCHAR(255)
);
CREATE TABLE constructor_results(
  constructorResultId INT PRIMARY KEY AUTO_INCREMENT,
  raceId INT,
  constructorId INT,
  points INT,
  status VARCHAR(10)
);
CREATE TABLE constructor_standings (
   constructorResultId INT PRIMARY KEY AUTO_INCREMENT,
   raceId INT,
   constructorId INT,
   points INT,
   position INT,
   positionText VARCHAR(10),
   wins INT
);
CREATE TABLE constructor(
  constructorId INT PRIMARY KEY AUTO_INCREMENT,
  constructorRef VARCHAR(25),
  name VARCHAR(255),
  nationality VARCHAR(50),
  url VARCHAR(255)
);
CREATE TABLE driver_standings(
  driverStandingsId INT PRIMARY KEY AUTO_INCREMENT,
  raceId INT,
  driverId INT,
  points INT,
  position INT,
  positionText VARCHAR(10),
  wins INT
);
CREATE TABLE drivers(
  driverId INT PRIMARY KEY AUTO_INCREMENT,
  driverRef VARCHAR(255),
  number INT,
  code  VARCHAR(10),
  forname  VARCHAR(255),
  surname  VARCHAR(255),
  dob DATE,
  nationality CHAR,
  url VARCHAR(255)
);
CREATE TABLE lap_times(
  raceId INT PRIMARY KEY AUTO_INCREMENT,
  driverId INT,
  lap INT,
  position INT,
  time TIME(6), 
  milliseconds INT
);

CREATE TABLE pit_stops(
  raceId INT PRIMARY KEY AUTO_INCREMENT,
  driverId INT,
  stop INT,
  lap INT,
  time TIME(6),
  duration DECIMAL(5,2),
  milliseconds INT
);


CREATE TABLE qualifying(
  qualifyId INT PRIMARY KEY AUTO_INCREMENT,
  raceId INT,
  driverId INT,
  constructorId INT ,
  number INT,
  position INT,
  q1 TIME,
  q2 TIME -- NOSE SI ES TIME O VARCHAR
);
CREATE TABLE races(
  raceId INT PRIMARY KEY AUTO_INCREMENT,
  year DATE,
  round INT,
  circuitId INT ,
  name VARCHAR(255),
  date DATE,
  time TIME,
  url VARCHAR(255),
  fp1_date CHAR,
  fp1_time CHAR
);
CREATE TABLE results (
  resultId INT PRIMARY KEY AUTO_INCREMENT,
  raceId INT,
  driverId INT,
  constructorId INT,
  number INT,
  grid INT,
  position INT,
  positionText VARCHAR(10),
  positionOrder INT,
  points INT
);
CREATE TABLE seasons (
  year DATE PRIMARY KEY,
  url VARCHAR(255) NOT NULL
);
CREATE TABLE sprint_results(
  resultId INT PRIMARY KEY AUTO_INCREMENT,
  raceId INT,
  driverId INT,
  constructorId INT,
  number INT,
  grid INT,
  position INT,
  positionText VARCHAR(10),
  positionOrder INT,
  points INT
);
CREATE TABLE status (
  statusId INT PRIMARY KEY AUTO_INCREMENT,
  status VARCHAR(255) NOT NULL
);
