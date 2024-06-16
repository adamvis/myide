# MyIDE

## Overview

MyIDE is a terminal-based integrated development environment (IDE) that utilizes `tmux`, `ranger`, and `nano` to provide a powerful and customizable workspace for developers. This setup allows you to navigate your file system, edit files, and run terminal commands within a split-terminal layout.

## Installation

To install and configure MyIDE on a new Linux machine, follow these steps:

### Prerequisites

- Ensure you are running a Linux distribution with `apt` package manager (e.g., Ubuntu, Debian).

### Installation Script

1. Download the installation script:

    ```sh
    wget https://example.com/install_myide.sh -O install_myide.sh
    ```

2. Make the script executable:

    ```sh
    chmod +x install_myide.sh
    ```

3. Run the installation script:

    ```sh
    ./install_myide.sh
    ```

This script will:
- Install `tmux`, `ranger`, and `nano`.
- Create the necessary configuration files.
- Set up the `myide.sh` script.
- Add an alias for `myide` in your `.bashrc`.

## Usage

### Starting MyIDE

To start MyIDE, use the `myide` command followed by the path to the directory you want to work in:

```sh
myide /path/to/dir
```

This command will open a `tmux` session with the following layout:
- **Left pane (20%)**: `ranger` file manager.
- **Top right pane (80%)**: `nano` text editor.
- **Bottom right pane (20%)**: Terminal for running commands.

To navigate the IDE panels use **Ctrl+b** and then **<arrow-key>** while to modify relative sizes of panels use **Ctrl+b+<arrow-key>**

### Navigating in Ranger

Use the following keys to navigate and manage files in `ranger`:

- **Up/Down arrows or `k/j`**: Move up/down the file list.
- **Right arrow or `l`**: Open directory or file.
- **Left arrow or `h`**: Go to the parent directory.
- **`gg`**: Go to the top of the list.
- **`G`**: Go to the bottom of the list.
- **`/`**: Search for a file or directory.
- **`n`**: Go to the next search result.
- **`N`**: Go to the previous search result.
- **`q`**: Quit `ranger`.

### File Operations in Ranger

- **Copy**: Select files using `Space`, then press `yy`.
- **Cut/Move**: Select files using `Space`, then press `dd`.
- **Paste**: Navigate to the destination directory, then press `pp`.
- **Delete**: Select files using `Space`, then press `dd` and `x`.

### Opening Files in Nano

- **Enter or `l`**: Open the selected file in `nano` in the top right pane.
- **Saving Changes**: Press `Ctrl+O`, then `Enter`.
- **Exiting Nano**: Press `Ctrl+X`.

### Terminal Commands

- **Run Commands**: Use the bottom right terminal pane to run any shell commands.
- **Switch Panes**: Use `Ctrl+b` followed by arrow keys to switch between `tmux` panes.

## Advanced Configuration

You can customize `ranger` and `tmux` further by editing their configuration files:

- **Ranger Configuration**: `~/.config/ranger/rc.conf`
- **Tmux Configuration**: `~/.tmux.conf`

## Uninstallation

To remove MyIDE, simply delete the configuration files and the `myide.sh` script:

```sh
rm -rf ~/.config/ranger
rm ~/myide.sh
sed -i '/alias myide=/d' ~/.bashrc
```

Reload your `.bashrc`:

```sh
source ~/.bashrc
```

## Troubleshooting

If you encounter any issues, ensure that all necessary packages are installed and that the configuration files are correctly placed. Refer to the installation script for specific setup details.

## Contributions

Contributions and suggestions are welcome! Feel free to open an issue or submit a pull request on GitHub.

## License

This project is licensed under the MIT License.
```

### Save and Share the README

1. Save the above text into a file named `README.md`.
2. Share or place this file in your project repository or distribute it along with your installation script.

### Instructions for Using `wget`

Since the installation script URL is a placeholder (`https://example.com/install_myide.sh`), make sure to replace it with the actual URL where your script is hosted.
