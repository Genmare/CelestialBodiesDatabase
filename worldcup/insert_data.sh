#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

echo $($PSQL "TRUNCATE teams, games")

# Do not change code above this line. Use the PSQL variable above to query your database.

# CREATE TABLE teams(team_id SERIAL PRIMARY KEY UNIQUE, name VARCHAR(25) UNIQUE NOT NULL);
# CREATE TABLE games(
#   game_id SERIAL  PRIMARY KEY UNIQUE,
#   year INT NOT NULL,
#   round VARCHAR(25) NOT NULL,
#   winner_id INT NOT NULL,
#   opponent_id INT NOT NULL,
#   winner_goals INT NOT NULL,
#   opponent_goals INT NOT NULL);

# ALTER TABLE games ADD CONSTRAINT fk_winner FOREIGN KEY (winner_id) REFERENCES teams(team_id);

function isInserted(){
  TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$1'")
  # if [[ -z $TEAM_ID ]]
  # then
  #   echo 0
  # else
  #   echo $TEAM_ID    
  # fi
  echo "$TEAM_ID"
}

function InsertTeam(){
  INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$1')")
  if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
  then
    echo Inserted into teams, $1
  fi
}


cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT W_GOALS O_GOALS 
do
  if [[ $YEAR != "year" ]]
  then
    WIN_ID=$(isInserted "$WINNER")
    if [[ -z $WIN_ID ]]
    then
      InsertTeam "$WINNER"
      WIN_ID=$(isInserted "$WINNER")
    fi
    echo $WIN_ID

    OPP_ID=$(isInserted "$OPPONENT")
    if [[ -z $OPP_ID ]]
    then
      InsertTeam "$OPPONENT"
      OPP_ID=$(isInserted "$OPPONENT")
    fi
    echo $OPP_ID

    # Insert game
    echo winner $WINNER $WIN_ID opponent $OPPONENT $OPP_ID
    INSERT_GAMES_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) 
        VALUES($YEAR, '$ROUND', $WIN_ID, $OPP_ID, $W_GOALS, $O_GOALS)")
  fi
done