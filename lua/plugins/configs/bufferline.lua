require('bufferline').setup {
  options = {
    offsets = { { filetype = "NvimTree", text = "", padding = 0 } },
    diagnostics = 'nvim_lsp',
    buffer_close_icon = "",
    modified_icon = "",
    close_icon = "",
    show_close_icon = false,
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 14,
    max_prefix_length = 13,
    tab_size = 20,
    show_tab_indicators = true,
    enforce_regular_tabs = false,
    view = "multiwindow",
    show_buffer_close_icons = false,
    separator_style = "thick",
    always_show_bufferline = true,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " "
            or (e == "warning" and " " or "")
        s = s .. sym .. n
      end
      return s
    end,
    custom_filter = function(buf_number, buf_numbers)
      -- filter out by buffer name
      if vim.fn.bufname(buf_number) ~= "[dap-repl]" then
        return true
      end
    end
  },
}
