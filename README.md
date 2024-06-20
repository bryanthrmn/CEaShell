# CEaShell [![Discord Chat Link](https://img.shields.io/discord/1012426214226530424?logo=discord)](https://discord.gg/RDTtu258fW) [![Release](https://img.shields.io/github/v/release/RoccoLoxPrograms/CEaShell?include_prereleases)](https://github.com/roccoloxprograms/shell/releases/latest)

CEaShell (pronounced like "Seashell") is a new shell for the TI-84 Plus CE. It aims to provide a modern, sleek, and easy to use UI, which is understandable by any user regardless of previous experience or calculator-related knowledge. To get help, suggest a feature, or report a bug, join the discord!

## Screenshots

![Modern UI](screenshots/shell.gif "Modern UI")    ![OS Enhancements](screenshots/osFileInfo.gif "OS Enhancements")
![Manage File Properties](screenshots/fileInfo.png "Manage File Properties")      ![Scalable UI](screenshots/scalableUI.gif "Scalable UI")
![Custom Themes](screenshots/customTheme.gif "Custom Themes")      ![Personalized Settings](screenshots/settings.gif "Personalized Settings")

## Features

* Customizable color themes, including preset themes and the ability to create fully custom themes.
* Four scales for displaying files in the shell, allowing for viewing up to 18 files at once.
* Program and app running.
* Viewing and modifying of file information. (Archiving / unarchiving, hiding / unhiding, locking / unlocking, renaming, deleting, editing)
* File searching.
* Integration with [HexaEdit](https://github.com/captain-calc/HexaEdit-CE) to open files in hex editor, if the user has HexaEdit installed on their calculator.
* Creating and copying of programs and AppVars.
* Turning off the calculator while in the shell, and returning to the shell after turning the calculator back on.
* Option to view icons, descriptions, and file size in the TI-OS [apps] and [prgm] menus.
* [Shortcuts](#shortcuts) in TI-OS to launch the shell, invert OS colors, trigger APD, and jump to labels in the TI-OS program editor.
* Option to allow editing of archived programs in TI-OS.
* Option to allow editing of locked programs in CEaShell.
* Fast alpha scrolling in the TI-OS editor.
* Option to hide the "Programming" menu on Python calculators, skipping directly to a TI-BASIC menu like non-Python calcs.
* Option to disable the busy indicator when running TI-BASIC programs through CEaShell.
* Option to enable lowercase in TI-OS.

## Installation

~~1. Download the latest version of CEaShell from [the GitHub releases page](https://github.com/roccoloxprograms/CEaShell/releases/latest).~~
1. Clone and build CEaShell, following [these instructions](#building-ceashell).
2. Send **CEASHELL.8xp** and **AppInstA.8xv** to your calculator using TI-Connect CE or TiLP. If you don't have the [CE C libraries](https://tiny.cc/clibs), you'll need to download and send those as well.
3. Run **prgmCEASHELL** from the programs menu (You will need to use the [arTIfiCE jailbreak](https://yvantt.github.io/arTIfiCE) if you are on an OS version 5.5 and above).
4. CEaShell will be installed in the apps menu.

## Uninstalling

1. Open the memory management menu by pressing <kbd>2nd</kbd>, <kbd>+</kbd>, <kbd>2</kbd>.
2. Scroll down until you find an option "Apps".
3. Press <kbd>enter</kbd> and then find CEaShell.
4. Press <kbd>del</kbd> and then press <kbd>2</kbd>.
5. Exit the memory management menu by pressing <kbd>clear</kbd>.

## Navigation

Below is a table with keys and their various usage in CEaShell:

| Key                                                                       | Action performed                                                                                                   |
|---------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------|
| <kbd>2nd</kbd> / <kbd>enter</kbd>                                         | Run programs, toggle/select items in menus.                                                                        |
| <kbd>↑</kbd>, <kbd>↓</kbd>, <kbd>←</kbd>, <kbd>→</kbd>                    | Scroll through options or menus.                                                                                   |
| <kbd>y=</kbd>                                                             | Open/exit customization menu.                                                                                      |
| <kbd>graph</kbd>                                                          | Open/exit settings menu.                                                                                           |
| <kbd>alpha</kbd> / <kbd>window</kbd> / <kbd>zoom</kbd> / <kbd>trace</kbd> | View and modify file properites.                                                                                   |
| <kbd>del</kbd>                                                            | Delete currently selected file, or delete the character in front of the cursor in a text input box.                |
| <kbd>mode</kbd>                                                           | Create a new file or copy the currently selected one, or backspace in a text input box.                            |
| <kbd>vars</kbd>                                                           | Quickly open the currently selected file in the TI-OS editor, if the file can be edited.                           |
| <kbd>clear</kbd>                                                          | Exit CEaShell or return to the previous menu. To exit CEaShell from anywhere in the shell, press and hold.         |
| <kbd>a</kbd> - <kbd>z</kbd>, <kbd>θ</kbd>                                 | Jump to the program beginning with the letter pressed.                                                             |
| <kbd>on</kbd>                                                             | Turn off the calculator while remaining in the shell.                                                              |
| <kbd>stat</kbd>                                                           | Search for a file. For example, searching "ABC" will list all files beginning with "ABC" in the current directory. |

## Creating custom themes

1. To create a custom theme, first open the customization menu using <kbd>y=</kbd>.
2. Scroll and find "Custom theme", then press <kbd>2nd</kbd> or <kbd>enter</kbd> to open the theme creator.
3. While in the theme creator, use the <kbd>mode</kbd> button to toggle which UI element's color is being modified. Move the color selector using the <kbd>↑</kbd>, <kbd>↓</kbd>, <kbd>←</kbd>, or <kbd>→</kbd> keys.
4. When you are satisfied with your color choices, press either <kbd>2nd</kbd> or <kbd>enter</kbd> to save the changes. If you wish to exit the theme picker without saving your changes, press <kbd>clear</kbd> instead.

## Shortcuts

If the option **[on] Shortcuts** is enabled in CEaShell, the follow key combinations will preform specific utilities in the OS:

| Key combination                             | Action performed                                                                                               |
|---------------------------------------------|----------------------------------------------------------------------------------------------------------------|
| <kbd>on</kbd> + <kbd>prgm</kbd>             | Launch CEaShell.                                                                                               |
| <kbd>on</kbd> + <kbd>sto →</kbd>            | Invert OS colors ("Dark mode").                                                                                |
| <kbd>on</kbd> + <kbd>ln</kbd>               | Un-invert OS colors.                                                                                           |
| <kbd>on</kbd> + <kbd>stat</kbd>             | Turn off the calculator, and preserve where you were in the OS.                                                |
| <kbd>on</kbd> + <kbd>graph</kbd>            | Jump to a program label in the OS program editor.                                                              |
| <kbd>on</kbd> + <kbd>0</kbd> - <kbd>9</kbd> | Launch the program or app assigned to the number key pressed. Files can be assigned a number in the info menu. |

## Building CEaShell

To build CEaShell, you will need to install the latest version of the [CE C toolchain](https://ce-programming.github.io/toolchain/index.html). Instructions to install the toolchain can be found [here](https://ce-programming.github.io/toolchain/static/getting-started.html#installing-the-ce-toolchain). You will also need to use the latest version of [convimg](https://github.com/mateoconlechuga/convimg).

<br />

1. Clone CEaShell with the **app_tools** submodule by running `git clone --recurse-submodules https://github.com/RoccoLoxPrograms/CEaShell`
2. If you are using an OS that uses `python3` insead of `python`, open **app_tools/makefile** and change `PYTHON_VER := python` to `PYTHON_VER := python3`.
3. If you would like to build the French version of CEaShell, open CEaShell's **makefile** (not the **app_tools** one) and change `LANGUAGE = EN` to `LANGUAGE = FR`.
4. In a command line, `cd` into the cloned repository, and run `make gfx`.
5. Once complete, run `make`. The compiled binaries will be in the newly created **bin** directory.


## Bugs

If you encounter a bug while using CEaShell, don't hesitate to [make an issue](https://github.com/RoccoLoxPrograms/CEaShell/issues) or report it on the [Discord server](https://discord.gg/RDTtu258fW).
Feel free to request features or ask for help on the discord or in the [Cemetech topic](https://ceme.tech/t18820) as well!

## Translation

CEaShell has also been translated to French by [Shadow](https://github.com/Bryankaveen).

## Credits

A more detailed credits can be found in CEaShell. [**app_tools**](https://github.com/commandblockguy/app_tools) is created by [commandblockguy](https://github.com/commandblockguy/), and some of the assembly was written by [MateoConLechuga](https://github.com/mateoconlechuga/).

© 2022 - 2024 RoccoLox Programs and TIny_Hacker


# FRENCH VERSION
# CEaShell [![Lien de chat Discord](https://img.shields.io/discord/1012426214226530424?logo=discord)](https://discord.gg/RDTtu258fW) [![Release](https://img.shields.io/github/v/release/RoccoLoxPrograms/CEaShell?include_prereleases)](https://github.com/roccoloxprograms/shell/releases/latest)

CEaShell (prononcé "Seashell") est un nouveau shell pour la TI-83 Premium CE et la TI-84 Plus CE (Edition Python). Il vise à fournir une interface utilisateur moderne, élégante et facile à utiliser, compréhensible par tout utilisateur, quelle que soit son expérience ou ses connaissances en matière de calculatrice. Pour obtenir de l'aide, suggérer une fonctionnalité ou signaler un bug, rejoignez notre Discord !

## Captures d'écran

![UI Moderne](screenshots/shell.gif "UI Moderne") ![Améliorations de l'OS](screenshots/osFileInfo.gif "Améliorations de l'OS")
![Gérer les propriétés des fichiers](screenshots/fileInfo.png "Gérer les propriétés des fichiers") ![UI scalable](screenshots/scalableUI.gif "UI scalable")
![Thèmes personnalisés](screenshots/customTheme.gif "Thèmes personnalisés") ![Paramètres personnalisés](screenshots/settings.gif "Paramètres personnalisés")

## Fonctionnalités

* Thèmes de couleurs personnalisables, y compris des thèmes prédéfinis et la possibilité de créer des thèmes entièrement personnalisés.
* Quatre échelles pour afficher les fichiers dans le shell, permettant de voir jusqu'à 18 fichiers à la fois.
* Exécution de programmes et d'applications.
* Visualisation et modification des informations de fichiers (Archivage / désarchivage, masquage / démasquage, verrouillage / déverrouillage, renommage, suppression, édition).
* Recherche de fichiers.
* Intégration avec [HexaEdit](https://github.com/captain-calc/HexaEdit-CE) pour ouvrir des fichiers dans l'éditeur hexadécimal, si l'utilisateur a installé HexaEdit sur sa calculatrice.
* Création et copie de programmes et d'AppVars.
* Éteindre la calculatrice tout en étant dans le shell et retourner au shell après avoir rallumé la calculatrice.
* Voir les icônes, descriptions et taille des fichiers dans les menus [apps] et [prgm] de TI-OS.
* [Raccourcis](#shortcuts) dans TI-OS pour lancer le shell, inverser les couleurs de l'OS, déclencher l'APD et sauter aux étiquettes dans l'éditeur de programmes de TI-OS.
* Raccourcis personnalisés pour lancer des programmes et des applications.
* Activer l'édition des programmes archivés dans TI-OS.
* Permettre l'édition des programmes verrouillés dans CEaShell.
* Défilement rapide en alpha dans l'éditeur TI-OS.
* Capacité de masquer le menu "Programmation" sur les calculatrices Python, en passant directement à un menu TI-BASIC comme les calculatrices non-Python.
* Désactiver l'indicateur de charge lorsque vous exécutez des programmes TI-BASIC via CEaShell.
* Activer les minuscules dans TI-OS.

## Installation

1. Téléchargez la dernière version de CEaShell depuis [la page des sorties GitHub](https://github.com/roccoloxprograms/CEaShell/releases/latest), ou clonez et compilez CEaShell en suivant [ces instructions](#building-ceashell).
2. Envoyez **CEASHELL.8xp** et **AppInstA.8xv** à votre calculatrice en utilisant TI-Connect CE ou TiLP. Si vous n'avez pas les [bibliothèques CE C](https://tiny.cc/clibs), vous devrez les télécharger et les envoyer également.
3. Exécutez **prgmCEASHELL** depuis le menu des programmes (vous devrez utiliser le [jailbreak arTIfiCE](https://yvantt.github.io/arTIfiCE) si vous êtes sur une version OS 5.5 et supérieure).
4. CEaShell sera installé dans le menu des applications.

## Désinstallation

1. Ouvrez le menu de gestion de la mémoire en appuyant sur <kbd>2nde</kbd>, <kbd>+</kbd>, <kbd>2</kbd>.
2. Faites défiler vers le bas jusqu'à ce que vous trouviez une option "Apps".
3. Appuyez sur <kbd>enter</kbd> puis trouvez CEaShell.
4. Appuyez sur <kbd>suppr</kbd> puis appuyez sur <kbd>2</kbd>.
5. Quittez le menu de gestion de la mémoire en appuyant sur <kbd>annul</kbd>.

## Navigation

Voici un tableau avec les touches et leurs différentes utilisations dans CEaShell :

| Touche                                                                     | Action effectuée                                                                                                 |
|---------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------|
| <kbd>2nde</kbd> / <kbd>enter</kbd>                                         | Exécuter des programmes, basculer/sélectionner des éléments dans les menus.                                       |
| <kbd>↑</kbd>, <kbd>↓</kbd>, <kbd>←</kbd>, <kbd>→</kbd>                    | Faire défiler les options ou les menus.                                                                           |
| <kbd>y=</kbd>                                                             | Ouvrir/fermer le menu de personnalisation.                                                                        |
| <kbd>graph</kbd>                                                          | Ouvrir/fermer le menu des paramètres.                                                                             |
| <kbd>alpha</kbd> / <kbd>window</kbd> / <kbd>zoom</kbd> / <kbd>trace</kbd> | Voir et modifier les propriétés des fichiers.                                                                     |
| <kbd>suppr</kbd>                                                            | Supprimer le fichier actuellement sélectionné ou supprimer le caractère devant le curseur dans une zone de saisie.|
| <kbd>mode</kbd>                                                           | Créer un nouveau fichier ou copier celui actuellement sélectionné, ou effacer dans une zone de saisie.            |
| <kbd>vars</kbd>                                                           | Ouvrir rapidement le fichier actuellement sélectionné dans l'éditeur TI-OS, si le fichier peut être édité.        |
| <kbd>annul</kbd>                                                          | Quitter CEaShell ou revenir au menu précédent. Pour quitter CEaShell de n'importe où dans le shell, maintenez enfoncé.| 
| <kbd>a</kbd> - <kbd>z</kbd>, <kbd>θ</kbd>                                 | Aller au programme commençant par la lettre pressée.                                                             |
| <kbd>on</kbd>                                                             | Éteindre la calculatrice tout en restant dans le shell.                                                          |
| <kbd>stat</kbd>                                                           | Rechercher un fichier. Par exemple, rechercher "ABC" affichera tous les fichiers commençant par "ABC" dans le répertoire actuel.|

## Créer des thèmes personnalisés

1. Pour créer un thème personnalisé, ouvrez d'abord le menu de personnalisation en utilisant <kbd>y=</kbd>.
2. Faites défiler et trouvez "Custom theme", puis appuyez sur <kbd>2nd</kbd> ou <kbd>enter</kbd> pour ouvrir le créateur de thèmes.
3. Dans le créateur de thèmes, utilisez le bouton <kbd>mode</kbd> pour basculer l'élément UI dont la couleur est modifiée. Déplacez le sélecteur de couleur en utilisant les touches <kbd>↑</kbd>, <kbd>↓</kbd>, <kbd>←</kbd> ou <kbd>→</kbd>.
4. Lorsque vous êtes satisfait de vos choix de couleurs, appuyez sur <kbd>2nd</kbd> ou <kbd>enter</kbd> pour enregistrer les modifications. Si vous souhaitez quitter le sélecteur de thèmes sans enregistrer vos modifications, appuyez sur <kbd>clear</kbd>.

## Raccourcis

Si l'option **[on] Shortcuts** est activée dans CEaShell, les combinaisons de touches suivantes effectueront des utilités spécifiques dans l'OS :

| Combinaison de touches                      | Action effectuée                                                                                                  |
|---------------------------------------------|-------------------------------------------------------------------------------------------------------------------|
| <kbd>on</kbd> + <kbd>prgm</kbd>             | Lancer CEaShell.                                                                                                  |
| <kbd>on</kbd> + <kbd>sto →</kbd>            | Inverser les couleurs de l'OS ("Mode sombre").                                                                     |
| <kbd>on</kbd> + <kbd>ln</kbd>               | Désinverser les couleurs de l'OS.                                                                                  |
| <kbd>on</kbd> + <kbd>stat</kbd>             | Éteindre la calculatrice et conserver votre position dans l'OS.                                                    |
| <kbd>on</kbd> + <kbd>graph</kbd>            | Sauter à une étiquette de programme dans l'éditeur de programmes de l'OS.                                          |
| <kbd>on</kbd> + <kbd>0</kbd> - <kbd>9</kbd> | Lancer le programme ou l'application assigné à la touche numérique pressée. Les fichiers peuvent être assignés à un numéro dans le menu d'informations. |

## Construction de CEaShell

Pour "construire" CEaShell, vous devrez installer la dernière version de [l'outil CE C](https://ce-programming.github.io/toolchain/index.html). Les instructions pour installer l'outil se trouvent [ici](https://ce-programming.github.io/toolchain/static/getting-started.html#installing-the-ce-toolchain). Vous devrez également utiliser la dernière version de [convimg](https://github.com/mateoconlechuga/convimg).

<br />

1. Clonez CEaShell avec le sous-module **app_tools** en exécutant `git clone --recurse-submodules https://github.com/RoccoLoxPrograms/CEaShell`
2. Si vous utilisez un OS qui utilise `python3` au lieu de `python`, ouvrez **app_tools/makefile** et changez `PYTHON_VER := python` en `PYTHON_VER := python3`.
3. Si vous souhaitez construire la version française de CEaShell, ouvrez le **makefile** de CEaShell (pas celui de **app_tools**) et changez `LANGUAGE = EN` en `LANGUAGE = FR`.
4. Dans une ligne de commande, `cd` dans le dépôt cloné, et exécutez `make gfx`.
5. Une fois terminé, exécutez `make`. Les binaires compilés seront dans le nouveau répertoire **bin**.

## Bugs

Si vous rencontrez un bug en utilisant CEaShell, n'hésitez pas à [ouvrir un dossier (issue)](https://github.com/RoccoLoxPrograms/CEaShell/issues) ou à nous le signaler sur notre [serveur Discord](https://discord.gg/RDTtu258fW).

## Traduction

CEaShell a également été traduit en français par [Shadow](https://github.com/Bryankaveen).

## Crédits

Des crédits plus détaillés peuvent être trouvés dans CEaShell. [**app_tools**](https://github.com/commandblockguy/app_tools) a été créé par [commandblockguy](https://github.com/commandblockguy/), et une partie de l'assemblage a été écrite par [MateoConLechuga](https://github.com/mateoconlechuga/).

© 2022 - 2024 RoccoLox Programs et TIny_Hacker
