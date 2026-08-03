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

- **L'archivage (A-9) n'est pas une alternative à ce chantier.** L'hypothèse était que le volume
  venait de l'accumulation et qu'A-9 le résorberait sans toucher au format. Aucun chantier n'a plus
  de quinze jours dans aucun des deux journaux : il n'y a rien à archiver. A-9 traitera l'ancienneté,
  il ne traite pas ce qui gonfle ces fichiers aujourd'hui.
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
- **Les journaux existants** — *instruit : le coût est plus élevé qu'il n'y paraissait*. A-4 interdit
  de réécrire une entrée écrite, donc le format log ne s'applique qu'aux entrées **nouvelles**.
  L'échappatoire envisagée — passer l'ancien en `archive/` (A-9) — **n'est pas disponible** : rien
  n'est archivable avant longtemps, la mesure le montre. Les journaux existants cohabiteront donc
  durablement avec deux formats, et c'est le vrai prix de la révision. Le choix se fait une fois,
  dans la révision, pas projet par projet.

*À vérifier avant d'écrire quoi que ce soit : que la précision survit réellement. Reprendre deux ou
trois entrées longues d'un journal existant, les réduire au format log, et regarder ce qui saute —
si ce qui saute est du remplissage, l'idée tient ; si c'est une décision ou une cause, elle ne tient
pas sous cette forme.*

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
