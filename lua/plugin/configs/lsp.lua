local check = require("core.check")
vim.diagnostic.config(
  {
    virtual_text = {
      prefix = "" -- Could be '●', '▎', 'x'
    },
    signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = true
  }
)

local signs = {Error = "", Warn = "", Hint = "", Info = ""}
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end

-- Setup lspconfig.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
if check.has_clangd() then
  require("lspconfig")["clangd"].setup {
    capabilities = capabilities
  }
else
  require("notify")("No clangd......","Error",{render = "minimal"})
end

if check.has_lua_lsp() then
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local luadev =
  require("lua-dev").setup(
  {
    -- add any options here, or leave empty to use the default settings
    -- lspconfig = {
    --   cmd = {"lua-language-server"}
    -- },
    lspconfig = {
      -- cmd = {os.getenv("HOME") .. "/lua-language-server/bin/macOS/lua-language-server"},
      cmd = {"lua-language-server"},
      filetypes = {"lua"},
      log_level = 2,
      root_dir = vim.loop.cwd,
      single_file_support = true,
      capabilities = {
        textDocument = {
          completion = {
            completionItem = {
              snippetSupport = true
            }
          }
        }
      },
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = "LuaJIT",
            -- Setup your lua path
            path = runtime_path
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {"vim"}
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            -- library = vim.api.nvim_get_runtime_file("", true)
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
            }
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false
          }
        }
      }
    }
  }
)
require "lspconfig".sumneko_lua.setup(luadev)
else
  require("notify")("No lua-language-server......","Error",{render = "minimal"})
end
