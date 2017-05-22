#!/bin/bash

cd "$(dirname "$BASH_SOURCE")" \
    && source '../../utils.sh'

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

set_gnome_desktop_preferences() {

    execute 'gsettings set org.gnome.desktop.wm.preferences button-layout "close,minimize,maximize:"' \
        'Set window buttons top left'
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple '\n  GNOME Des\n\n'
    set_gnome_desktop_preferences

}

main
