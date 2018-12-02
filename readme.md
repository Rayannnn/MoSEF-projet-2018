# Projet Linux MoSEF 2018

## Récapitulatif des étapes du projet
- Cloner le repository projet en ligne de votre compte github au mien, puis l'importer en local.
- Ajouter un fichier .sh exécutable et le pousser sur le serveur distant.
- Créer une nouvelle branche et modifier le fichier dans cette branche, puis pousser les changements à distance.
- Fusionner les branches à distance puis localement.

## Méthodes

### Cloner le repository projet en ligne de votre compte github au mien, puis l'importer en local.

1. Pour forker le dépot projet-MoSEF-2018 dans mon compte **Github**, il me suffit
de cliquer sur 'fork' en haut à droite de la page. Cela me permet d'avoir une copie du dépot directement sur mon compte **Github**.

2. Je dois par la suite cloner cette copie en local. Pour ce faire, j'initialise dans un premier temps un dépot git à partir de mon terminal et je me place dans ce dernier :

```
git init doss
cd doss
``` 
Il me reste à cloner la copie, pour cela je copie l'adresse du [dépot Github](https://github.com/Rayannnn/MoSEF-projet-2018.git) et colle le dépot sur mon dépot **doss**.

```
git clone https://github.com/Rayannnn/MoSEF-projet-2018.git
ls 
``` 
En utilisant la commande *ls*, je vérifie que mon dépot a bel et bien été cloné en local. 

### Ajouter un fichier .sh exécutable et le pousser sur le serveur distant.

3. Il me faut désormais constituer un fichier executable tel qu'énoncé dans les consignes. Je crée donc un fichier script  directement à partir de la commande *vim*:

```
vim fich_semaine_derniere.sh
```
Une fois dans **VIM**, je rends mon fichier executable en utilisant la commande *bash* puis rentre les codes nécessaires à l'execution de mon fichier :

```
#!/bin/bash
jour=$(date +%d)
mois=$(date +%B)
an=$(date +%Y)
echo "Bienvenue $USERNAME, nous sommes le $jour $mois $an."
read -p "Quel répertoire vous interesse aujourd'hui ? : " repo
echo $repo:
ls $repo
```

Ici j'ai dû créé trois variables correspondant au jour, au mois et à l'année auquel on se trouve à partir de la commande *date*,
cela afin que la date donnée corresponde bien à celle durant laquelle le fichier sera effectivement executé.
J'utilise la variable d'environnement *USERNAME* pour afficher le nom du compte utilisateur. 
Enfin, j'utilise *read -p* pour afficher un message prompt qui permettra à l'utilisateur de rentrer le chemin du dépot qui l'interesse. 
La commande *echo* permet de renvoyer le chemin que l'utilisateur a demandé, puis *ls* fait la liste des fichiers et dépots contenus 
dans ce répertoire.  Je sors de la **vim** en enregistrant mon travail avec `:wq`. Pour tester l'execution de mon fichier, je me mets
sur mon repertoire personnel avec `cd` puis execute le fichier avec la commande *bash fichier_semaine_derniere.sh*. En effet, si je reste sur ce dépot, le nombre de répértoires avec lequel le script fonctionnera sera trop limité. J'aurais pu aussi introduire la commande `cd` dans le script après la commande `read` afin que l'execution du script prévoit directement de se mettre sur le répértoire personnel pour afficher la liste des fichiers et répértoires contenu dans le répértoire choisi.


4. J'inclus mon nouveau fichier dans ce qui doit être enregistré sur **git**, puis je l'enregistre effectivement. Ensuite, je le pousse sur mon serveur distant: 

```
git add fich_semaine_derniere.sh
git status
git commit -m "ajout d'un nouveau fichier"
git status
git push origin master
```
Je vérifie à chaque étape le statut de mon fichier avec *git status*.

### Créer une nouvelle branche et modifier le fichier dans cette branche, puis pousser les changements à distance.

5. Je crée une nouvelle branche sur mon dépot local :

```
git branch pro
```
6. Ceci fait je rentre dans ma nouvelle branche en utilisant la commande *git checkout* pour y modifier le fichier script dans la **vim** :

```
git checkout pro
vim fich_semaine_derniere.sh
``` 

J'y ajoute le code suivant :

```
find $repo -type f -mtime -7
```
Cela me permet comme dit dans l'enoncé de trouver l'ensemble des fichiers du repository souhaité qui ont été modifié depuis une semaine.

7. J'ai de nouveau inclus mon fichier modifié dans ce qui doit être enregistré sur **git**, l'ai enregistré puis l'ai poussé sur un serveur distant :

```
git add fich_semaine_derniere.sh
git commit -m "modification d'un nouveau fichier"
git push origin pro
```
### Fusionner les branches à distance, puis localement.

8. Ici, je réalise une `PULL REQUEST` afin de fusionner les deux branches directement sur le serveur distant et enregistrer les modifications sur la branche principale. 
Sur le site, je merge directement avec le bouton `pull request` les deux branches **master** et **pro** de sorte que les modifications de **pro** soient dans **master**.
J'enregistre ce merge en faisant un commit la rubrique `pull request`.

9. Je fusionne maintenant les deux branches en local. Pour cela, je change de branche et me remets sur la branche **master**.
Une fois sur la branche, je merge la branche **pro** à la branche **master**.
```
git checkout master
git merge pro
```

10. Je supprime le fichier *Consignes.md* et pousse toutes les modifications sur github.

Le push n'a pas fonctionné. J'avais rédigé le fichier `readme.md` et supprimé le fichier `Consignes.md` directement sur le shell. Cela a marché lorsque j'ai initialisé un nouveau répértoire git cloner mon dépot git et supprimer le dossier `Consignes.md`.

```
cd
git init depot
git clone https://github.com/Rayannnn/MoSEF-projet-2018.git
cd MoSEF-projet-2018
git rm Consignes.md
git commit -m "suppression du fichier
git push origin master
```
