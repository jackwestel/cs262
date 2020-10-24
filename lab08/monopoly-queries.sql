-- Get list of games ordered by data in time order.
SELECT *
  FROM Game
  ORDER BY time DESC;

-- Games in the last week.
SELECT *
  FROM Game
WHERE time >= CURRENT_TIMESTAMP = interval '7 days'
;

-- List of player names that aren't NULL.
SELECT * 
  FROM Player
  WHERE name IS NOT NULL
  ;

-- List of IDs for players with score larger than 2000
SELECT DISTINCT PlayerID
FROM PlayerGame
WHERE score > 2000;

-- Get all the users with gmail accounts.
SELECT *
  FROM Player
 WHERE emailAddress LIKE '%gmail%'
 ;

 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 --Multi-table--

-- Get the highest score ever recorded.
  SELECT score
    FROM Player, PlayerGame
    WHERE Player.ID = PlayerGame.PlayerID AND Player.name - 'The King'
    ORDER BY score DESC;

--Retrieve names of winners from 2006-06-28
SELECT name
 FROM Player, PlayerGame, Game
 WHERE Player.ID = PlayerGame.playerID AND PlayerGame.GameID = Game.ID AND Game.time = timestamp '2006-06-28'

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Questions

SELECT P1.nameFROM Player AS P1, Player AS P2
WHERE P1.name = P2.name
AND P1.ID < P2.ID;

--It makes sure that it doesn't display names more than once. Don't want to print the same name twice.
--If you wanted to compare one table to another. If they had the same basic structure you could feasibly get value from this.
