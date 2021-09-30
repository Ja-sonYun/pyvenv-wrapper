# support zsh autocompletion

simple shell script wrapper of command `python venv -m <VENV_NAME>` with pyenv.

`pyv new <VENV_NAME>` to create new virtual environment.

`pyv ls` to list up all created virtual environments.

`pyv activate <VENV_NAME>` or `pyv <VENV_NAME>` to activate virtual environment.

`pyv remove <VENV_NAME>` to remove, `pyv deactivate` to deacitvate.

To use with specific python version (pyenv), use below,
`pyv new <VENV_NAME> <PYTHON_VERSION>`
will backup current pyenv global and switch to specific version, and create virtualenv,
after created, revert to previous pyenv global version.
