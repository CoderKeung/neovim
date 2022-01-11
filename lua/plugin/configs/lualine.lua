local colors = require("color").oceanic_materal

local custom = {
  normal = {
    a = {bg = colors.yellow, fg = colors.bg},
    b = {bg = colors.orange, fg = colors.black},
    c = {bg = colors.none, fg = colors.none},
    x = {bg = colors.green, fg = colors.black},
    y = {bg = colors.pink, fg = colors.black},
    z = {bg = colors.bg, fg = colors.yellow}
  },
  insert = {
    a = {bg = colors.red, fg = colors.black},
    b = {bg = colors.orange, fg = colors.black},
    c = {bg = colors.none, fg = colors.none},
    x = {bg = colors.green, fg = colors.black},
    y = {bg = colors.pink, fg = colors.black},
    z = {bg = colors.bg, fg = colors.red}
  },
  visual = {
    a = {bg = colors.green, fg = colors.black},
    b = {bg = colors.orange, fg = colors.black},
    c = {bg = colors.none, fg = colors.none},
    x = {bg = colors.green, fg = colors.black},
    y = {bg = colors.pink, fg = colors.black},
    z = {bg = colors.bg, fg = colors.green}
  },
  command = {
    a = {bg = colors.blue, fg = colors.black},
    b = {bg = colors.orange, fg = colors.black},
    c = {bg = colors.none, fg = colors.none},
    x = {bg = colors.green, fg = colors.black},
    y = {bg = colors.pink, fg = colors.black},
    z = {bg = colors.bg, fg = colors.blue}
  },
  replace = {},
  inavtive = {}
}

local function scrollbar_instance(scroll_bar_chars)
  local current_line = vim.fn.line(".")
  local total_lines = vim.fn.line("$")
  local default_chars = {"▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██"}
  local chars = scroll_bar_chars or default_chars
  local index = 1

  if current_line == 1 then
    return " "
  elseif current_line == total_lines then
    index = #chars
  else
    local line_no_fraction = vim.fn.floor(current_line) / vim.fn.floor(total_lines)
    index = vim.fn.float2nr(line_no_fraction * #chars)
    if index == 0 then
      index = 1
    end
  end
  return chars[index]
end

local mode_icon = {
  c = "🅒 ",
  i = "🅘 ",
  n = "🅝 ",
  R = "🅡 ",
  r = "🅡 ",
  s = "🅢 ",
  t = "🅣 ",
  v = "🅥 "
}

require("lualine").setup {
  options = {
    icons_enabled = true,
    theme = custom,
    component_separators = {left = "", right = ""},
    section_separators = {left = "", right = ""},
    disabled_filetypes = {"NvimTree", "DiffviewFiles","packer"},
    always_divide_middle = true
  },
  sections = {
    lualine_a = {
      function()
        return "C-K " .. mode_icon[vim.fn.mode()]
      end
    },
    lualine_b = {
      {
        "branch",
        padding = 2
      }
    },
    lualine_c = {
      {
        "diff",
        symbols = {added = " ", modified = "  ", removed = "  "},
        diff_color = {
          added = "DiffAdd", -- changes diff's added color
          modified = "DiffChange", -- changes diff's modified color
          removed = "DiffDelete" -- changes diff's removed color you
        }
      }
    },
    lualine_x = {
      {
        "diagnostics",
        colored = true,
        diagnostics_color = {
          -- Same values like general color option can be used here.
          error = "DiffDelete", -- changes diagnostic's error color
          warn  = "IncSearch", -- changes diagnostic's warn color
          info  = "DiffAdd", -- changes diagnostic's info color
          hint  = "Visual" -- changes diagnostic's hint color
        },
        symbols = {error = "  ", warn = "  ", info = "  ", hint = "  "}
      }
    },
    lualine_y = {
      {"filetype", padding = {left = 1}, icon_only = true, colored = false},
      {"filename", symbols = {modified = "  ", readonly = "  ", unnamed = "  "}}
    },
    lualine_z = {
      {
        function()
          local icon = scrollbar_instance()
          local percent, _ = math.modf((vim.fn.line(".") / vim.fn.line("$")) * 100)
          return percent .. "%% " .. icon
        end,
        padding = {right = 0, left = 1}
      }
    }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {"filename"},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {{"filetype", colored = false}},
    lualine_z = {}
  },
  tabline    = {},
  extensions = {}
}
