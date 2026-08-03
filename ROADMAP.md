# Roadmap

*Dernière revue : 2026-08-03.*

Ce que la charte et les gabarits **pourraient** devenir : idées non tranchées, révisions envisagées,
décisions de périmètre. Ce qui a déjà changé est dans [`CHANGELOG.md`](./CHANGELOG.md) ; ce qui
s'applique aujourd'hui est dans [`GOUVERNANCE-IA.md`](./GOUVERNANCE-IA.md) et
[`GABARITS.md`](./GABARITS.md). Cette page ne répète ni l'un ni l'autre.

Comme le changelog, elle **ne voyage pas** dans les `.AIRules/` des projets : une idée qui n'est pas
encore une règle n'a rien à faire dans le dossier qui dit ce qui s'applique.

## Vue d'ensemble

| Chantier | Statut | Priorité |
|---|---|---|
| [`AI-HISTORY` au format log obligatoire](#ai-history-au-format-log-obligatoire) | Prévu — instruit par la mesure, design à établir | Non datée |
| [Nommer l'exception de conversion de format dans A-4](#nommer-lexception-de-conversion-de-format-dans-a-4) | Prévu — mécanisme tranché, texte à écrire | Non datée |
| [Séparer la roadmap active du registre des chantiers livrés](#séparer-la-roadmap-active-du-registre-des-chantiers-livrés) | Prévu — design tranché, rédaction à faire | Non datée |
| [Gouverner ce dépôt par sa propre charte](#gouverner-ce-dépôt-par-sa-propre-charte) | Écarté | Sans objet |

## Non daté — à faire quand utile

### `AI-HISTORY` au format log obligatoire

Rendre obligatoire, pour le journal, un **format de log** : une entrée tient sur **une ligne**,
dense, sans balisage riche — plus léger que ce que produit le gabarit actuel, et censé rester tout
aussi précis.

Ce que fait le gabarit aujourd'hui : un tableau `Date | Hash | Résumé` par chantier, avec un
paragraphe de contexte optionnel au-dessus. **Rien ne borne la cellule `Résumé`**, et l'usage réel
l'a remplie de paragraphes entiers — gras, liens d'ancre, sous-parties. Le coût n'est pas seulement
l'écriture : c'est un document que la charte fait relire, et qu'on ne relit plus d'un bout à l'autre
passé une certaine taille.

**Mesuré le 2026-08-03** sur les journaux de deux projets réels, tous deux âgés de moins d'un mois :

| | projet A | projet B |
|---|---|---|
| Journal | 2252 lignes · 168 Ko | 845 lignes · 62 Ko |
| Chantiers · entrées | 46 · 117 | 18 · 70 |
| **Résumé médian** | **617 caractères** | **501 caractères** |
| Résumés au-delà de 200 caractères | 93 % | 64 % |
| Part du fichier occupée par le texte des résumés | 44 % | 58 % |
| Chantiers dont la dernière entrée a plus de 14 jours | **0** | **0** |

Trois constats en découlent, et deux d'entre eux n'allaient pas de soi :

- **L'archivage (A-9) ne remplace pas ce chantier, mais il en est le moyen de bascule.** Il ne
  résorbe pas la densité — un chantier archivé garde ses entrées de 617 caractères, simplement
  ailleurs. Il permet en revanche de repartir d'un journal principal vide sans réécrire une seule
  entrée, ce qu'A-4 interdirait. À ne pas confondre : ce chantier traite le **coût par entrée**,
  A-9 traite le **volume accumulé**.
- **Le poids vient du texte, pas du balisage** — 44 à 58 % du fichier pour les seuls résumés. Alléger
  la structure ne rendrait presque rien ; borner le texte rend beaucoup.
- **La dérive n'est pas marginale, c'est la norme** : 93 % des entrées du plus gros journal dépassent
  200 caractères, et sa médiane à 617 vaut quatre ou cinq phrases.

Ce qui reste à trancher :

- **Ce qui borne une ligne** — *instruit : la borne doit être un nombre*. « Une phrase » ne borne
  rien, la médiane actuelle en vaut déjà quatre ou cinq ; une contrainte qualitative reproduirait
  mot pour mot l'histoire de la colonne `Résumé`, qui n'était pas bornée non plus. Un plafond de
  l'ordre de **200 caractères** se vérifie d'un `grep` et divise le texte par trois. Reste à fixer le
  nombre exact.
- **Le groupement par chantier** — *instruit : les chiffres penchent vers l'aplatissement*. 46
  chantiers pour 117 entrées, soit **2,5 entrées par chantier** : le groupement fabrique autant
  d'en-têtes, d'ancres et de paragraphes de contexte que de groupes de deux entrées. `Chantier`
  comme champ de la ligne coûte moins et perd peu. À confirmer sur le point suivant, dont il dépend.
- **Le paragraphe de contexte de chantier.** Il porte le *pourquoi* d'un chantier — qui l'a signalé,
  ce qui l'a déclenché. S'il disparaît du journal, il doit atterrir quelque part (roadmap ? contexte ?)
  ou être assumé comme perdu ; A-2 interdit de le laisser exister à deux endroits.
- **Les liens d'ancre** vers un piège du contexte ou un chantier de la roadmap : conservés sous une
  forme courte, ou abandonnés ? C'est une part réelle de la précision actuelle.
- **La portée de « obligatoire ».** Si le format s'impose quel que soit l'option `format`, la révision
  touche le noyau ou le gabarit commun : régime de propagation qui **se propose** projet par projet,
  jamais d'office (A-7). Si ce n'est qu'une nouvelle valeur d'option, la révision est additive.
- **Les journaux existants** — *instruit : deux voies, aucune ne réécrit le fond*. Soit **archiver
  l'ancien format en bloc** (A-9 : déplacement intégral, ligne de renvoi en place) et repartir d'un
  journal principal vide — A-9 ne pose **aucun critère d'ancienneté**, il vise un document devenu
  long et archive un chantier *clos*, pas un chantier *vieux*, donc un journal d'un mois y est
  éligible ; soit **convertir l'existant à contenu constant**, ce qui suppose le chantier
  [Nommer l'exception de conversion de format dans A-4](#nommer-lexception-de-conversion-de-format-dans-a-4).
  L'archivage attend le feu vert (A-3) et crée des liens à tenir ; la conversion ne coûte rien à la
  précision mais demande que la charte l'autorise explicitement. Le choix se fait une fois, dans la
  révision, pas projet par projet.

*À vérifier avant d'écrire quoi que ce soit : que la précision survit réellement. Reprendre deux ou
trois entrées longues d'un journal existant, les réduire au format log, et regarder ce qui saute —
si ce qui saute est du remplissage, l'idée tient ; si c'est une décision ou une cause, elle ne tient
pas sous cette forme.*

### Nommer l'exception de conversion de format dans A-4

A-4 pose qu'une entrée de journal écrite **ne se réécrit jamais, même fausse**. Prise à la lettre,
la règle interdit aussi de faire passer un journal existant d'un format à un autre — ce qui bloque
la bascule envisagée au chantier précédent, et bloquerait de la même façon tout changement de
support futur.

**Ce que la règle protège réellement, c'est le fond.** Le « même fausse » le dit : elle vise la
correction après coup, l'histoire réarrangée pour être plus présentable. Convertir un tableau en
lignes de log **sans toucher au texte** ne réécrit rien de ce qu'A-4 défend — c'est un changement de
rendu. Mais ce raisonnement ne figure nulle part : aujourd'hui il se plaide au lieu de se lire, et
une règle qu'il faut plaider n'en est plus une.

**Exception à nommer**, sous quatre conditions cumulatives :

- **décidée en révision**, jamais au fil d'une session ;
- **appliquée en une fois**, à tout le document — pas entrée par entrée ;
- **à contenu constant** : le texte de chaque entrée est transporté tel quel, seul son support change ;
- **vérifiée par comparaison des textes extraits** avant et après, la vérification faisant partie du
  geste et non de la bonne volonté.

**Ce que l'exception ne desserre pas** : corriger le fond d'une entrée reste interdit, et la
correction continue de s'ajouter plutôt que de se substituer. La frontière est nette et
mécaniquement vérifiable — si les textes extraits diffèrent, ce n'est pas une conversion.

Ce qui justifie de l'ouvrir plutôt que de contourner par l'archivage :

- **Aucune référence entrante ne pointe vers une entrée.** Mesuré le 2026-08-03 sur deux journaux
  réels : 56 liens entrants au total, **zéro** vers une ancre de chantier. Le risque classique d'une
  réécriture — des liens qui pointent silencieusement ailleurs — est nul ici.
- **L'état antérieur n'est jamais perdu** : le versionnement le conserve. La garantie « sans rien
  perdre » qu'A-9 réclame est déjà fournie par Git, indépendamment de la règle d'ajout seul.
- **Rien d'automatisé ne lit ces documents** : pas de parseur, pas de génération. Le format n'est un
  contrat vis-à-vis de personne.
- Un journal dont les hashes ont été invalidés par une réécriture d'historique porte aujourd'hui une
  **table de correspondance** en tête, précisément parce qu'A-4 interdit de corriger en place. Une
  conversion permettrait de l'appliquer et de supprimer la table.

> **❗ Convertir n'est pas réduire**
>
> Ces deux gestes se ressemblent et n'ont pas le même coût. La **conversion** est mécanique,
> scriptable, sans perte, et c'est elle que l'exception autorise. La **réduction** — ramener des
> résumés de plusieurs centaines de caractères à une ligne — supprime de l'information, autant de
> fois qu'il y a d'entrées, et personne ne relit l'ensemble pour vérifier ce qui a sauté. Elle reste
> hors de l'exception : le format resserré s'applique aux entrées **nouvelles**, et le gain de
> densité s'installe par accumulation.

*À trancher en écrivant : le numéro de l'exception dans le corps d'A-4 — la règle porte déjà une
exception nommée (le marqueur `(commit en cours)` remplacé par le hash réel), et celle-ci serait la
seconde. Régime : **touche le noyau**, donc la remise à niveau se propose projet par projet, sans
effet sur un projet qui ne convertit rien.*

### Séparer la roadmap active du registre des chantiers livrés

**Rien ne fait sortir un chantier de la roadmap une fois qu'il est livré.** Il y prend une pastille
et y reste, avec tout son design, ses sous-décisions et ses encadrés. Le document censé porter « ce
qui reste à faire » finit par décrire surtout ce qui est fait — et devient le plus lourd de la
gouvernance.

**Mesuré le 2026-08-03**, sur les mêmes deux projets que le chantier du journal :

| | roadmap | journal | contexte |
|---|---|---|---|
| projet A | **245 Ko** · 3143 lignes | 168 Ko | 133 Ko |
| projet B | **113 Ko** · 1550 lignes | 62 Ko | 66 Ko |

Sur le projet A, **71 pastilles de statut sur 82 marquent un chantier livré** — 87 %. Le projet B
n'a pas cette dérive (9 prévus, 7 livrés, 4 en cours) : c'est une dérive d'usage, pas une fatalité
du format. A-2 range pourtant un chantier livré ailleurs, puisqu'il devient un événement daté.

**Ce chantier ne bute sur aucun interdit** — contrairement au journal, la roadmap n'est pas en ajout
seul : elle se corrige en place, A-15 l'exige même. Il n'y a ni exception à créer ni règle à
desserrer.

#### Design retenu

- **Deux fichiers.** La **roadmap active** ne porte que ce qui reste ouvert. Les chantiers arrivés à
  leur **état terminal** — `Livré`, ou `Adopté` pour l'outillage — basculent dans un **registre du
  réalisé**. Le vocabulaire de statuts fournit déjà le critère de bascule ; rien à inventer.
- **Le registre vit dans `annexes/`, pas dans `archive/`.** La distinction est le cœur du design :
  A-9 impose à tout contenu archivé de ne « ni se corriger, ni se résumer, ni se condenser », ce qui
  interdirait à la fois la condensation à l'entrée et l'amendement d'un chantier livré. A-8 n'impose
  rien de tel et décrit exactement ce qu'on veut : l'énoncé reste dans le document principal,
  l'annexe porte le détail volumineux qui l'étaye. **Aucune règle n'est enfreinte, aucune révision du
  noyau n'est nécessaire.**
- **Format du projet** (HTML sur un projet HTML), et non Markdown systématique : ce registre est un
  document de lecture, contrairement à `PROFIL.md` dont l'exception se justifiait autrement.
- **Les chantiers `Écarté` ne basculent pas.** Ils restent en « Hors périmètre » dans la roadmap
  active — c'est ce qui évite qu'une idée déjà tranchée soit reproposée six mois plus tard.
- **En-tête de la roadmap active : trois groupes séparés** — faits, en cours, à venir. Les faits n'y
  sont qu'une ligne, avec le lien vers leur entrée du registre. La vue d'ensemble du projet survit
  donc entièrement à l'allègement.
- **Ordre organique dans le registre** : le plus récent en tête, un nouveau chantier s'ajoute en
  début de fichier.

#### Ce que porte une entrée du registre

1. **Le design retenu et l'ampleur du chantier** — les gros points, sans fioriture : de quoi
   comprendre ce qui a été fait et ce que ça pesait.
2. **Le renvoi vers l'entrée de journal** correspondante. C'est ce qui trace la frontière : le
   journal garde l'**événement daté**, le registre garde l'**état**.
3. **Les évolutions successives**, une ligne chacune, disant ce qu'elles changent — **ajout, retrait
   ou remplacement** — et datée par rapport à la livraison initiale. C'est ce qui évite d'ouvrir
   treize chantiers pour des ajustements successifs sur une fonctionnalité déjà livrée.
4. **Les numéros des pièges** issus du chantier, **sans les réexpliquer** : le contexte reste seul à
   les décrire (A-2), et le registre fournit le lien inverse qui manquait — savoir de quel chantier
   vient un piège. Les identifiants étant stables (A-6), ces renvois ne cassent pas.
5. **La liste des commits du chantier**, sur une seule ligne, en ordre chronologique. C'est la seule
   information de l'entrée qui ne soit dérivable de nulle part ailleurs : rien ne relie un commit à
   un chantier sans relire tous les messages du dépôt. Elle rend l'histoire complète d'un chantier
   consultable sans relire le projet.

> **⚠️ Une réécriture d'historique invalide la ligne de commits en entier, et en silence**
>
> `filter-branch`, `rebase` ou amende massive changent tous les hashes : la ligne continue d'exister,
> parfaitement lisible, et ne désigne plus rien. Le cas s'est déjà produit sur un projet réel. La
> règle à écrire avec ce champ : toute réécriture d'historique impose de rejouer les lignes de
> commits du registre, ou d'y porter la table de correspondance.

#### Ce qui reste à trancher en écrivant

- **Le seuil de « selon l'ampleur »** pour une évolution post-livraison : une ligne dans le registre
  suffit-elle, ou faut-il rouvrir un chantier dans l'actif ? La charte porte déjà un seuil
  comparable à l'option `roadmap-avant-code` — « dès qu'elle touche l'architecture, une convention,
  ou plus d'un fichier ». Le réutiliser plutôt que d'en inventer un second.
- **Le nom du fichier** et sa place exacte dans `annexes/`.
- **L'articulation avec l'option `documents`**, qui propose aujourd'hui `4` ou `3` et ignore ce
  cinquième document.
- **La bordure entre une ligne d'évolution et une entrée de journal.** Les deux décrivent un
  changement daté ; seule la granularité les sépare. Sans une consigne de brièveté explicite, le
  registre redeviendra un journal.

*Option **activée par défaut** : le découpage devient la norme, un projet peut y renoncer. Régime en
conséquence — **touche un défaut**, donc la remise à niveau se propose projet par projet et ne
s'applique jamais d'office (A-7).*

## Hors périmètre

### Gouverner ce dépôt par sa propre charte

L'idée était de traiter ce dépôt comme n'importe quel projet gouverné : lui créer un `.AIRules/`
conforme à A-1 — index, contexte, journal, roadmap, `PROFIL.md`, plus les deux copies conformes — et
un fichier d'instructions à sa racine (A-11) pour accueillir une session qui démarre directement
ici plutôt que depuis le workspace.

> **❗ Écarté : appliquer A-1 ici fabriquerait la duplication qu'A-2 interdit**
>
> Un `.AIRules/` dans ce dépôt contiendrait une **copie conforme de `GOUVERNANCE-IA.md` et de
> `GABARITS.md` posée à côté des originaux**, dans le seul dépôt au monde où ces fichiers *sont*
> l'original. Deux emplacements pour le même contenu, dont l'un se réviserait un jour sans l'autre :
> exactement le mécanisme qu'A-2 existe pour empêcher, et il frapperait la charte elle-même.
>
> Les quatre documents doubleraient de même ce que ce dépôt porte déjà à sa racine — le `CHANGELOG.md`
> **est** son journal, `ROADMAP.md` **est** sa roadmap, le `README.md` **est** son index. Quant au
> `PROFIL.md`, il demanderait de trancher toutes les options de la partie B, dont la plupart n'ont
> pas d'objet pour un dépôt qui ne produit aucun logiciel.
>
> A-1 vise un **dépôt de projet** : celui-ci est le dépôt de la charte. Il applique ce qu'elle dit là
> où c'est du sens — identifiants stables, ajout seul du changelog, propagation verbatim, régimes de
> révision — sans se plier à la forme qu'elle prescrit à ses sujets.

Ce qui est assumé avec cette exclusion : une session ouverte directement dans ce dépôt n'y trouve
aucun fichier auto-chargé qui lui dise quoi lire. En pratique, deux chemins couvrent le cas — le
fichier d'instructions du workspace, qui décrit ce dépôt et ce qui vit dedans, et la section
« Démarrer » du `README.md` pour qui arrive de l'extérieur par un `git clone`.
