#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

MAIN_MENU () {



  AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  if [[ -z $1 ]]; then
    echo -e "\n Welcome to the Salon! What can I do for you today?"
  else
    echo "$1"
  fi
  echo "$AVAILABLE_SERVICES" | while read SERVICE_ID SERVICE_NAME
  do
    echo "$SERVICE_ID) $(echo $SERVICE_NAME | sed 's/| //')"
  done
  read SERVICE_ID_SELECTED
  #if not a number
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]; then
    #send to main menu
    MAIN_MENU "Please type a number to select:"
  #if it is a number
  else
    #get service from id
    SERVICE_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    #if service doesn't exist
    if [[ -z $SERVICE_SELECTED ]]; then
      #send to main menu
      MAIN_MENU "That is not an option. Try again:"
    else
      #get phone number
      echo -e "\nWhat's your phone number?"
      read CUSTOMER_PHONE

      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
      if [[ -z $CUSTOMER_ID ]]; then 
        echo -e "\nWhat's your name?"
        read CUSTOMER_NAME
        ADD_NEW_CUSTOMER=$($PSQL "INSERT INTO customers (name, phone) VALUES ('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
      fi
      #time
      echo -e "\nWhat time would you like for your appointment"?
      read SERVICE_TIME
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
      SCHEDULE_SERVICE=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID , $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
        echo "I have put you down for a $(echo $SERVICE_SELECTED|sed -r 's/^ +| +$//g' ) at $(echo $SERVICE_TIME | sed -r 's/^ +| +$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ +| +$//g')."
      
    fi
  fi
}
MAIN_MENU

