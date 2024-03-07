CREATE DATABASE Queries2_2;

USE Queries2_2;


-- ----------- CASE 1 -------------------------------------------------------
CREATE TABLE activity (
    player_id INT NOT NULL,
    device_id INT NOT NULL,
    event_date DATE NOT NULL,
    games_played INT NOT NULL,
    PRIMARY KEY (player_id, event_date)
);

INSERT INTO activity (player_id, device_id, event_date, games_played) VALUES
(1, 2, '2016-03-01', 5),
(1, 2, '2016-05-02', 6),
(2, 3, '2017-06-25', 1),
(3, 1, '2016-03-02', 0),
(3, 4, '2018-07-03', 5);

SELECT * FROM activity;

-- QUESTION 1
-- Write an SQL query to report the first login date for each player. Return the result table in any order.
SELECT player_id, MIN(event_date) AS first_login FROM activity GROUP BY player_id;

-- QUESTION 2
-- Write an SQL query to report the device that is first logged in for each player. Return the result table in any order.
SELECT player_id, MIN(device_id) AS device_id FROM activity GROUP BY player_id;

-- QUESTION 3
-- Write an SQL query to report for each player and date, how many games played so far by the player.
-- That is, the total number of games played by the player until that date. Check the example for clarity.
-- Return the result table in any order.
SELECT 
    A.player_id,
    A.event_date,
    (SELECT SUM(B.games_played)
        FROM activity B
        WHERE A.player_id = B.player_id AND B.event_date <= A.event_date) 
		AS games_played_so_far
FROM activity A;




