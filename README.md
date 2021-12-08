# interesting-files.nvim

Bookmark and navigate between your favorite files in neovim.

## Setup

```vim
Plug 'slarwise/interesting-files.nvim'
```

```lua
require "interesting_files".setup({
    locations = { "interesting-files", } -- A list of file paths to read from
})
```

Can be used as a [Telescope](https://github.com/nvim-telescope/telescope.nvim)
extension by doing 

```lua
require('telescope').load_extension('args')
```

## Usage

Add a file called `interesting-files` to your current working directory. Add
file names to it. Now you can navigate to them using Telescope by doing

```vim
:Telescope interesting_files
```

Pressing enter on a file will go to that file. The usual Telescope mappings for
file pickers such as `<C-x>` for opening a file in a horizonal split work as
usual.

To go to the nth file in `interesting-files`, do

```lua
require"interesting_files".navigate(n)
```

To map it, you can do

```vim
nnoremap <space> <cmd>lua require"interesting_files".navigate(vim.v.count1)<CR>
```

This will let you go to the nth interesting file by pressing a number and then
space, e.g. `3<space>` takes you to the third file. If you don't prefix it with
a number, it will go to the first file.
