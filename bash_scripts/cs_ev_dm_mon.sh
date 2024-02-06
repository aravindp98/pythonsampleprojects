#!/bin/bash

command_substitution() {
    echo "################################"
    echo "Command Substitution"
    echo "################################"

    MEMORY=$(free -m | grep Mem | awk '{print $2}')

    echo "Free Memory: $MEMORY"
    echo "Exit code: $?"

    echo "$MEMORY"
}

export_variable() {
    echo "################################"
    echo "Export Variable"
    echo "################################"

    SEASON="spring"
    echo "From next month $SEASON is going to start"
}

decision_making() {
    echo "################################"
    echo "Decision Making"
    echo "################################"

    MEMORY=$1

    if [ $MEMORY -gt 1000 ]; then
        echo "There is enough free memory."
    else
        echo "Low memory warning!"
    fi
}

MEMORY=$(command_substitution)
decision_making "$MEMORY"
command_substitution
export_variable