-- requiere instalar https://github.com/sharkdp/fd
return {
  "folke/snacks.nvim",
  enabled = true,
  priority=1000,
  ---@type snacks.Config
  opts = {
    indent = { enabled = true },
    input = { enabled = false },
    notifier = { enabled = false },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    picker = {
      enabled = true,
      actions = {
        only_select = function(picker)
          picker.list:select()
        end,

        -- https://github.com/folke/snacks.nvim/blob/bc0630e43be5699bb94dadc302c0d21615421d93/lua/snacks/picker/actions.lua#L321
        discard_changes = function(picker, item)
          -- print(vim.inspect(item))

          local file = item.file
          vim.fn.system("git checkout -- " .. file)
          
          -- Reload buffer if the file is open in nvim
          local bufnr = vim.fn.bufnr(file)
          if bufnr ~= -1 and vim.api.nvim_buf_is_loaded(bufnr) then
            vim.api.nvim_buf_call(bufnr, function()
              vim.cmd('checktime')
            end)
          end
          
          picker:find({ refresh = true })
        end
      },
      matcher = {
        fuzzy = false,
      },
      formatters = {
        file = {
          truncate = 999, -- truncate the file path to (roughly) this length
        },
      },
      sources = {
        colorschemes = {
          format = 'text',
          preset = 'vertical',
          layout = {
            preset = "sidebar",
            preview = true,
          }
        },
        grep = {
          -- -g=scripts/*
          -- -g=**/pyf-core/**/*.entity*
          -- -t=ts
          layout = {
            layout = {
              backdrop = false,
              width = 0.8,
              min_width = 80,
              height = 0.8,
              min_height = 30,
              box = "vertical",
              border = "rounded",
              title = "{title} {live} {flags}",
              title_pos = "center",
              { win = "input", height = 1, border = "bottom" },
              { win = "list", border = "none" },
              { win = "preview", title = "{preview}", height = 0.8, border = "top" },
            }
          },
        },
        files = {
          layout = {
            layout = {
              backdrop = false,
              width = 0.8,
              min_width = 80,
              height = 0.8,
              min_height = 30,
              box = "vertical",
              border = "rounded",
              title = "{title} {live} {flags}",
              title_pos = "center",
              { win = "input", height = 1, border = "bottom" },
              { win = "list", border = "none" },
              { win = "preview", title = "{preview}", height = 0.8, border = "top" },
            }
          },
        },
        explorer = {
          tree = true,
          auto_close = true,
          hidden = true,
          layout = { layout = { position = "float", height = 0.8, width = 0.5 } },
          win = {
            list = {
              keys = {
                ["v"] = "edit_vsplit",
                ["t"] = "edit_tab",
                ["<C-t>"] = "edit_tab",
                ["x"] = "only_select",
              },
            },
          },
        },
        git_status = {
          win = {
            input = {
              keys = {
                ["<Tab>"] = { "git_stage", mode = { "n", "i" } },
                ["<S-Tab>"] = { "discard_changes", mode = { "n", "i" } },
              },
            },
          },
        }
      }
    },
    explorer = {
      enabled = true,
    },
  },
  config = true
}
