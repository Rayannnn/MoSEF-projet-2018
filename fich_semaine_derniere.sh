#!/bin/bash
jour=$(date +%d)
mois=$(date +%B)
an=$(date +%Y)
echo "Bienvenue $USERNAME, nous sommes le $jour $mois $an."
read -p "Quel répertoire vous interesse aujourd'hui ? : " repo
echo $repo:"
ls -la $repo

