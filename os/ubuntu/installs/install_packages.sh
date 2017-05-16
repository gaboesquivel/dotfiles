#/bin/bash

cd "$(dirname "$BASH_SOURCE")" \
    && source '../../utils.sh' \
    && source 'utils.sh'

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    # Tools for compiling/building software from source
    install_package 'Build Essential' 'build-essential'

    # GnuPG archive keys of the Debian archive
    install_package 'GnuPG archive keys' 'debian-archive-keyring'

    # Software which is not included by default
    # in Ubuntu due to legal or copyright reasons
    #install_package 'Ubuntu Restricted Extras' 'ubuntu-restricted-extras'

    printf '\n'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! package_is_installed 'atom'; then

        add_ppa 'webupd8team/atom'
        print_result $? "Atom (add PPA)"

        update

        install_package 'Atom' 'atom'

        printf '\n'

    else
        print_success 'Atom'
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! package_is_installed 'yarn'; then

        add_key 'https://dl.yarnpkg.com/debian/pubkey.gpg'
        print_result $? "Yarn (add key)"

        add_to_source_list 'https://dl.yarnpkg.com/debian/ stable main' 'yarn.list'
        print_result $? "Yarn (add to package resource list)"

        update

        install_package 'Yarn' 'yarn'

        printf '\n'

    else
        print_success 'Yarn'
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! package_is_installed 'google-chrome-unstable'; then

        add_key 'https://dl-ssl.google.com/linux/linux_signing_key.pub'
        print_result $? "Chrome Canary (add key)"

        add_to_source_list 'http://dl.google.com/linux/deb/ stable main' 'google-chrome.list'
        print_result $? "Chrome Canary (add to package resource list)"

        update

        install_package 'Chrome Canary' 'google-chrome-unstable'

        printf '\n'

    else
        print_success 'Chrome Canary'
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'Chromium' 'chromium-browser'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'cURL' 'curl'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'Dropbox' 'nautilus-dropbox'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! package_is_installed 'firefox-trunk'; then

        printf '\n'

        add_ppa 'ubuntu-mozilla-daily/ppa'
        print_result $? "Firefox Nightly (add PPA)"

        update

        install_package 'Firefox Nightly' 'firefox-trunk'

        printf '\n'

    else
        print_success 'Firefox Nightly'
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! package_is_installed 'scudcloud'; then

        printf '\n'

        add_ppa 'rael-gc/scudcloud'
        print_result $? "ScudCloud(add PPA)"

        echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections

        update

        install_package 'ScudCloud' 'scudcloud'

        printf '\n'

    else
        print_success 'ScudCloud Slack Client'
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'Flash' 'flashplugin-installer'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'GIMP' 'gimp'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'Git' 'git'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'GNOME Vim' 'vim-gnome'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'ImageMagick' 'imagemagick'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'tmux' 'tmux'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'Transmission' 'transmission'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'VirtualBox' 'virtualbox'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'VLC' 'vlc'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'xclip' 'xclip'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'Zopfli' 'zopfli'

}

main
