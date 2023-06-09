# Chat GPT CLI
 
_A tool to use chatGPT in your terminal, without having to log into chat.openai every time._

This also makes your subscription cheaper, since you can set an upper boundary for spending on the Open AI UsageDashboard. (ChatGPT plus costs ~$20 per month)

**Note**: This tool requires `python 3.8` or higher to function.


### Mac Users

If you have issues with `_ctypes`, run `brew install libffi`

You will need `sudo` access on your machine to run these scripts

### Installation

#### Quickstart
Run the setup script
```
chmod 700 install.sh
./install.sh
```

#### or, Install Manually:

1. Create a file named `key.py` in the root of the project and provide your OpenAI API key.

_key.py_

```
API_KEY={OPEN_AI_API_KEY}
```

2. Install project dependencies

```
python3 -m venv .env
source .env/bin/activate
pip3 install -r requirements.txt
deactivate
```

3. Create a link to the project and use directly from command line

! Be sure to replace `{ PROJECT_FOLDER }` with the path where you saved the project

```
PROJECT_FOLDER={ PROJECT_FOLDER }

# Grab shell profile
shell=$(echo $SHELL)
if [ "$shell" == "/bin/bash" ]; then
    touch ~/.bashrc
    CURR_PROFILE=".bashrc"
elif [ "$shell" == "/bin/zsh" ]; then
    touch ~/.zshrc
    CURR_PROFILE=".zshrc"
else; then
    echo "Cannot determine shell profile. Modify this script and try again"
    exit 1
fi

# Create install location and add to PATH
mkdir -p $HOME/.local/bin
echo "export PATH=$HOME/.local/bin:$PATH" >> $HOME/$CURR_PROFILE

# Write script to install location
touch $HOME/.local/bin/chatgpt

launch_script="#!/bin/bash
source $PROJECT_FOLDER/.env/bin/activate
python3 $PROJECT_FOLDER/chat.py
deactivate"

echo "$launch_script" >> $HOME/.local/bin/chatgpt
```

### Usage

To start a chat

```
chatgpt
```

To send a message: press enter, then ctrl + D

```
enter, ctrl + D
```

To quit: press ctrl + C
```
ctrl + c
```
