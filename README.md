# Dotfiles
Ce dépôt contient ma configuration, qui **n'a pas pour but d'être modulable mais de répondre à mes besoins**. Ce dépôt peut **vous inspirer pour vos configurations**. J'essaie le plus possible de documenter.

# Installation
- cloner le dépôt : `git clone git@github.com:EmixMaxime/dotfiles.git`
- créer des liens symboliques

## Liens symboliques
Commandes à lancer depuis le dossier du clone
```shell
ln -s ./dotfiles/.tmux.conf ~/
ln -s ./dotfiles/.zshrc ~/
```

# Outils de développement
## Editeurs
- Éditeur principal : [Visual Studio Code](https://code.visualstudio.com) qui offre une belle interface ainsi qu'une auto-complétion correcte sur mes langages principaux.
- Ancien éditeur : [SublimeText](https://www.sublimetext.com/) qui m'a comblé pendant des années. Malheureusement il ne répond plus à mes besoins actuels. **Sa rapidité et fluidité ne cessera de me séduir !**.

## IDE
- [IntelliJ IDEA](https://www.jetbrains.com/idea/) qui répond parfaitement à mes besoins. Un IDE pour effectuer toutes mes tâches : développement Java, PHP, JavaScript...

## Colors schemes / font familly
Passant des heures et des heures devant des lignes de code **j'aime le changement**. C'est pour cela que j'utilise beaucoup de thèmes de couleur et de fonts.
### Colors schemes 
- Mon thème préféré reste [Dracula](https://draculatheme.com/).
- [Material](https://github.com/equinusocio/material-theme), disponible également sur [vscode](https://marketplace.visualstudio.com/items?itemName=ms-vscode.Theme-MaterialKit), la suite [Jetbrains](https://github.com/ChrisRM/material-theme-jetbrains) ect...
- [Atom One Dark Theme](https://github.com/atom/one-dark-syntax), aussi pour [vscode](https://marketplace.visualstudio.com/items?itemName=akamud.vscode-theme-onedark), et la même version en light.

### Fonts Familly
- [Hasklig](https://github.com/i-tu/Hasklig) qui mixe Source Code Pro et Fira Code (le mélange parfait pour moi !).
- [Source Code Pro](https://github.com/adobe-fonts/source-code-pro).
- [Fira Code](https://github.com/tonsky/FiraCode).
- [Deja Vu Sans Code](https://github.com/SSNikolaevich/DejaVuSansCode).

# Le terminal
J'utilise le terminal de xfce, il est très léger je n'ai pas besoin de plus.
J'ai déjà essayé [Terminator](https://doc.ubuntu-fr.org/terminator) qui propose un système similaire à Tmux qui se veut plus simple mais je préfère le petit terminal de xfce et ajouter ma configuration tmux que je retrouve sur toutes les machines où je travaille.
Ceci étant dit, j'utilise souvent Terminator avec tmux...
Ma configuration de ce terminal est disponible sur ce dépôt : `config/xfce4/terminal/terminalrc`.

Pour l'appliquer il suffit de copier ce fichier :
```shell
cp config/xfce4/terminal/terminalrc ~/config/terminal/xfce4/terminal
```

# Le Shell : ZSH
Il en existe beaucoup, Bash (celui par défaut sur ubuntu debian...), Fish, Csh ect... Alors, pourquoi Zsh ?

Tout simplement parce que lorsque je suis arrivé dans le monde unix je cherchais un shell meilleur que bash, j'ai googler et j'ai trouvé zsh, c'est le plus populaire.
Celui-ci répondant parfaitement à mes besoins je ne sens pas la nécessité de changer, puis vu le temps que j'ai passé à le configurer je n'ai vraiment pas envie de le lâcher !
## Installation
Rien de plus simple 
```shell
sudo apt-get install zsh
```

## Utilisation
Une fois Zsh installé, notre shell reste Bash. Pour changer, il suffit de tapper `zsh`.


Lors du premier lancement il va vous interroger sur comment créer le fichier de configuration. Je recommande l'option (2), zsh va générer pour vous une configuration de base documentée.

## Changement du shell par défaut
Zsh est installé, c'est bien. Cependant, vous pouvez remarquer que votre shell est toujours celui par défaut du votre système (généralement `/bin/bash`, à vérifier avec `echo $SHELL`). Voici comment changer ce shell pour zsh :

```shell
chsh -s $(which zsh)
```

Cela a pour effet de modifier le shell par défaut pour l'utilisateur courant (donc vous même). Si vous souhaitez le changer aussi pour l'utilisateur `root` il suffit d'exécuter la même commande avec cet utilisateur :

```shell
sudo !!
```

## divers
```
cd /var/log
cd log local # -> cd /var/local

setopt # voir les options activés   
unsetopt # voir les options pas activés

# Themes
prompt -l # affiche les themes disponibles
prompt bart # change le thème sur cette session de terminal
# pour que ce soit "définitif" : changer le prompt du .zshrc
```

# Oh-my-zsh
Pour l'installation, encore une fois rendez vous sur [le dépôt](https://github.com/robbyrussell/oh-my-zsh).

## Les plugins
- [Zsh syntax highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md) qui permet d'avoir une coloration syntaxique des commandes, c'est très confortable. `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`.

- [Zsh autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) qui m'évite de répéter 100 fois les mêmes commandes tous les jours. `git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions`.



## Thème oh-my-zsh
J'utilise le thème [pure](https://github.com/sindresorhus/pure).

# Powerline
```
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
sudo mv PowerlineSymbols.otf /usr/share/fonts/
sudo fc-cache -vf
sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/
```

# Tmux
```
sudo apt-get install tmux
# vérifier que c'est bien la dernière version d'installée (2.x)
sudo apt-cache policy tmux
# ou
sudo apt-cache madison tmux
```

## Tmux plugin manager
Pourquoi un plugin manager ? Pour se simplifier la vie... Il me suffit d'ajouter une ligne dans mon fichier `tmux.conf` et de lancer une ligne de commande afin d'installer un plugin.

Pour suivre les instructions de téléchargement, rendez vous sur le [dépôt github](https://github.com/tmux-plugins/tpm).
Ceci étant dit, **tpm s'installe automatiquement** grâce à la configuration de tmux. Vous n'avez donc juste qu'à faire un coup de `CTRL+b puis I`, ou `~/.tmux/plugins/tpm/bin/install_plugins` pour installer les plugins.
- [Gestion des plugins grâce aux lignes de commande](https://github.com/tmux-plugins/tpm/blob/master/docs/managing_plugins_via_cmd_line.md).

## Plugins Tmux
- [Resurrect](https://github.com/tmux-plugins/tmux-resurrect) qui permet de sauvegarder un environnement.
Commandes que j'utilise très souvent :
  - `CTRL+b puis CTRL+s` : pour sauvegarder une session.
  - `CTRL+b puis CTRL+r` : restaurer les sessions
  - `CTRL+b puis s` : lister les sessions (ce n'est pas de ce plugin mais de tmux ;-))
# Panes
ctrlb + "
ctrlb + %
ctrlb + flèches directionnelles

ctrld ou exit ferme une panes ou si c'est la dernière ferme tmux

ctrlb + ? = help -> q = exit

Créé une nouvelle fenêtre :
ctrlb + c

Naviguer entre les fenêtres :
ctrlb + p (previous) / n (next)

https://youtu.be/mdIrm8TPK44?t=1141

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

# Audio

## Logiciels
- (Pavucontrol pour gérer pulseAudio graphiquement)[https://doc.ubuntu-fr.org/pavucontrol]

## Fix problème
Parfois le son se met à foirer, grésillements...

```shell
pulseaudio -k && sudo alsa force-reload
```

