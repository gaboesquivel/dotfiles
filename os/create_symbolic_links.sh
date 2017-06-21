#!/bin/bash

cd "$(dirname "$BASH_SOURCE")" \
    && source 'utils.sh'

declare -a FILES_TO_SYMLINK=(

    'zsh/zshrc'
    'zpresto'
    'hyper/hyper'

    'git/gitattributes'
    'git/gitconfig'
    'git/gitignore'

    'vim/vim'
    'vim/vimrc'
    'vim/gvimrc'

)

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    local i=''
    local sourceFile=''
    local targetFile=''

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    for i in ${FILES_TO_SYMLINK[@]}; do

        sourceFile="$(cd .. && pwd)/$i"
        targetFile="$HOME/.$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"

        if [ ! -e "$targetFile" ]; then
            execute "ln -fs $sourceFile $targetFile" "$targetFile → $sourceFile"
        elif [ "$(readlink "$targetFile")" == "$sourceFile" ]; then
            print_success "$targetFile → $sourceFile"
        else
            ask_for_confirmation "'$targetFile' already exists, do you want to overwrite it?"
            if answer_is_yes; then
                rm -rf "$targetFile"
                execute "ln -fs $sourceFile $targetFile" "$targetFile → $sourceFile"
            else
                print_error "$targetFile → $sourceFile"
            fi
        fi

    done

}

main
