# Idée Repas

Création d'une application de recettes de cuisine dans le cadre d'un projet de Programmation Mobile Swift en deuxième année de cycle ingénieur à l'ESIREM (Dijon).

## Fonctionnalités de l'application

Dans cette application, il est possible d'ajouter des plats en renseignant un certain niveau de détails (Nom, Type, Durées de réalisation, Ingrédients et Etapes). Ces plats sont affichés dans la vue principale sous la forme d'une liste que l'on peut faire défiler, ils sont triés par ordre alphabétique. En cliquant sur l'un deux, on a la possibilité d'afficher les détails de ce plat, et, si on le veut, de l'éditer en enchaînant sur une troisième vue (même vue que pour l’ajout).

On peut également supprimer un plat de la liste en effectuant un swipe vers la gauche sur celui-ci, un popup de confirmation apparait alors pour éviter toute suppression accidentelle.
Un écran d'aide récapitulant tout cela est accessible depuis la vue principale.

Enfin, l'application sauvegarde tous les ajouts, les modifications et les suppressions effectués de sorte à pouvoir réouvrir l'application plus tard dans le même état qu'avant sa fermeture. 

Lorsqu’il n’y a aucun plat en mémoire, l’application affiche un popup demandant si l’utilisateur veut ajouter un plat par défaut en tant qu’exemple ou ajouter un plat lui-même. Ce popup apparait au premier démarrage de l’application et réapparait lorsque l’on supprime le dernier repas de la liste ou que l’on réveille l’application (arrière-plan vers premier plan) et qu’il n’y a aucun plat.

Si le thème de l’iPhone (Sombre/Clair) est changé, l’application met à jour les images de la vue principale aussitôt après l’avoir réveillée.

  
## Axes d'améliorations
  - Amélioration de la gestion du changement de thème de couleur du système (Sombre/Clair) : celui-ci ne fonctionne que sur la vue principale;
  - Amélioration de l'affichage des ingrédients et des étapes dans la vue de détails;
  - Amélioration de l'ajout d'ingrédients et d'étapes dans la vue d'ajout/modification de plat;
  - Utiliser une base distante pour gérer les plats en mémoire et pouvoir les retrouver sur plusieurs appareils;
  - Amélioration de l'écran d'aide pour plus de compatibilités avec d'autres tailles d'écran;
  - Faire en sorte que l'élément en cours de modification soit toujours visible à l'apparition du clavier;
  - Ajouter un tirage de menu aléatoire basé sur les plats cuisinés pendant une certaine période (à ajouter) ou encore en fonction des ingrédients disponibles;
  - Ajout d'une fonctionnalité de recherche de plat par nom et ingrédients.
