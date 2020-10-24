--
-- This SQL script builds a monopoly database, deleting any pre-existing version.
--
-- @author kvlinden
-- @version Summer, 2015
--

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.

DROP TABLE IF EXISTS PlayerGameProperty;
DROP TABLE IF EXISTS PlayerGame;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Player;

-- Create the schema.
CREATE TABLE Game (
	ID integer PRIMARY KEY, 
	time timestamp
	);

CREATE TABLE Player (
	ID integer PRIMARY KEY, 
	emailAddress varchar(50) NOT NULL,
	name varchar(50)
	);

CREATE TABLE PlayerGame (
	gameID integer REFERENCES Game(ID), 
	playerID integer REFERENCES Player(ID),
	score integer,
	cash integer
	);

CREATE TABLE PlayerGameProperty (
	propTitle varchar(50),
	houseNum integer,
	hotelNum integer,
	playerID integer REFERENCES Player(ID),
	gameID integer REFERENCES Game(ID)
	);

-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON PlayerGame TO PUBLIC;
GRANT SELECT ON PlayerGameProperty TO PUBLIC;

-- Add sample records.
INSERT INTO Game VALUES (1, '2006-06-27 08:00:00');
INSERT INTO Game VALUES (2, '2006-06-28 13:20:00');
INSERT INTO Game VALUES (3, '2006-06-29 18:41:00');

INSERT INTO Player(ID, emailAddress) VALUES (1, 'me@calvin.edu');
INSERT INTO Player VALUES (2, 'king@gmail.edu', 'The King');
INSERT INTO Player VALUES (3, 'dog@gmail.edu', 'Dogbreath');

INSERT INTO PlayerGame VALUES (1, 1, 0.00);
INSERT INTO PlayerGame VALUES (1, 2, 0.00);
INSERT INTO PlayerGame VALUES (1, 3, 2350.00);
INSERT INTO PlayerGame VALUES (2, 1, 1000.00);
INSERT INTO PlayerGame VALUES (2, 2, 0.00);
INSERT INTO PlayerGame VALUES (2, 3, 500.00);
INSERT INTO PlayerGame VALUES (3, 2, 0.00);
INSERT INTO PlayerGame VALUES (3, 3, 5500.00);

INSERT INTO Game VALUES (4, '2006-09-27 08:00:00');
INSERT INTO Game VALUES (5, '2006-09-28 13:20:00');
INSERT INTO Game VALUES (6, '2006-09-29 18:41:00');

INSERT INTO Player(ID, emailAddress) VALUES (4, 'me@calvin.you');
INSERT INTO Player VALUES (5, 'queen@gmail.you', 'The Queen');
INSERT INTO Player VALUES (6, 'cat@gmail.you', 'Catbreath');

INSERT INTO PlayerGame VALUES (4, 4, 0.00, 51);
INSERT INTO PlayerGame VALUES (4, 5, 0.00, 145);
INSERT INTO PlayerGame VALUES (4, 6, 2350.00, 16134);
INSERT INTO PlayerGame VALUES (5, 4, 1000.00, 643);
INSERT INTO PlayerGame VALUES (5, 5, 0.00, 134);
INSERT INTO PlayerGame VALUES (5, 6, 500.00, 176);
INSERT INTO PlayerGame VALUES (6, 4, 0.00, 754);
INSERT INTO PlayerGame VALUES (6, 5, 5500.00, 574);

INSERT INTO PlayerGameProperty VALUES ('Boardwalk', 0, 1, 4, 4);
INSERT INTO PlayerGameProperty VALUES ('Empire', 0, 1, 4, 4);
INSERT INTO PlayerGameProperty VALUES ('Empire', 2, 0, 5, 5);

