#!/bin/bash

#  trilog.sh
#
#  Effectue des actions sur des logs selon l’option utilisée.
#  Permet par exemple un affichage en html ou des sauvegardes.
#
#  Created by Raphaël Gressier on 04/04/13.

VERBOSE=0
ARCHIVE=0
WEB=0
CHEMIN
ERROR=0
WARNING=0

while (( $# ))
do
    case $1 in

    "-h" | "--help")
        echo "####################################################################"
        echo "Bienvenue dans l'aide de Trilog"
        echo "####################################################################"
        more HELP.txt
        echo -e "\n"
        exit 0
        ;;
    "-v" | "-verbose")
        V=1 #Si l'utilisateur demande le mode verbose.
        shift
        ;;
    "-a | "--archive")
        shift
        ARCHIVE=1
        CHEMIN=$1
        shift
        ;;
    "-c | "--web")
        shift
        WEB=1
        CHEMIN=$1
        shift
        ;;
    "-e" | "--error")
        shift
        ERROR=1
        shift
        ;;
    "-w" | "--warning")
        shift
        WARNING=1
        shift
        ;;
    *)
    if [[ -d $1 ]]
        then
        LISTE="$LISTE $1" # Concaténation des caractères de recherche.
        shift
        else
        echo "Erreur : $1 argument inconnu!"
        exit 6
        fi
    esac
done


