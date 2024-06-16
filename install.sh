#!/bin/bash

# Update package list and install necessary packages
sudo apt update
sudo apt install -y tmux ranger nano

# Create ranger configuration directory if it doesn't exist
mkdir -p ~/.config/ranger

# Create ranger configuration file
cat <<EOT > ~/.config/ranger/rc.conf
# Only display one column in ranger
set column_ratios 0,1,0
set show_hidden true

# Ensure only one column is visible
default_linemode single_column

# Key bindings to navigate and open files
map <Enter> shell tmux send-keys -t 1 'nano "%d/%f"' C-m
map l shell tmux send-keys -t 1 'nano "%d/%f"' C-m
map \l shell tmux send-keys -t 1 'nano "%d/%f"' C-m

# Ensure j/k are set for up/down navigation
map j move down
map k move up
EOT

# Create the myide.sh script
cat <<EOT > ~/myide.sh
#!/bin/bash

# Check if a directory path is provided
if [ -z "\$1" ]; then
  echo "Usage: \$0 path/to/dir"
  exit 1
fi

# Set the directory path
DIRPATH=\$1

# Define the tmux session name
SESSION_NAME="myide"

# Check if the tmux session already exists and delete it
tmux has-session -t \$SESSION_NAME 2>/dev/null
if [ \$? == 0 ]; then
  tmux kill-session -t \$SESSION_NAME
fi

# Create a new tmux session
tmux new-session -d -s \$SESSION_NAME -c "\$DIRPATH"

# Split the window vertically (left for ranger) with 20% for the left pane
tmux split-window -h -p 90 -c "\$DIRPATH"

# Split the right pane horizontally (top right for nano, bottom right for terminal) with 80% for the top pane
tmux split-window -v -p 10 -c "\$DIRPATH"

# Left pane: ranger
tmux select-pane -t 0
tmux send-keys "ranger" C-m

# Top right pane: nano (initially empty, will be used to open files)
tmux select-pane -t 1

# Bottom right pane: terminal (default shell)
tmux select-pane -t 2

# Attach to the session
tmux attach-session -t \$SESSION_NAME
EOT

# Make the myide.sh script executable
chmod +x ~/myide.sh

# Add an alias for myide
echo "#MyIDE" >> ~/.bashrc
echo "alias myide='~/myide.sh'" >> ~/.bashrc

# Reload .bashrc to apply the alias
source ~/.bashrc

echo "Installation complete. You can now use the 'myide' command to start the IDE."
