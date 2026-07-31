# Changelog

Évolutions notables de ce dépôt — la charte, les gabarits, le README et les outils de poste de
travail. C'est le document à lire pour savoir **ce qui a changé et quand**, sans avoir à comparer
deux versions de la charte.

Le format s'inspire de [Keep a Changelog](https://keepachangelog.com/fr/1.1.0/), à une différence
près : les versions ne suivent pas SemVer mais un **identifiant horodaté** `AAAAMMJJ-HHMMSS` en UTC,
monotone et comparable par simple comparaison de chaînes.

Le **régime d'application** de chaque révision — purement additive, ou touchant le noyau — n'est pas
répété ici : il est déclaré dans la table des révisions, en pied de
[`GOUVERNANCE-IA.md`](./GOUVERNANCE-IA.md), là où un projet cloné sans accès à ce dépôt peut le lire.

---

## `20260731-203812` — 2026-07-31

Le dépôt se dote d'un changelog et d'un prompt de démarrage. A-7 fixe la fin de vie du fichier
par lequel une remise à niveau se propose.

**Ajouté**

- **Ce fichier.** Une entrée par révision, pour l'ensemble du dépôt — charte, gabarits, README,
  outils. Il ne voyage pas dans les `.AIRules/` et rien dans la gouvernance d'un projet n'en dépend :
  c'est un document de lecture.
- **Section « Démarrer » dans le README** : un prompt unique, à coller tel quel, qui porte l'URL du
  dépôt et couvre cadrage initial comme remise à niveau — la charte sait déjà distinguer ses quatre
  situations d'ouverture. Il va jusqu'à la copie verbatim dans `.AIRules/`, sans quoi le déploiement
  reste à faire.
- **A-7 nomme le `REMISE-A-NIVEAU.md`** et lui fixe une fin de vie. Une branche de propagation met à
  jour les copies conformes d'office, mais n'écrit **aucune ligne** dans ce qui appartient au projet ;
  ce qu'impliquent ces copies s'écrit dans ce fichier. **Sa vie s'arrête à la fusion** : son contenu
  rejoint alors le chantier de roadmap qui porte la mise en conformité, et le fichier disparaît.
  Le laisser vivre après la fusion crée deux emplacements pour le même fait (A-2) — typiquement une
  roadmap qui affiche la revue comme faite pendant que le fichier liste encore des items ouverts.

**Modifié**

- **L'historique des révisions quitte la charte.** Elle ne garde qu'une table `Version | Régime` et
  un renvoi vers ce changelog. Le régime reste là parce que c'est la seule information dont un projet
  cloné sans accès à ce dépôt ait besoin : c'est elle qui décide si une remise à niveau se propage
  d'office ou se propose. Le récit, lui, ne se lit qu'au moment de réviser, donc là où l'on révise.
- La phrase d'A-7 qui désignait « le paragraphe de révision » désigne désormais cette table.

---

## `20260731-150737` — 2026-07-31

Le fichier d'instructions cesse d'être nommé en dur, et sa mise à jour cesse d'être réactive. Deux
mots configurables entrent dans le cadrage.

**Ajouté**

- Option `fichier-instructions` : quel fichier d'instructions auto-chargé le projet utilise —
  `CLAUDE.md` par défaut, `AGENTS.md`, ou les deux. Si les deux, l'un est la source et l'autre un
  renvoi d'une ligne, jamais deux contenus à tenir en parallèle.
- Option `mot-cloture` : un mot dont l'énoncé vaut, en un seul geste, feu vert d'A-3, mise à jour des
  documents, vérification du fichier d'instructions, commit et push. Ce n'est pas un contournement de
  la validation mais sa forme la plus courte — le prononcer *est* la décision explicite que la charte
  exige.
- Option `mot-cadrage` : un mot qui rouvre l'entretien de cadrage, en entier ou sur quelques clés
  nommées.
- Un **cinquième déclencheur** d'entretien de cadrage : « sur demande explicite, à tout moment ». Un
  projet change de nature sans qu'aucun des quatre autres déclencheurs ne se produise, et son profil
  vieillissait en silence.

**Modifié**

- **A-11 devient agnostique de l'outil** : la charte parle du « fichier d'instructions auto-chargé
  par l'assistant » et ne nomme plus aucun produit. Un document qui se prétend indépendant de l'outil
  ne pouvait pas en nommer un quinze fois.
- **La vérification du fichier d'instructions devient un point de passage** de toute écriture de
  gouvernance, avec la liste de ce qui se contrôle. « Mettre à jour dès qu'une commande change »
  supposait de remarquer le changement, ce qui n'arrive pas.

---

## `20260731-135838` — 2026-07-31

Refonte structurelle. Le document se scinde en trois parties : un **noyau** de quinze invariants
prescriptifs, dix-neuf **options** qui se décident par projet et portent chacune son défaut **et le
pourquoi de ce défaut**, et un **entretien de cadrage** qui les pose au lieu de les supposer.

**Ajouté**

- **Identifiant de version horodaté** `AAAAMMJJ-HHMMSS`, en remplacement de la date de pied de page
  qui ne savait pas distinguer deux révisions du même jour.
- **`GABARITS.md`** : les squelettes de documents et le modèle de profil sortent de la charte, pour
  n'être lus qu'au moment d'écrire. La charte reste ce qu'on charge en début de session.
- **`PROFIL.md`** : un fichier par projet, toujours en Markdown, où vivent les réponses de cadrage.
- **A-5, trace de dérive** : constater qu'un invariant documenté est faux laisse désormais une trace
  obligatoire, deuxième exception nommée au feu vert.
- **Deux régimes de révision** (A-7) : additive, ou touchant le noyau.
- **Liste explicite de ce qui reste dehors** d'un dépôt public (option `visibilité`).
- **Option `format`** : `html` par défaut, avec un gabarit Markdown équivalent et la possibilité d'en
  ajouter d'autres.
- **Table de correspondance** entre l'ancienne numérotation Règle 1-7 et les nouvelles sections.

**Modifié**

- **Les identifiants `A-x` et les clés d'option sont déclarés stables**, au même titre que ceux
  qu'A-6 impose aux projets : ils sont devenus des références porteuses, et rien ne protégeait la
  charte de se casser elle-même à la révision suivante.
- La vérification d'un export d'API se généralise en **« ne jamais conclure sur une seule source »**
  (A-12).

**Retiré**

- Le **script de statusline** quitte la charte pour `outils/` — il relève du poste de travail, pas du
  projet, et ne voyage pas dans les `.AIRules/`.
- Le **récit d'incident daté** disparaît, et le piège d'encodage propre à une plateforme est
  généralisé : son cas concret revient au contexte des projets concernés.

---

## Avant les identifiants de version

Ces révisions sont antérieures à l'introduction de l'identifiant horodaté ; elles ne portent qu'une
date.

| Date | Contenu |
|---|---|
| 2026-07-31 | Éclatement d'une page principale en pages de détail ; chaîne de liens continue pour les annexes ; note d'annexe ; réparation des liens de navigation d'archive ; colonne `Hash` ramenée à trois valeurs ; pastille `.adopted` ; compteur de numérotation ; audit de roadmap aligné sur les deux nouveaux états. |
| 2026-07-30 | La charte est la référence à tout moment ; dossiers optionnels `annexes/` et `archive/` ; dépôt canonique public ; vérification périodique par cron ; navbar réservée aux pages principales ; liens internes toujours relatifs ; discipline d'édition ciblée ; script de statusline intégré verbatim ; index des projets ramené à un gabarit vide. |
| 2026-07-29 | Trois questions à poser au SETUP d'un nouveau projet. |
| 2026-07-28 | Ajout des Règles 6 et 7 ; révision des cadences d'écriture et de la discipline de vérification. |
