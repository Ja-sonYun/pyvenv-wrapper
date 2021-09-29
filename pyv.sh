#!/bin/sh

source _pyv-completion

function pyv() {
    ENV_FILE=".pv"
    TARGET_ENV=$PYVENV_ROOT/$2
    SET_PYENV=false

    case "$1" in
        new | n )
            if [ -d "$TARGET_ENV" ]; then
                echo "env $2 already exists!"
            else
                if [ ! -z "$3" ] && command -v pyenv &> /dev/null; then
                    pyenv global > $PYVENV_ROOT/$ENV_FILE
                    pyenv global $3 || pyenv install $3 && pyenv global $3
                    SET_PYENV=true
                fi

                echo "creating new virtual environment on $TARGET_ENV"
                python3 -m venv $TARGET_ENV

                if [ "$SET_PYENV" = true ]; then
                    pyenv global `cat $PYVENV_ROOT/$ENV_FILE`
                fi
            fi;;
        activate | a )
            if [ -d "$TARGET_ENV" ]; then
                source $TARGET_ENV/bin/activate
            else
                echo "env $2 not found!"
            fi;;
        deactivate | d )
            deactivate;;
        remove | r )
            if [ -d "$TARGET_ENV" ]; then
                rm -rf $TARGET_ENV
            fi;;
        list | l[s] )
            ls $PYVENV_ROOT;;
        * )
            if [ -d "$PYVENV_ROOT/$1" ]; then
                source $PYVENV_ROOT/$1/bin/activate
            else
                cat << EOF
usage: pyv [new <n> | activate <a> | deactivate <d> | remove <r> | ls <l>] [venv_name] [python-version]

example:
    pyv new ml 3.8.6
    pyv activate ml
    pyv deactivate
    pyv remove ml
    pyv ls
EOF
            fi
    esac
}

