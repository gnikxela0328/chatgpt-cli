shell=$(echo $SHELL)
if [ "$shell" == "/bin/bash" ]; then
    touch ~/.bashrc
    shell_type=".bashrc"
elif [ "$shell" == "/bin/zsh" ]; then
    touch ~/.zshrc
    shell_type=".zshrc"
fi

echo $shell_type
