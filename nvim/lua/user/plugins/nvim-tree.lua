require('nvim-tree').setup({
  git = {
    ignore = false,
  },
  list = {
    { key = "u", action = "dir_up" },
  },
  renderer = {
    group_empty = true,
    icons = {
      show = {
        folder_arrow = false,
      },
    },
    indent_markers = {
      enable = true,
    },
  },
})

vim.keymap.set('n', '<Leader>nn', ':NvimTreeFindFileToggle<CR>') 
vim.keymap.set('n', '<Leader>nf', ':NvimTreeFindFile<CR>') 

