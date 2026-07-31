# Roadmap

*Dernière revue : 2026-07-31.*

Ce que la charte et les gabarits **pourraient** devenir : idées non tranchées, révisions envisagées,
décisions de périmètre. Ce qui a déjà changé est dans [`CHANGELOG.md`](./CHANGELOG.md) ; ce qui
s'applique aujourd'hui est dans [`GOUVERNANCE-IA.md`](./GOUVERNANCE-IA.md) et
[`GABARITS.md`](./GABARITS.md). Cette page ne répète ni l'un ni l'autre.

Comme le changelog, elle **ne voyage pas** dans les `.AIRules/` des projets : une idée qui n'est pas
encore une règle n'a rien à faire dans le dossier qui dit ce qui s'applique.

## Vue d'ensemble

| Chantier | Statut | Priorité |
|---|---|---|
| [`AI-HISTORY` au format log obligatoire](#ai-history-au-format-log-obligatoire) | Prévu — idée, design à établir | Non datée |

## Non daté — à faire quand utile

### `AI-HISTORY` au format log obligatoire

Rendre obligatoire, pour le journal, un **format de log** : une entrée tient sur **une ligne**,
dense, sans balisage riche — plus léger que ce que produit le gabarit actuel, et censé rester tout
aussi précis.

Ce que fait le gabarit aujourd'hui : un tableau `Date | Hash | Résumé` par chantier, avec un
paragraphe de contexte optionnel au-dessus. **Rien ne borne la cellule `Résumé`**, et l'usage réel
l'a remplie de paragraphes entiers — gras, liens d'ancre, sous-parties. Ordre de grandeur observé sur
un projet du workspace : 59 entrées réparties en 18 chantiers occupent 842 lignes et 65 Ko de HTML,
soit une quinzaine de lignes par entrée. Le coût n'est pas seulement l'écriture : c'est un document
que la charte fait relire, et qu'on ne relit plus d'un bout à l'autre passé cette taille.

Ce qui reste à trancher :

- **Ce qui borne une ligne.** Longueur maximale, une phrase, ou une liste de champs fixes ? Sans
  borne écrite, le format log dérivera exactement comme la colonne `Résumé` a dérivé.
- **Le groupement par chantier.** Un log est plat et chronologique ; le gabarit actuel groupe par
  chantier, l'ordre chronologique ne valant qu'à l'intérieur d'un groupe. Soit `Chantier` devient un
  champ de la ligne, soit le groupement survit et le « log » ne l'est qu'à l'intérieur d'une section.
- **Le paragraphe de contexte de chantier.** Il porte le *pourquoi* d'un chantier — qui l'a signalé,
  ce qui l'a déclenché. S'il disparaît du journal, il doit atterrir quelque part (roadmap ? contexte ?)
  ou être assumé comme perdu ; A-2 interdit de le laisser exister à deux endroits.
- **Les liens d'ancre** vers un piège du contexte ou un chantier de la roadmap : conservés sous une
  forme courte, ou abandonnés ? C'est une part réelle de la précision actuelle.
- **La portée de « obligatoire ».** Si le format s'impose quel que soit l'option `format`, la révision
  touche le noyau ou le gabarit commun : régime de propagation qui **se propose** projet par projet,
  jamais d'office (A-7). Si ce n'est qu'une nouvelle valeur d'option, la révision est additive.
- **Les journaux existants.** A-4 interdit de réécrire une entrée écrite. Le format log ne peut donc
  s'appliquer qu'aux entrées **nouvelles** : un journal existant vivra avec deux formats, à moins de
  passer l'ancien en `archive/` (A-9). Le choix se fait une fois, dans la révision, pas projet par
  projet.

*À vérifier avant d'écrire quoi que ce soit : que la précision survit réellement. Reprendre deux ou
trois entrées longues d'un journal existant, les réduire au format log, et regarder ce qui saute —
si ce qui saute est du remplissage, l'idée tient ; si c'est une décision ou une cause, elle ne tient
pas sous cette forme.*
