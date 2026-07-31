# Claude-Governance

Dépôt canonique de la charte de gouvernance IA, réutilisable telle quelle sur n'importe quel projet
ou workspace de développement — local ou distant, indépendamment du langage ou de la nature du
logiciel.

Ce dépôt ne contient **aucun contenu spécifique à un projet particulier**.

## Démarrer

À coller tel quel dans une session d'assistant, sur un projet neuf comme sur un projet existant — la
charte décide elle-même de laquelle de ses quatre situations d'ouverture il relève :

```
Gouvernance IA — charte : https://github.com/TooMuhtsh/Claude-Governance.git

Clone ce dépôt (ou tire-le s'il est déjà présent) et lis `GOUVERNANCE-IA.md` en entier ;
n'ouvre `GABARITS.md` qu'au moment de créer ou restructurer un document. Détermine ensuite
laquelle des quatre situations d'ouverture s'applique à ce dépôt, mène l'entretien de
cadrage avant d'écrire quoi que ce soit, puis copie les deux fichiers verbatim dans
`.AIRules/` et versionne-les.
```

Pour ne rouvrir que quelques options sur un projet déjà cadré, ajouter en fin de prompt :
*« — seulement les clés `format`, `seuil` »*.

## Contenu

| Fichier | Rôle | Voyage dans les projets ? |
|---|---|---|
| [`GOUVERNANCE-IA.md`](./GOUVERNANCE-IA.md) | La charte : un **noyau** d'invariants, des **options** qui se décident par projet, et l'**entretien de cadrage** qui les pose. C'est ce qu'on lit en début de session. | **Oui**, copie conforme |
| [`GABARITS.md`](./GABARITS.md) | Squelettes de documents (HTML et Markdown), table de conversion, feuille de style, gabarit de `PROFIL.md`. Consulté au moment d'écrire, pas en début de session. | **Oui**, copie conforme |
| [`CHANGELOG.md`](./CHANGELOG.md) | Ce qui a changé, révision par révision, pour l'ensemble du dépôt. Document de lecture, sans rôle opérationnel : rien dans la gouvernance d'un projet n'en dépend. | **Non** |
| [`outils/`](./outils/) | Outillage de poste de travail (statusline). Sans rapport avec la gouvernance d'un projet. | **Non** |

Le contenu des règles est documenté dans les fichiers eux-mêmes, pas ici.

## Identifiant de version

Chaque révision porte un identifiant horodaté `AAAAMMJJ-HHMMSS` (UTC), figurant au pied de page
de `GOUVERNANCE-IA.md` et de `GABARITS.md`. Il est monotone, sans collision possible même pour deux
révisions le même jour, et se compare par une simple comparaison de chaînes.

## Utilisation dans un projet

1. Le projet garde une copie de `GOUVERNANCE-IA.md` **et** de `GABARITS.md` dans son propre
   `.AIRules/`, versionnées avec son code — voir A-7 de la charte pour le motif.
2. Il porte en plus un `PROFIL.md`, **propre à lui** et jamais copié d'ailleurs : les réponses de son
   entretien de cadrage. Gabarit dans `GABARITS.md`.
3. Pour vérifier si les copies sont à jour : tirer ce dépôt et comparer les identifiants de version.
   Un identifiant inférieur signale une copie périmée, sans avoir à lire le contenu.
4. En cas d'écart, propager les fichiers **verbatim** (copie conforme, jamais adaptée), vérifier par
   `diff`, puis committer et pousser dans le dépôt du projet.

Comment une révision s'applique dépend de sa nature, et la table des révisions le dit : une
révision **purement additive** se propage d'office ; une révision qui **touche le noyau ou modifie un
défaut** se signale et se propose, elle ne s'applique jamais d'office.

Aucune dépendance Git (pas de submodule, pas de subtree) : chaque projet garde des copies autonomes,
pour que son propre `git clone` reste suffisant pour tout récupérer — y compris sur une machine sans
accès à ce dépôt-ci.

## Revoir une révision

[`CHANGELOG.md`](./CHANGELOG.md) dit ce que chaque révision a changé, en clair. `git log` donne le
détail ligne à ligne.

Le **régime d'application** d'une révision — additive, ou touchant le noyau — n'est pas dans le
changelog : il vit dans la table des révisions en pied de charte, là où un projet cloné sans accès à
ce dépôt peut encore le lire.
