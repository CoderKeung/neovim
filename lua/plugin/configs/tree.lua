local tree_cb = require "nvim-tree.config".nvim_tree_callback
vim.cmd[[
hi NvimTreeNormal guibg=#0A2B34
hi NvimTreeNormalNC guibg=#0A2B34 
hi NvimTreeStatusLine guibg=#0A2B34
hi NvimTreeStatusLineNC guibg=#0A2B34 guifg=#0A2B34
hi NvimTreeVertSplit guibg=#0A2B34
hi NvimTreeFolderIcon guifg=#f6c177
hi NvimTreeOpenedFolderName guifg=#e78a41
]]

vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_show_icons = {
   folders = 1,
   files = 1,
   git = 1,
}

vim.g.nvim_tree_icons = {
   default = "",
   symlink = "",
   git = {
      deleted = "",
      ignored = "◌",
      renamed = "➜",
      staged = "לּ",
      unmerged = "",
      unstaged = "",
      untracked = "",
   },
   folder = {
      default = "",
      empty = "",
      empty_open = "",
      open = "",
      symlink = "",
      symlink_open = "",
   },
}

require "nvim-tree".setup {
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_ft_on_setup = {},
  auto_close = false,
  open_on_tab = false,
  hijack_cursor = true,
  update_cwd = false,
  update_to_buf_dir = {
    enable = true,
    auto_open = true
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = ""
    }
  },
  update_focused_file = {
    enable = false,
    update_cwd = false,
    ignore_list = {}
  },
  system_open = {
    cmd = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500
  },
  view = {
    width = 27,
    height = 30,
    hide_root_folder = true,
    side = "left",
    auto_resize = true,
    mappings = {
      custom_only = true,
      list = {
        {key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit")},
        {key = {"<2-RightMouse>", "<C-]>"}, cb = tree_cb("cd")},
        {key = "<C-v>", cb = tree_cb("vsplit")},
        {key = "<C-x>", cb = tree_cb("split")},
        {key = "<C-t>", cb = tree_cb("tabnew")},
        {key = "<", cb = tree_cb("prev_sibling")},
        {key = ">", cb = tree_cb("next_sibling")},
        {key = "P", cb = tree_cb("parent_node")},
        {key = "<BS>", cb = tree_cb("close_node")},
        {key = "<S-CR>", cb = tree_cb("close_node")},
        {key = "<S-Tab>", cb = tree_cb("preview")},
        {key = "K", cb = tree_cb("first_sibling")},
        {key = "J", cb = tree_cb("last_sibling")},
        {key = "I", cb = tree_cb("toggle_ignored")},
        {key = "H", cb = tree_cb("toggle_dotfiles")},
        {key = "R", cb = tree_cb("refresh")},
        {key = "a", cb = tree_cb("create")},
        {key = "d", cb = tree_cb("remove")},
        {key = "D", cb = tree_cb("trash")},
        {key = "r", cb = tree_cb("rename")},
        {key = "<C-r>", cb = tree_cb("full_rename")},
        {key = "x", cb = tree_cb("cut")},
        {key = "c", cb = tree_cb("copy")},
        {key = "p", cb = tree_cb("paste")},
        {key = "y", cb = tree_cb("copy_name")},
        {key = "Y", cb = tree_cb("copy_path")},
        {key = "gy", cb = tree_cb("copy_absolute_path")},
        {key = "[c", cb = tree_cb("prev_git_item")},
        {key = "]c", cb = tree_cb("next_git_item")},
        {key = "-", cb = tree_cb("dir_up")},
        {key = "s", cb = tree_cb("system_open")},
        {key = "q", cb = tree_cb("close")},
        {key = "g?", cb = tree_cb("toggle_help")}
      }
    },
    number = false,
    relativenumber = false
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  }
}
