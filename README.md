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

#### or, setup manually:

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

3. Create a link to the tool and use directly from command line (macOS instructions)

! Be sure to replace {PROJECT_FOLDER} to where you saved the project

```
touch $HOME/.zshrc
mkdir -p $HOME/.local/bin
touch $HOME/.local/bin/chatgpt

launch_script="#!/bin/bash
source {PROJECT_FOLDER}/.env/bin/activate
python3 {PROJECT_FOLDER}/chat.py
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
