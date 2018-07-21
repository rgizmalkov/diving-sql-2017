CREATE TABLE Planet(
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE,
  distance NUMERIC(5,2),
  galaxy INT CHECK(galaxy > 0)
);

CREATE TABLE Commander(
  id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE Flight(
  id INT PRIMARY KEY,
  planet_id INT REFERENCES Planet,
  commander_id INT REFERENCES Commander,
  start_date DATE,
  UNIQUE(commander_id, start_date)
);

SELECT COUNT(*) FROM
(SELECT * FROM Planet WHERE galaxy=2) P
FULL OUTER JOIN
(SELECT * FROM Flight) F
ON P.id = F.planet_id;

INSERT INTO Planet VALUES (1, 'OO1', 123.12, 1);
INSERT INTO Planet VALUES (2, 'OO2', 123.12, 2);
INSERT INTO Planet VALUES (3, 'OO3', 123.12, 1);
INSERT INTO Planet VALUES (4, 'OO4', 123.12, 2);
INSERT INTO Planet VALUES (5, 'OO5', 123.12, 1);
INSERT INTO Planet VALUES (6, 'OO6', 123.12, 2);
INSERT INTO Planet VALUES (7, 'OO7', 123.12, 1);
INSERT INTO Planet VALUES (8, 'OO8', 123.12, 2);
INSERT INTO Planet VALUES (9, 'OO9', 123.12, 2);
INSERT INTO Planet VALUES (0, 'OO0', 123.12, 2);

INSERT INTO Commander VALUES (0, 'John');
INSERT INTO Commander VALUES (1, 'Mitchem');
INSERT INTO Commander VALUES (2, 'Lucas');

INSERT INTO Flight VALUES (0, 1, 0, '2012-01-05');
INSERT INTO Flight VALUES (1, 3, 1, '2012-11-05');
INSERT INTO Flight VALUES (2, 5, 2, '2012-10-05');
INSERT INTO Flight VALUES (3, 7, 1, '2012-11-15');
INSERT INTO Flight VALUES (4, 2, 0, '2013-01-05');
INSERT INTO Flight VALUES (5, 2, 1, '2014-01-05');
INSERT INTO Flight VALUES (6, 2, 0, '2012-01-06');
INSERT INTO Flight VALUES (7, 9, 0, '2015-01-15');
INSERT INTO Flight VALUES (8, 8, 1, '2016-01-05');
INSERT INTO Flight VALUES (9, 9, 2, '2017-01-05');
INSERT INTO Flight VALUES (10, 0, 1, '2002-01-05');
INSERT INTO Flight VALUES (11, 6, 0, '2001-01-05');




SELECT COUNT(DISTINCT F.id)
FROM
  (SELECT * FROM Planet WHERE galaxy=2) P
LEFT JOIN
  (SELECT * FROM Flight) F
ON P.id = F.planet_id;