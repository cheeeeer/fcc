#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

#truncate for fresh insert
echo "$($PSQL "TRUNCATE games, teams")"

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  #do not add the heading to the table
  if [[ $YEAR != "year" ]]; then
    # check if team already exists
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    if [[ -z $OPPONENT_ID ]]; then
      #if not, we gotta assign it
      echo -e "\nTEAM_ID not found for TEAM: $OPPONENT. Inserting now."
      INSERT_OPPONENT_TEAM=$($PSQL "INSERT INTO teams (name) VALUES('$OPPONENT')")
      if [[ $INSERT_OPPONENT_TEAM == "INSERT 0 1" ]]; then
        OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
        echo -e "\nSuccess! TEAM: $OPPONENT added with TEAM_ID of $OPPONENT_ID"
      fi
    fi
    #check if winner already exists
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    if [[ -z $WINNER_ID  ]]; then
      #if not, assign it
      echo -e "\nTEAM_ID not found for TEAM: $WINNER. Inserting now."
      INSERT_WINNER_TEAM=$($PSQL "INSERT INTO teams (name) VALUES('$WINNER')")
      if [[ $INSERT_WINNER_TEAM == 'INSERT 0 1' ]]; then
        WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
        echo -e "\nSuccess! TEAM: $WINNER added with TEAM_ID of $WINNER_ID"
      fi
    fi
    LOG_GAME=$($PSQL "INSERT INTO games (year,round,winner_id,opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', '$WINNER_ID','$OPPONENT_ID',$WINNER_GOALS,$OPPONENT_GOALS)")
    if [[ $LOG_GAME == "INSERT 0 1" ]]; then
      echo -e "\nAdded GAME: $YEAR $ROUND: WINNER WAS $WINNER ($WINNER_ID) WITH $WINNER_GOALS GOALS AGAINST $OPPONENT ($OPPONENT_ID) WITH $OPPONENT_GOALS GOAL"
    fi
    

  fi
done
    #fixes high ids
    echo "$($PSQL "ALTER SEQUENCE teams_team_id_seq RESTART WITH 1")"
    echo "$($PSQL "ALTER SEQUENCE games_game_id_seq RESTART WITH 1")"

