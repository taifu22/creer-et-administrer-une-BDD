CREATE TABLE users (
  id INT(11) NOT NULL AUTO_INCREMENT,
  firstName VARCHAR(20),
  lastName VARCHAR(20),
  email VARCHAR(254) NOT NULL UNIQUE,
  pseudo VARCHAR(20),
  password VARCHAR(60),
  PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB;
  
CREATE TABLE administrator (
  id INT(11) AUTO_INCREMENT NOT NULL, 
  user_id INT(11),
  FOREIGN KEY(user_id) REFERENCES users(id),
  PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB;
  
CREATE TABLE cinema (
  id INT(11) AUTO_INCREMENT NOT NULL, 
  name VARCHAR(20) NOT NULL, 
  phone INT NOT NULL, 
  address VARCHAR(100) NOT NULL, 
  zipcode INT NOT NULL, 
  city VARCHAR(20) NOT NULL, 
  admin_id INT(11),
  FOREIGN KEY(admin_id) REFERENCES administrator(id),
  PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB;
  
CREATE TABLE customers (
  id INT(11) AUTO_INCREMENT NOT NULL, 
  type_customer VARCHAR(50) NOT NULL, 
  price_ticket NUMERIC(10, 2) NOT NULL, 
  user_id INT(11),
  FOREIGN KEY(user_id) REFERENCES users(id),
  PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB;
  
CREATE TABLE genre (
  id INT AUTO_INCREMENT NOT NULL, 
  libelle VARCHAR(20) NOT NULL, 
  PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB;
  
CREATE TABLE movieRooms (
  id INT(11) AUTO_INCREMENT NOT NULL, 
  number_rooms INT NOT NULL, 
  number_places INT NOT NULL, 
  cinema_id INT(11) NOT NULL,
  FOREIGN KEY(cinema_id) REFERENCES cinema(id),
  PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB;
  
CREATE TABLE movies (
  id INT(11) AUTO_INCREMENT NOT NULL, 
  name VARCHAR(200) NOT NULL, 
  directed_by VARCHAR(200) NOT NULL, 
  projection_id INT(11),
  FOREIGN KEY(projection_id) REFERENCES projections(id),
  genre_id INT(11),
  FOREIGN KEY(genre_id) REFERENCES genre(id),
  PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB;
  
CREATE TABLE projections (
  id INT(11) AUTO_INCREMENT NOT NULL, 
  projection_time DATETIME NOT NULL, 
  movieRoom_id INT(11),
  FOREIGN KEY(movieRoom_id) REFERENCES movieRooms(id),
  PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB;
  
CREATE TABLE reservation (
  id INT(11) AUTO_INCREMENT NOT NULL, 
  date_reservation DATETIME NOT NULL, 
  type_payment VARCHAR(20) NOT NULL, 
  date_payment DATETIME NOT NULL, 
  customer_id INT(11),
  FOREIGN KEY(customer_id) REFERENCES customers(id),
  projection_id INT(11),
  FOREIGN KEY(projection_id) REFERENCES projections(id),
  PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB;
  
  
INSERT INTO users(firstname, lastname, pseudo, password)
VALUES ('John', 'Doe', 'john74', '$2y$10$95CB2JSatsLn59L.7tleieti63hJsWB79.sVzsXkznmP3EYIYMZFK' );
INSERT INTO users(firstname, lastname, pseudo, password)
VALUES ('John1', 'Doe1', 'john85', '$2y$10$95CB2JSatsLn59L.7tleieti63hJsWB79.sVzsXkznmP3EYIYMZFK' );
INSERT INTO users(firstname, lastname, pseudo, password)
VALUES ('John2', 'Doe2', 'john75', '$2y$10$95CB2JSatsLn59L.7tleieti63hJsWB79.sVzsXkznmP3EYIYMZFK' );
INSERT INTO users(firstname, lastname, email, pseudo, password)
VALUES ('Taoufik', 'Chahouat', 'Taoufik@email.com','taoufik90', '$2y$58$989B2JSatsLn59L.7tju5eti63hJsWB79.sVzsXkznmP3EYIYMZFK');

INSERT INTO administrator(user_id) VALUES (4);

INSERT INTO customers(type_customer, price_ticket, user_id) VALUES ('plein tarif', '9.20', 1);
INSERT INTO customers(type_customer, price_ticket, user_id) VALUES ('etudiant', '7.60', 2);
INSERT INTO customers(type_customer, price_ticket, user_id) VALUES ('moins 14 ans', '5.90', 3);

INSERT INTO cinema(name, phone, address, zipcode, city, admin_id)
VALUES ('cineplex', '0358964587', '56 rue gambetta', '59000', 'Lille', 1);

INSERT INTO movierooms(number_rooms, number_places, cinema_id) 
VALUES (10, 200, 2), (20, 200, 2), (30, 200, 2);

INSERT INTO genre(libelle) VALUE ('action');
INSERT INTO genre(libelle) VALUE ('thriller');
INSERT INTO genre(libelle) VALUE ('adventure');
INSERT INTO genre(libelle) VALUE ('drama');

INSERT INTO movies(name, directed_by, projection_id, genre_id)
VALUES ('taken', 'Pierre Morel', 2, 1), ('fractured', 'Brad Anderson', 5, 2), ('Jungle cruise', 'Jaume Collet-Sierra', 4, 3), ('brothers', 'Jim Sherid', 3, 4);

INSERT INTO projections(projection_time, movieRoom_id)
VALUES ('2022-07-27 10:30:00', 3), ('2022-08-25 10:30:00', 4), ('2022-07-28 10:30:00', 5), ('2022-07-27 10:30:00', 6);

INSERT INTO reservation(date_reservation, type_payment, date_payment, customer_id, projection_id)
VALUES ('2022-06-25 10:25:00', 'en ligne', '2022-06-25 10:30:00', 1, 2),
       ('2022-05-24 10:15:00', 'en ligne', '2022-06-25 10:20:00', 2, 3),
	   ('2022-04-20 09:22:00', 'sur place', '2022-07-28 10:00:00', 1, 4),
	   ('2022-05-12 10:29:00', 'sur place', '2022-07-27 10:15:00', 3, 5);