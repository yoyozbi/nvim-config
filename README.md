# My personnal NeoVim config

## Setup

0. Use the latest version of NVIM
1. This setup uses packer.nvim for the package manager, so first install packer.nvim by following the [official instructions](https://github.com/wbthomason/packer.nvim#quickstart)
2. Clone this repo into `~/.config/nvim`: or `%localappdata%\local\nvim` on windows

For linux:

```bash
git clone https://github.com/yoyozbi/config ~/.config/nvim
```

For Windows:

```powershell
git clone clone https://github.com/yoyozbi/config $env:LOCALAPPDATA\nvim
```

3. When you first enter `nvim`, you will see a bunch of mess because the plugins aren't installed yet, so run `:PackerInstall` to install the plugins<br>
> Note that there is a chance that the download would timeout and `packer.nvim` would report install failed, in this case run `:PackerInstall` again

4. Install prettierd 

all others lsps will be installed automatically however we will need to install prettierd for formatting in javscript

```bash
npm i -g @fsouza/prettierd
```

## Usage

### Keymaps

See `lua/yoyozbi/keymaps.lua` for reference