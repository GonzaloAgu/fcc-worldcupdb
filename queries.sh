echo $($PSQL"SELECT max(winner_goals) FROM games")

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo $($PSQL"SELECT COUNT(*) FROM games WHERE winner_goals > 2")

echo -e "\nWinner of the 2018 tournament team name:"
echo $($PSQL"SELECT name FROM games LEFT JOIN teams ON games.winner_id = teams.team_id WHERE year=2018 AND round='Final'")

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo -e "$($PSQL"SELECT DISTINCT(name) FROM games LEFT JOIN teams ON games.winner_id = teams.team_id OR games.opponent_id = teams.team_id WHERE year=2014 AND round='Eighth-Final' ORDER BY name")"

echo -e "\nList of unique winning team names in the whole data set:"
echo -e "$($PSQL"SELECT DISTINCT(name) FROM games LEFT JOIN teams ON games.winner_id = teams.team_id ORDER BY name")"

echo -e "\nYear and team name of all the champions:"
echo -e "$($PSQL"SELECT year, name FROM games LEFT JOIN teams ON games.winner_id = teams.team_id WHERE round='Final' ORDER BY year")"

echo -e "\nList of teams that start with 'Co':"
echo -e "$($PSQL"SELECT name FROM teams WHERE name LIKE 'Co%'")"
