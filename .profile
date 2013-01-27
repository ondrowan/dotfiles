if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "~/.bashrc" ]; then
        . "~/.bashrc"
    fi
fi

# includes .local/bin to path if it exists
if [ -d "~/.local/bin" ]; then
    PATH="~/.local/bin:$PATH"
fi

