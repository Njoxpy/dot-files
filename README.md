# 🐧 Njoxpy Dotfiles

Welcome to my personal dotfiles repository!

These configuration files are centered around transforming **Vim** into a modern, high-performance **IDE** for Linux development, specifically focused on **Go**, **JavaScript/TypeScript**, and general web development.

The setup utilizes **CoC (Conqueror of Completion)** for Language Server Protocol (LSP) support, offering powerful IntelliSense and diagnostics, similar to VS Code.

## Features

- **IDE Functionality:** Full Language Server Protocol (LSP) support via **`coc.nvim`** for intelligent completion, type checking, and diagnostics.
- **Fast Navigation:** File and buffer fuzzy finding powered by **`fzf`**.
- **VS Code Aesthetic:** **Gruvbox** theme, **Nerd Font** icons, and **vim-indent-guides** for clear visual indentation.
- **Go & Web Dev Optimized:** Includes Go snippets and auto-format/auto-import on save for Go development.
- **Integrated Git:** Seamless source control management using **`vim-fugitive`**.

---

## Installation

These dotfiles are designed to be deployed using **symbolic links** via the included `install.sh` script.

### Prerequisites

You must have the following installed on your system before proceeding:

- **Vim** (with Vundle or a modern package manager installed).
- **Git**
- **FZF** (The external command-line tool).
- **Node.js & npm** (Required by CoC).
- **A Nerd Font** (e.g., Fira Code Nerd Font) configured in your terminal emulator (e.g., Konsole, Gnome Terminal) to see icons correctly.

### Deployment Steps

1.  **Clone the repository:**

    ```bash
    git clone [https://github.com/Njoxpy/dot-files.git](https://github.com/Njoxpy/dot-files.git) ~/dotfiles
    ```

2.  **Run the deployment script:**

    ```bash
    cd ~/dotfiles
    chmod +x install.sh
    ./install.sh
    ```

    This script creates symbolic links for `.vimrc` and the CoC configuration files in the correct locations (`~/.config/coc/`).

3.  **Install Vim Plugins:**
    Open Vim and run Vundle's installation command:

    ```vim
    vim
    :PluginInstall
    ```

4.  **Install CoC Extensions:**
    After Vundle finishes, install the necessary CoC extensions (LSPs, snippets, etc.):
    ```vim
    :CocInstall coc-tsserver coc-go coc-css coc-html coc-snippets
    ```

---

## Key Configuration Files

| File                        | Description                                                                 | Location in Repo |
| :-------------------------- | :-------------------------------------------------------------------------- | :--------------- |
| **`.vimrc`**                | The main configuration file, including plugin loading and key mappings.     | `/`              |
| **`coc/coc-settings.json`** | Global settings for CoC (e.g., auto-save format, Go imports, auto-trigger). | `/coc/`          |
| **`coc/snippets/go.json`**  | Custom Go code snippets (e.g., `mainf` for a main function).                | `/coc/snippets/` |

---

## Key Mappings (VS Code Shortcuts)

| Mapping     | Action                                 | VS Code Equivalent     |
| :---------- | :------------------------------------- | :--------------------- |
| `<C-n>`     | Toggle **NERDTree** (File Explorer)    | `Ctrl+Shift+E`         |
| `<C-p>`     | Open **Fuzzy File Finder** (FZF:Files) | `Ctrl+P`               |
| `<Leader>g` | Open **Git Status** (Fugitive)         | Source Control Sidebar |
| `<Leader>r` | Reload `.vimrc` (Source Configuration) | N/A                    |
| `gd`        | Go to Definition                       | `F12`                  |
| `<Leader>d` | Go to Next Diagnostic (Error/Warning)  | `F8`                   |

---
