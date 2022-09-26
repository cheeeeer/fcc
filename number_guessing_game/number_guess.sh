#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

USER_INFO () {
echo "Enter your username:"
read USERNAME
USER_DATA=$($PSQL "SELECT username, games_played, best_game FROM users WHERE username='$USERNAME'")
if [[ -z $USER_DATA ]]; then
  CREATE_USER=$($PSQL "INSERT INTO users (username) VALUES('$USERNAME')")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi
echo "Guess the secret number between 1 and 1000:"
NUMBER_GAME "$USERNAME"
}

NUMBER_GAME () {
  COMPLETE="false"
  USERNAME="$1"
  GUESSES=0
  RANDOM_NUMBER="$(($RANDOM % 1001))"
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'")

  while [ $COMPLETE == "false" ]
  do
    read GUESS
    if [[ ! $GUESS =~ ^[0-9]+$ ]]; then
      echo "That is not an integer, guess again:"
    elif [[ $GUESS > $RANDOM_NUMBER ]]; then
      echo "It's lower than that, guess again:"
      GUESSES=$((GUESSES+1))
    elif [[ $GUESS < $RANDOM_NUMBER ]]; then
      echo "It's higher than that, guess again:"
      GUESSES=$((GUESSES+1))
    elif [[ $GUESS == $RANDOM_NUMBER ]]; then
      GUESSES=$((GUESSES+1))
      COMPLETE="true"
    fi    
  done
  if [[ $COMPLETE == "true" ]]; then
    GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME'")
    UPDATED_GAMES_PLAYED=$((GAMES_PLAYED+1))
    UPDATE_GAMES_PLAYED=$($PSQL "UPDATE users SET games_played=$UPDATED_GAMES_PLAYED WHERE username='$USERNAME'")
  if [[ $GUESSES -lt $BEST_GAME ]]; then
    UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game=$GUESSES WHERE username='$USERNAME'")
  fi
    echo "You guessed it in $GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
  fi
}

USER_INFO
