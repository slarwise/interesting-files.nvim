# interesting-files.nvim

Bookmark and navigate between your favorite files.

## Setup

```vim
Plug 'slarwise/interesting-files.nvim'
```

Can be used as a [Telescope](https://github.com/nvim-telescope/telescope.nvim)
by doing 

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

```vimscript
nnoremap <space> <cmd>lua require"interesting_files".navigate(vim.v.count1)<CR>
```

This will let you go to the nth interesting file by pressing a number and then
space, e.g. `3<space>` takes you to the third file. If you don't prefix it with
a number, it will go to the first file.

## TODO

Add a setup function so the user can configure

- [ ] The location of the file to read interesting files from.
- [ ] Have multiple such files, concatenate the file names. Should be able to
  handle files not existing.