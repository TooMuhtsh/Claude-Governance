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

## `20260804-071239` — 2026-08-04

Troisième et dernier chantier de la réforme d'amaigrissement de la roadmap : le journal peut
désormais s'écrire dans un format plus dense, sans que ce soit une obligation.

**Ajouté**

- **Option `journal-format`** — `tableau` (défaut, inchangé) ou `log` : un tableau unique et
  plat pour tout le journal, trié de la plus récente à la plus ancienne entrée, `Chantier`
  devenant un champ de la ligne plutôt qu'un regroupement en section. Mesuré le 2026-08-03
  sur deux journaux réels : résumé médian à 500-600 caractères, jusqu'à 93 % des entrées
  au-delà de 200 caractères, 44-58 % du poids du fichier occupé par le seul texte des
  résumés.
- **En `log`** : `Résumé` borné à 250 caractères (vérifiable d'un `grep`) ; le paragraphe de
  contexte de chantier n'a plus sa place et bascule, s'il compte encore, en fait stable dans
  `AI-CONTEXT` (A-2) ; les liens d'ancre survivent sous forme courte, insérés dans le texte
  du résumé (`[#N]`, `[roadmap#slug]`) et comptés dans la borne. Convertir un journal
  existant du `tableau` vers `log` est permis par la deuxième exception nommée d'A-4
  (`20260804-064238`) — jamais une obligation.
- **`GABARITS.md`** : § `AI-HISTORY` porte désormais les deux variantes (`tableau` et
  `log`) ; § `AI-CONTEXT` note que le pourquoi d'un chantier peut y atterrir comme fait
  stable ; § 7 (`PROFIL.md`, table des trois profils) et la table des options portent la
  nouvelle clé — `log` en profil `complet`, `tableau` ailleurs.

Régime : purement additive. Nouvelle option, aucun défaut existant ne change ; un projet qui
ne répond pas hérite de `tableau` sans que rien ne bouge dans son journal.

---

## `20260804-064238` — 2026-08-04

Deux chantiers de la réforme d'amaigrissement de la roadmap : une exception nommée pour
convertir un journal existant sans le réécrire, et une option pour désencombrer une roadmap
de ses chantiers déjà livrés. Les deux touchent le noyau — A-4 pour la première, A-8 pour la
seconde.

**Ajouté**

- **Deuxième exception d'A-4 : la conversion de format.** Faire passer un journal existant
  d'un support à un autre (tableau vers lignes de log, HTML vers Markdown) est permis sous
  quatre conditions cumulatives : décidée en révision, appliquée en une fois à tout le
  document, à contenu constant, vérifiée par comparaison des textes extraits avant et après.
  Distinction posée dans le même geste : **convertir n'est pas réduire** — la conversion est
  mécanique et sans perte, la réduction supprime de l'information et reste hors de
  l'exception. Aucune référence entrante ne pointe aujourd'hui vers une ancre de chantier de
  journal (mesuré le 2026-08-03 sur deux projets réels, 56 liens entrants, zéro vers une
  ancre) : le risque classique d'une réécriture — des liens qui pointent silencieusement
  ailleurs — est nul ici.
- **Option `registre-livrés`** — sépare, par défaut, la roadmap active du registre des
  chantiers livrés. Un chantier `Livré` ou `Adopté` quitte le détail de la roadmap pour une
  annexe `annexes/REALISE.{{ext}}` (A-8, jamais `archive/` : A-9 interdirait la
  condensation et l'amendement d'un chantier livré) ; la roadmap n'en garde qu'une ligne et
  le lien. Mesuré le 2026-08-03 sur un projet réel : 87 % des pastilles de statut de sa
  roadmap marquaient un chantier déjà livré.
- **`GABARITS.md` § 9 — registre des chantiers livrés** : plan de l'annexe, ce que porte une
  entrée (design, renvoi au journal, évolutions post-livraison en une ligne chacune, pièges
  sans réexplication, liste des commits), règles de bascule, et le piège de la réécriture
  d'historique qui invalide une ligne de commits en silence.

**Modifié**

- **A-8** cite désormais ce registre parmi les usages typiques d'`annexes/`.
- **`GABARITS.md` § 3, plan de `ROADMAP`** : un chantier arrivé à son état terminal n'a plus
  de section de détail quand `registre-livrés = oui`, seulement une ligne de renvoi.
- **`GABARITS.md` § 7** : le gabarit de `PROFIL.md` et la table des trois profils de départ
  portent la nouvelle option (`non` en `minimal`, `oui` ailleurs).

---

## `20260803-200821` — 2026-08-03

Deux dettes de la charte sur elle-même : une table de transition dont la condition de retrait était
inatteignable, et un corollaire d'A-6 que la charte imposait aux projets sans se l'appliquer.

**Retiré**

- **La table de correspondance avec la numérotation antérieure** (`Règle N` → `A-x`). Elle se
  déclarait « temporaire, à retirer une fois les références des projets migrées » — condition
  **impossible à satisfaire** : les seules références survivantes vivent dans les **journaux** des
  projets, qu'A-4 interdit de réécrire. Elle serait donc restée éternellement, ce que sa propre
  note disait vouloir éviter.
  Second motif, décisif : la charte est copiée dans **tous** les projets, y compris ceux qui n'ont
  jamais connu l'ancienne numérotation — ils recevaient une table de conversion vers un vocabulaire
  qu'ils n'ont jamais employé. Aucun document vivant (contexte, roadmap, index, fichier
  d'instructions) ne cite plus `Règle N` ; un journal qui la mentionne décrit ce qui se disait à
  l'époque, et c'est au projet concerné, s'il le souhaite, de porter sa propre note de
  correspondance — pas à la charte de la porter pour tout le monde.

**Ajouté**

- **Le prochain numéro d'invariant libre (`A-16`) figure désormais en tête** de la section sur la
  stabilité des identifiants. A-6 l'exige de tout document à numérotation stable, et la charte
  déclarait explicitement ne pas s'en dispenser — elle ne l'appliquait pourtant nulle part. L'ordre
  d'affichage ne suivant pas la numérotation, aucune lecture partielle ne donnait le dernier numéro
  attribué.

---

## `20260803-182826` — 2026-08-03

Une passe de vérifications manuelles peut désormais se dérouler sur un document dédié plutôt que
dans le fil de la conversation. Option et gabarit ; le noyau ne bouge pas.

**Ajouté**

- **Option `support-test`** — à partir de combien de vérifications une passe se déroule sur un
  document dédié. Un **nombre** (défaut `8`), ou `prose` / `fichier` pour trancher une fois pour
  toutes. Un seuil plutôt qu'un choix binaire : le point de bascule dépend du projet et de la nature
  des tests — six vérifications longues pèsent plus que douze gestes triviaux — et l'arbitrage autour
  du seuil reste au jugement. L'option ne dépend pas de `test-manuel` : elle porte le support, pas la
  décision de tester à la main, et sert aussi à une recette avant publication, à un contrôle de
  non-régression, ou à un projet sans interface à cliquer.
- **`GABARITS.md` § 8 — support de passe de test** : ossature obligatoire, structure de données à
  réécrire d'une passe à l'autre, **contrat de sortie du rapport**, et deux pièges d'implémentation.
  Ce § existe parce que les oublis d'un support de passe sont **invisibles depuis l'écran** : une
  criticité affichée mais absente du rapport, une passe sans version testée, un état qui confond
  « pas encore fait » et « sans objet » ne se constatent qu'une fois la passe terminée et l'occasion
  passée.

**Ce que l'option retient de l'usage, et qui n'allait pas de soi**

- Le motif du document est l'**endurance**, pas la précision du compte rendu. Ce qui use sur une
  longue passe : ne pas voir la fin, le va-et-vient avec l'application testée, et la reprise après
  interruption. Une passe abandonnée aux deux tiers ne vaut pas une passe courte bien rapportée.
- Les repères de progression sont **fonctionnels, pas décoratifs**, et se complètent au lieu de se
  remplacer : nombre restant, proportion visuelle, état visible de chaque ligne.
- Le quatrième état **non applicable** ne prend pas de bouton — il se déduit d'un test sans réponse
  et commenté. La distinction qu'A-4 impose à la colonne `Hash` est réelle, mais elle se paie au
  rapport plutôt que sur chaque ligne.
- Le document **n'est pas jetable entre deux passes du même chantier** : il se réédite, ses numéros
  restent stables (A-6), et il ne disparaît qu'à la consignation.
- Le rapport **ne liste pas ce qui a réussi** : le silence vaut réussite, et c'est l'en-tête — date
  et version testée — qui l'empêche d'être ambigu.

---

## `20260731-204511` — 2026-07-31

**Corrigé**

- **Le gabarit de `PROFIL.md` codait un identifiant de charte en dur** (`20260731-150737`) là où il
  attend un substituant, au milieu de champs qui en utilisent partout ailleurs (`{{date}}`,
  `{{mot}}`). Tout `PROFIL.md` créé depuis ce gabarit serait né en déclarant avoir été cadré sous une
  version qui n'est pas la sienne — un fait faux, écrit dans le fichier qui sert précisément à savoir
  sous quelle version les options ont été tranchées. La ligne attend désormais `{{id}}`.

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
