# f

A tool for recalling favourite commands that you can't remember how to type. Use `f` to choose a command and run it, and `fa` to make the command you just ran available for `f` to use.

## Installation

### Prerequisites
- `fzf` - command-line fuzzy finder. Install with `brew install fzf` or [view it on GitHub](https://github.com/junegunn/fzf).

### Install Locally

To install `f` and `fa` locally, you can run the following one-liner in your terminal:

```bash
curl -fsSL https://raw.githubusercontent.com/thomaslefeuvre/f/main/install.sh | bash
```

This script will:
- Install the `f` and `fa` commands into `~/.local/bin`
- Ensure that `~/.local/bin` is added to your `PATH` (if not already present).
- Place the configuration file into your home directory.

### Manual Installation

1. **Download the files:**
   - Clone or download this repository to your local machine.

   ```bash
   git clone https://github.com/thomaslefeuvre/f.git
   cd yourrepo
   ```

2. **Run the install script:**
   - The `install.sh` script will copy the necessary files to the appropriate locations and update your bash configuration to make `f` and `fa` available globally.

   ```bash
   ./install.sh
   ```

### Post-Installation
After installation, you need to ensure that your shell is aware of the newly installed commands. If you're using a `bash` shell, the `install.sh` script will automatically update your `.bashrc` to include the directory `~/.local/bin` in your `PATH`.

To apply the changes, either restart your terminal or run the following:

```bash
source ~/.bashrc
```

---

## Usage

### `f` Command
The `f` command allows you to search and select previous commands using the `fzf` fuzzy finder:

```bash
f
```

### `fa` Command
The `fa` command will append the previously ran command to your configuration file.

```bash
fa
```

---

## Uninstallation

To remove the tools from your system, simply delete the installed files and remove the relevant lines from your shell configuration:

```bash
rm -f ~/.local/bin/{f,fa} ~/.fconfig
```

You might also like to revert the changes to your `~/.bashrc` if it was amended during installation.

---

## **License**

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for more details.
