local present, telescope = pcall(require, "telescope")

if not present then
  return
end

local options = {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { "node_modules" },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "truncate" },
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    mappings = {
      n = { ["q"] = require("telescope.actions").close },
    },
  },
}

telescope.setup(options)


-- theming
local hl = vim.api.nvim_set_hl
local colors = require 'theme.colors'
local lush = require 'lush_theme.lush_wal'

local grey = lush.NormalFloat.bg.hex

hl(0, 'TelescopeBorder', { fg = colors.bg })
hl(0, 'TelescopePromptPrefix', { fg = colors.red, bg = grey })
hl(0, 'TelescopePromptBorder', { fg = grey, bg = grey })
hl(0, 'TelescopePromptNormal', { fg = colors.fg, bg = grey })
hl(0, 'TelescopePromptTitle', { fg = colors.bg, bg = colors.red })
hl(0, 'TelescopePreviewTitle', { fg = colors.black, bg = colors.green })
hl(0, 'TelescopePreviewNormal', { fg = colors.fg, bg = grey })
hl(0, 'TelescopePreviewBorder', { fg = grey, bg = grey })
