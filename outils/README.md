# Outils de poste de travail

Ces fichiers ne relèvent pas de la gouvernance d'un projet : ils concernent l'environnement
de travail. Ils vivent ici parce que ce dépôt est le seul endroit stable qui les suive, et
ils **ne se propagent pas** dans les `.AIRules/` des projets — contrairement à
[`GOUVERNANCE-IA.md`](../GOUVERNANCE-IA.md) et [`GABARITS.md`](../GABARITS.md).

## Statusline

Affiche en permanence, sous le prompt, le niveau de consommation de contexte et de quota —
sans avoir à le demander.

```
[████████░░]  78% Tkn | Opus 5 · master
[███░░░░░░░]  31% 5H  | 02h 14m
[█░░░░░░░░░]  12% 7D  | 4j
```

Une ligne par indicateur : contexte consommé, quota court terme, quota long terme. La barre
passe du vert à l'orange à 50 %, au rouge à 80 %. La première ligne affiche le modèle actif
et, dans un dépôt Git, la branche courante.

### Installation

```sh
cp outils/statusline-command.sh ~/.claude/statusline-command.sh
chmod +x ~/.claude/statusline-command.sh
```

Puis fusionner le contenu de `outils/settings-statusline.json` dans
`~/.claude/settings.json` — c'est un **fragment**, pas un fichier complet : il ajoute une
clé `statusLine`, il ne remplace pas les réglages existants.

### `refreshInterval`

En secondes. Ajoute un rafraîchissement périodique **en plus** des mises à jour
événementielles déjà déclenchées par l'outil (démarrage ou reprise de session, nouveau
message, compactage, changement de mode). Ce n'est pas un réglage de debounce sur ces
événements — il n'en existe pas.

Concrètement, tant que la session est inactive, le script est relancé toutes les N secondes.
Comme il lance un processus qui exécute lui-même un appel à `git`, une valeur trop basse le
fait tourner en continu en arrière-plan pour un gain nul : une variation de quota à la
seconde près n'a aucune valeur pratique. **`5` reste réactif sans ce coût.**

### Pourquoi un wrapper `bash` qui délègue à Node

Les caractères de barre (`█`, `░`) et les séquences ANSI passent mal par certains shells,
notamment sous Windows. Node les émet correctement quelle que soit la plateforme. Le script
bash n'existe que pour cette délégation.

### Entrée attendue

Le script lit sur son entrée standard le JSON fourni par Claude Code, dont il utilise :

| Champ | Usage |
|---|---|
| `model.display_name` | nom du modèle affiché en fin de première ligne |
| `workspace.current_dir` | répertoire où interroger la branche Git |
| `context_window.used_percentage` | barre `Tkn` |
| `rate_limits.five_hour` | barre `5H` et temps avant remise à zéro |
| `rate_limits.seven_day` | barre `7D`, en jours seuls au-delà de 24 h |

Un champ absent fait disparaître sa ligne plutôt que d'afficher une valeur fausse.
