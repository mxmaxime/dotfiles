# Dotfiles
Ce dépôt contient ma configuration, qui n'a pas pour but d'être modulable mais de répondre à mes besoins. Ce dépôt peut vous inspirer pour vos configurations. J'essaie le plus possible de les documenter.

# Installation
- cloner le dépôt : `git clone git@github.com:EmixMaxime/dotfiles.git`
- créer des liens symboliques

## Liens symboliques
Commandes à lancer depuis le dossier du clone
```shell
ln -s ./dotfiles/.tmux.conf ~/
ln -s ./dotfiles/.zshrc ~/
```

# Remapper les touches du clavier
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

