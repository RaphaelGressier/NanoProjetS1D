# !bin/bash/
typeset -i aide=0 description=0 archivage=0 web=0 error=0 warning=0 Cible=0
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
	if [[ -d $1 ]]
		then Cible="$1" #Detecte si la cible est un dossier
	fi
shift
done


#Execution des commmandes
if [[ $aide -eq 1 ]]
	then
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
		if [[ $description -eq 1 ]]
			then echo "Archivage des logs du $(date +%d_%m_%y) en cours"
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