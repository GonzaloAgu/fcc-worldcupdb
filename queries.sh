#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
echo $($PSQL"SELECT sum(winner_goals) FROM games")

echo -e "\nTotal number of goals in all games from both teams combined:"
echo $($PSQL"SELECT sum(winner_goals) + sum(opponent_goals) FROM games")

echo -e "\nAverage number of goals in all games from the winning teams:"
echo $($PSQL"SELECT avg(winner_goals) FROM games")

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo $($PSQL"SELECT round(avg(winner_goals), 2) FROM games")

echo -e "\nAverage number of goals in all games from both teams:"
echo $($PSQL"SELECT avg(winner_goals + opponent_goals) FROM games")

echo -e "\nMost goals scored in a single game by one team:"
echo $($PSQL"SELECT max(winner_goals) FROM games")

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo $($PSQL"SELECT COUNT(*) FROM games WHERE winner_goals > 2")

echo -e "\nWinner of the 2018 tournament team name:"
echo $($PSQL"SELECT name FROM games LEFT JOIN teams ON games.winner_id = teams.team_id WHERE year=2018 AND round='Final'")

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo -e "$($PSQL"SELECT DISTINCT(name) FROM games LEFT JOIN teams ON games.winner_id = teams.team_id OR games.opponent_id = teams.team_id WHERE year=2014 AND round='Eighth-Final'")\n"

echo -e "\nList of unique winning team names in the whole data set:"
echo -e "$($PSQL"SELECT DISTINCT(name) FROM games LEFT JOIN teams ON games.winner_id = teams.team_id ORDER BY name")\n"

echo -e "\nYear and team name of all the champions:"
echo -e "$($PSQL"SELECT year, name FROM games LEFT JOIN teams ON games.winner_id = teams.team_id WHERE round='Final' ORDER BY year")"

echo -e "\nList of teams that start with 'Co':"
echo -e "$($PSQL"SELECT name FROM teams WHERE name LIKE 'Co%'")"
