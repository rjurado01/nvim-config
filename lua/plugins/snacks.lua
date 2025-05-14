-- requiere instalar https://github.com/sharkdp/fd
return {
  "folke/snacks.nvim",
  enabled = true,
  priority=1000,
  ---@type snacks.Config
  opts = {
    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    picker = {
      enabled = true,
      actions = {
        only_select = function(picker)
          picker.list:select()
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
                ["x"] = "only_select",
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
