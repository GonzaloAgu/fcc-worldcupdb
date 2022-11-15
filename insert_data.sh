#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

cat games.csv | while IFS="," read year round winner opponent winner_goals opponent_goals
do
  if [[ $year != "year" ]]
  then
    # ADD TO TEAMS
    # find teams IDs, add them if not in teams table
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")
    if [[ $WINNER_ID = '' ]]
    then
      INSERT=$($PSQL"INSERT INTO teams(name) VALUES('$winner')")
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")
    fi

    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent'")
    if [[ $OPPONENT_ID = '' ]]
    then
      INSERT=$($PSQL"INSERT INTO teams(name) VALUES('$opponent')")
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent'")
    fi

    # insert into table games
    INSERT=$($PSQL"INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($year, '$round', $WINNER_ID, $OPPONENT_ID, $winner_goals, $opponent_goals)")
  fi
done 