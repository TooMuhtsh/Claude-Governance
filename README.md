# Claude-Governance

Dépôt canonique de `GOUVERNANCE-IA.md` : la charte de gouvernance IA réutilisable telle quelle sur
n'importe quel projet ou workspace de développement, local ou distant (poste perso, projet pro, VPS...),
indépendamment du langage ou de la nature du logiciel.

Ce dépôt ne contient **que** la charte elle-même — aucun contenu spécifique à un projet particulier.
Le contenu de la charte (règles, protocole `.AIRules/`, discipline de vérification...) est documenté
dans le fichier lui-même, pas ici.

## Utilisation dans un projet

1. Le projet garde une copie de `GOUVERNANCE-IA.md` dans son propre `.AIRules/` (ou son équivalent),
   **versionnée avec son code** — voir la Règle 1 de la charte pour le détail et le motif.
2. Pour vérifier si cette copie est à jour : cloner ou tirer ce dépôt, comparer la date de pied de
   page des deux fichiers. La date est le seul numéro de version — une copie dont elle est antérieure
   à celle de ce dépôt est une copie périmée.
3. En cas d'écart, propager le fichier de ce dépôt **verbatim** dans le projet (copie conforme, jamais
   adaptée), vérifier par `diff`, puis committer et pousser dans le dépôt du projet.

Aucune dépendance Git (pas de submodule, pas de subtree) : chaque projet garde une copie autonome,
pour que son propre `git clone` reste suffisant pour tout récupérer — y compris sur une machine sans
accès à ce dépôt-ci.

## Revoir une révision

`git log -- GOUVERNANCE-IA.md` donne l'historique des révisions de la charte elle-même.
