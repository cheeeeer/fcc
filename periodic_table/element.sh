#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --no-align --tuples-only -c"
INPUT=$1

#is there an input?
if [[ -z $INPUT ]]; then
  echo "Please provide an element as an argument."
#is it a number?
elif [[ $INPUT =~ ^[0-9]+$ ]]; then
  ELEMENT_BY_NUMBER="$($PSQL "SELECT atomic_number, name,symbol, type, atomic_mass,melting_point_celsius,boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$INPUT")"
  #is it an element number?
  if [[ -z $ELEMENT_BY_NUMBER ]]; then
    #if not, end session
    echo "I could not find that element in the database."
  else
    #if so, return info about the element
    echo "$ELEMENT_BY_NUMBER" | while IFS="|" read ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS
    do
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
    done
  fi
#is it a symbol?
elif [[ $INPUT =~ ^[A-Z][a-z]?$ ]]; then
  ELEMENT_BY_SYMBOL="$($PSQL "SELECT atomic_number, name,symbol, type, atomic_mass,melting_point_celsius,boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol='$INPUT'")"
  #is it an element symbol?
  if [[ -z $ELEMENT_BY_SYMBOL ]]; then
    #if not, end session
    echo "I could not find that element in the database."
  else
    #if so, return info about the element
    echo "$ELEMENT_BY_SYMBOL" | while IFS="|" read ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS
    do
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
    done
  fi
#is it a name?
elif [[ $INPUT =~ ^[A-Z][a-z]+ ]]; then
  ELEMENT_BY_NAME="$($PSQL "SELECT atomic_number, name,symbol, type, atomic_mass,melting_point_celsius,boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE name='$INPUT'")"
  #is it an element name?
  if [[ -z $ELEMENT_BY_NAME ]]; then
    #if not, end session
    echo "I could not find that element in the database."
  else
    #if so, return info about the element
    echo "$ELEMENT_BY_NAME" | while IFS="|" read ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS
    do
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
    done
  fi
else
  echo "I could not find that element in the database."
fi
