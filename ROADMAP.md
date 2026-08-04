# Roadmap

*Dernière revue : 2026-08-04.*

Ce que la charte et les gabarits **pourraient** devenir : idées non tranchées, révisions envisagées,
décisions de périmètre. Ce qui a déjà changé est dans [`CHANGELOG.md`](./CHANGELOG.md) ; ce qui
s'applique aujourd'hui est dans [`GOUVERNANCE-IA.md`](./GOUVERNANCE-IA.md) et
[`GABARITS.md`](./GABARITS.md). Cette page ne répète ni l'un ni l'autre.

Comme le changelog, elle **ne voyage pas** dans les `.AIRules/` des projets : une idée qui n'est pas
encore une règle n'a rien à faire dans le dossier qui dit ce qui s'applique.

## Vue d'ensemble

| Chantier | Statut | Priorité |
|---|---|---|
| [Gouverner ce dépôt par sa propre charte](#gouverner-ce-dépôt-par-sa-propre-charte) | Écarté | Sans objet |

Aucun chantier ouvert actuellement — la réforme d'amaigrissement de la roadmap est close, son
récit vit dans [`CHANGELOG.md`](./CHANGELOG.md).

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
