#!/bin/bash

cd "$(dirname "$BASH_SOURCE")" \
    && source '../../utils.sh'

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

add_key() {
    wget -qO - "$1" | sudo apt-key add - &> /dev/null
    #     │└─ write output to file
    #     └─ don't show output
}

add_ppa() {
    sudo add-apt-repository -y ppa:"$1" &> /dev/null
}

add_to_source_list() {
    sudo sh -c "printf 'deb $1' >> '/etc/apt/sources.list.d/$2'"
}

install_package() {

    declare -r PACKAGE="$2"
    declare -r PACKAGE_READABLE_NAME="$1"

    if ! package_is_installed "$PACKAGE"; then
        execute "sudo apt-get install --allow-unauthenticated -qqy $PACKAGE" "$PACKAGE_READABLE_NAME"
        #                                      suppress output ─┘│
        #            assume "yes" as the answer to all prompts ──┘
    else
        print_success "$PACKAGE_READABLE_NAME"
    fi

}

install_deb_package() {

    declare -r PACKAGE_URL="$3"
    declare -r PACKAGE="$2"
    declare -r PACKAGE_READABLE_NAME="$1"
    declare -r FILENAME=$(basename "$PACKAGE_URL")

    if ! package_is_installed "$PACKAGE"; then

        {
          sudo wget -q $PACKAGE_URL -P /tmp && \
          sudo dpkg -i --force-overwrite /tmp/$FILENAME 2> /dev/null && \
          sudo rm -f /tmp/$FILENAME
        } || {
          print_error "$PACKAGE_READABLE_NAME"
        }

    else
        print_success "$PACKAGE_READABLE_NAME"
    fi

}

package_is_installed() {
    dpkg -s "$1" &> /dev/null
}

update() {

    # Resynchronize the package index files from their sources
    execute 'sudo apt-get update -qqy' 'Update'

}

upgrade() {

    # Install the newest versions of all packages installed
    execute 'sudo apt-get upgrade -qqy' 'Upgrade'

}
