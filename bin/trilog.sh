# !bin/bash/

#Detection des options
while [ $# -ge 1 ]
do
	
	case $1 in
	-h | --help)
		aide=1 #Detection de la demande d'affichage de l'aide en ligne
		;;
	-v | --verbose)
		description=1 #Detection de la demande de description des actions
		;;
	-a | --archive)
		archivage=1 #Detection de la demande d'archivage des logs du jours
		;;
	-c | --web)
		web=1 #Detection de la demande de création de l'arbo WEB
		;;
	-e | --error) #Detection de la d'affichage des erreur
		error=1
		;;
	-w | --warning) # Detection de la demande d'affichage des alertes
		warning=1
		;;
	esac
	if [[ -d $1 ]] || [[ -f $1 ]]
		then Cible="$1" #Detecte si la cible est un fichier ou un dossier
	fi
shift
done


#Execution des commmandes
if [[ $aide -eq 1 ]]
	then
	if [[ $description -eq 1 ]]
			then echo "Affichage de l'aide en ligne"
	fi
	cat ~/S1D/ASR3/NanoProjet/Projet/bin/HELP.txt
	exit 0
fi
if [[ $error -eq 1 ]]
	then 
		if [[ $description -eq 1 ]]
			then echo "Affichage des erreurs du jours"
		fi
		grep -r ERROR $Cible | more
fi
if [[ $warning -eq 1 ]]
	then 
		if [[ $description -eq 1 ]]
			then echo "Affichage des alertes du jours"
		fi
		grep -r WARNING $Cible | more
fi
if [[ $archivage -eq 1 ]]
	then
		datejours=date +%d_%m_%y
		if [[ $description -eq 1 ]]
			then echo "Archivage des logs du $datejours en cours"
		fi
		cd ~/Projet/archive
		tar zcvf $(date +%d_%m_%y).tar.gz $Cible
fi
if [[ $web -eq 1 ]]
	then
		if [[ $descritpion -eq 1 ]]
			then echo "Création de l'arborescence web de $Cible"
		fi
		cp ~/Projet/web
fi