#!/bin/bash
 
# Setup script
expected_origin=https://github.com/gnikxela0328/chatgpt-cli.git
current_origin=`git remote get-url origin 2>&1`;

if [ "$expected_origin" != "$current_origin" ]; then
  echo - Please run the script from the project root ...
  echo FAIL
  exit 1
else 
  echo - local origin matches expected $expected_origin

  current_folder=`pwd`
  repo_root=`git rev-parse --show-toplevel 2>&1`;

  if [ "$current_folder" != "$repo_root" ];then
    echo - Please run the script from the project root ...
    echo FAIL
    exit 1
  fi
  echo Starting Setup ...
fi

CURR_DIR=$(pwd)

# Setup project
touch key.py
read -p "Enter your OpenAI API Key: " api_key
echo "API_KEY='$api_key'" > key.py

# Install dependencies
python3 -m venv .env || {
  echo "Cannot install virtual environment. There is a problem with your python installation"
  exit 1
}
source .env/bin/activate
pip3 install -r requirements.txt
deactivate

# Create a shortcut
touch $HOME/.zshrc
mkdir -p $HOME/.local/bin
touch $HOME/.local/bin/chatgpt

# Check to see if PATH contains local binaries
location="$HOME/.local/bin"

IFS=":"
for dir in $PATH; do
    if [ "$dir" = "$location" ]; then
        echo Path is already configured
        break
    else
        # Add .local/bin to PATH 
        echo "export PATH=$HOME/.local/bin:$PATH" >> $HOME/.zshrc
        break
    fi
done

launch_script="#!/bin/bash
source $CURR_DIR/.env/bin/activate
python3 $CURR_DIR/chat.py
deactivate"

echo "$launch_script" > $HOME/.local/bin/chatgpt

chmod 700 $HOME/.local/bin/chatgpt