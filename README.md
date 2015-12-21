# [Gabo](https://github.com/gaboesquivel)’s dotfiles

__This is a work in progress!__

I maintain this repo as my dotfiles. You're quite [welcome to make suggestions](#feedback), however I may decline if it's not of personal value to me. If you're starting off also consider forking one of these other [other great setups](#acknowledgements)

These are the base dotfiles that I use. For more specific local needs I use the `.local`
files described in the [`Local Settings`](#local-settings) section.

## Setup / Installation

The setup process in based on [alrra's dotfiles](https://github.com/alrra/dotfiles) setup.
To setup the dotfiles just run the appropriate snippet in the
terminal:

(:warning: **DO NOT** run the setup snippet if you don't fully
understand [what it does](dotfiles). Seriously, **DON'T**!)

| OS | Snippet |
|:---:|:---|
| OS X | `bash -c "$(curl -LsS https://raw.github.com/gaboesquivel/dotfiles/master/dotfiles)"` |
| Ubuntu | `bash -c "$(wget -qO - https://raw.github.com/gaboesquivel/dotfiles/master/dotfiles)"` |

That's it! :sparkles:

The setup process will:

* Download the dotfiles on your computer (by default it will suggest
  `~/projects/dotfiles`)
* Create some additional [directories](os/create_directories.sh)
* [Symlink](os/create_symbolic_links.sh) the
  [git](git),
  [zsh](zsh), and
  [vim](vim) files
* Install applications / command-line tools for
  [OS X](os/os_x/installs/main.sh) /
  [Ubuntu](os/ubuntu/installs/main.sh)
* Set custom
  [OS X](os/os_x/preferences/main.sh) /
  [Ubuntu](os/ubuntu/preferences/main.sh) preferences
* Install [vim plugins](vim/vim/plugins)

<table>
    <tbody>
        <tr><td colspan="2">Setup process in action</tr></td>
        <tr>
            <td>
                <img src="https://cloud.githubusercontent.com/assets/1223565/8509030/c79a6fd2-2293-11e5-8132-46effb733dfa.gif" alt="Setup process on OS X" width="100%">
            </td>
            <td>
                <img src="https://cloud.githubusercontent.com/assets/1223565/8509024/ac135b5c-2293-11e5-8bac-f10103af2948.gif" alt="Setup process on Ubuntu" width="100%">
            </td>
        </tr>
    </tbody>
</table>

## Customize

### Local Settings

The dotfiles can be easily extended to suit additional local
requirements by using the following files:

#### `~/.gitconfig.local`

If the `~/.gitconfig.local` file exists, it will be automatically
included after the configurations from `~/.gitconfig`, thus, allowing
its content to overwrite or add to the existing `git` configurations.

__Note:__ Use `~/.gitconfig.local` to store sensitive information such
as the `git` user credentials, e.g.:

```bash
[user]
    name = Gabo Esquivel
    email = hello@gaboesquivel.com
```

#### `~/.vimrc.local`

If the `~/.vimrc.local` file exists, it will be automatically sourced
after `~/.vimrc`, thus, allowing its content to add or overwrite the
settings from `~/.vimrc`.

#### `~/.gvimrc.local`

Same as `~/.vimrc.local` but for `~/.gvimrc`.

### Do this: OSX

#### Remap caps-lock to escape with [Seil](https://pqrs.org/osx/karabiner/seil.html.en)
The escape key is the single most used key in vim.  Old keyboards used to have Escape where Tab is today. Apple keyboards are the worst with their tiny Esc keys. But all this is fixed by remapping Caps to Escape.  If you're hitting a small target in the corner, you are slowing yourself down considerably, and probably damaging your hands with repetitive strain injuries.

[StackOverflow: Using Caps Lock as Esc in Mac OS X : Walk-Through](http://stackoverflow.com/questions/127591/using-caps-lock-as-esc-in-mac-os-x)

#### Speed Up your Key Repeat with [Karabiner](https://pqrs.org/osx/karabiner/)

Basic Configuration > Key Repeat

![karabiner setting](https://infinit.io/_/JiMuYpr.png)

#### Set up a system wide hotkey for iTerm (Keys=>Hotkey)
Recommended Cmd-Escape, which is really Cmd-Capslock.

iTerm2 offers a special terminal window that is always available with a single keystroke. This window is called the "hotkey window" and is most commonly used for occasional administrative tasks. To enable this feature, go to Preferences > Keys. Enable "Show/Hide iTerm2 with a system-wide hotkey". Click in the field and enter the key combination you'd like to use. Then check "hotkey toggles a dedicated window with profile:". A new profile will be created that is optimized for the feature. Pressing the hotkey will drop a terminal window down from the top of the screen, and pressing it again (or clicking in any other window) causes it to disappear.

#### in MacVim, uncheck Prefer native fullscreen under Advanced settings
Same as iTerm. The Lion style spaces navigation slows everything down for no reason.


## Update

To update the dotfiles you can either run the [`dotfiles`
script](dotfiles) or, if you want to just update one particular part,
run the appropriate [`os` script](os).

## Feedback

Suggestions/improvements
[welcome](https://github.com/gaboesquivel/dotfiles/issues)!

Contributions are always welcome in the form of pull requests with explanatory comments.

### Forks

If you decide to fork this project, don't forget to substitute my
username with your own in the [setup snippets](#setup) and [in the
`dotfiles` script](https://github.com/gaboesquivel/dotfiles/blob/master/dotfiles#L3).


## Acknowledgements

Inspiration and code was taken from many sources, including:

* [YADR](https://github.com/skwp/dotfiles)
* [Mathias Bynens dotfiles](https://github.com/mathiasbynens/dotfiles)
* [Cătălin Mariș dotfiles](https://github.com/alrra/dotfiles)  
* [Nick Nisi dotfiles](https://github.com/nicknisi/dotfiles)
* [Mike Coutermarsh dotfiles](https://github.com/mscoutermarsh/dotfiles)
* [Paul Irish dotfiles](https://github.com/paulirish/dotfiles)
* [Addy Osmani dotfiles](https://github.com/addyosmani/dotfiles)  
* [Adam Eivy dotfiles](https://github.com/atomantic/dotfiles)
* [Holman dotfiles](https://github.com/holman/dotfiles)

If you're interested in the philosophy behind why projects like these are awesome, you might want to [holman's post on the subject](http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/).

## Resources
* [Video: Learning Vim in a Week](https://www.youtube.com/watch?v=_NUO4JEtkDw)
* [vimcasts.org](http://vimcasts.org/)
* [Video: vim + tmux - OMG!Code](https://www.youtube.com/watch?v=5r6yzFEXajQ)

## License

The code is available under the [MIT license](LICENSE.txt).
