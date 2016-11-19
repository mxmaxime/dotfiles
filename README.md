# Dotfiles
Ce dépôt contient ma configuration. Il me suffit ensuite de cloner ce dépôt pour remettre mes préférences sur un serveur.

## Remapper les touches du clavier
J'utilise cette astuce pour remplacer la touche puissance 2 par un back-tick (développeur javascript dans l'âme). <br />
```bash
# Génération du fichier map
xmodmap -pke > ~/.Xmodmap

# Chercher la clef correspondant à la touche à remapper
xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'

# Changement du fichier ~/.Xmodmap

# Reload la configuration
xmodmap ~/.Xmodmap
```
## Exemple :
Le back-tick correspond à `16 grave` et la puissance 2 à `49 twosuperior`. <br />
Je cherche la ligne correspondant à la clef `49` et je la modifie :
`keycode 49 = grave`

