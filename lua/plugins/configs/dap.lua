local dap = require('dap')
local dap_utils = require("dap.utils")

-- plugins

vim.fn.sign_define('DapBreakpoint', {
    text = '🛑',
    texthl = '',
    linehl = '',
    numhl = '',
    priority = 1
})

require("nvim-dap-virtual-text").setup({
    enabled = true,                            -- enable this plugin (the default)
    enabled_commands = true,                   -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
    highlight_changed_variables = true,        -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
    highlight_new_as_changed = false,          -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
    show_stop_reason = true,                   -- show stop reason when stopped for exceptions
    commented = false,                         -- prefix virtual text with comment string
    only_first_definition = true,              -- only show virtual text at first definition (if there are multiple)
    all_references = false,                    -- show virtual text on all all references of the variable (not only definitions)
    filter_references_pattern = "<module",     -- filter references (not definitions) pattern when all_references is activated (Lua gmatch pattern, default filters out Python modules)
    -- Experimental Features:
    virt_text_pos = "eol",                     -- position of virtual text, see `:h nvim_buf_set_extmark()`
    all_frames = false,                        -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
    virt_lines = false,                        -- show virtual lines instead of virtual text (will flicker!)
    virt_text_win_col = nil,                   -- position the virtual text at a fixed window column (starting from the first text column) ,
})

require('nvim-dap-repl-highlights').setup()

local dapui = require 'dapui'

dapui.setup({
    icons = { expanded = "▾", collapsed = "▸" },
    mappings = {
        -- Use a table to apply multiple mappings
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t"
    },
    -- Expand lines larger than the window
    -- Requires >= 0.7
    expand_lines = vim.fn.has("nvim-0.7"),
    -- Layouts define sections of the screen to place windows.
    -- The position can be "left", "right", "top" or "bottom".
    -- The size specifies the height/width depending on position. It can be an Int
    -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
    -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
    -- Elements are the elements shown in the layout (in order).
    -- Layouts are opened in order so that earlier layouts take priority in window sizing.
    layouts = {
        {
            elements = {
                -- Elements can be strings or table with id and size keys.
                -- "repl",
                -- "console",
                "scopes", -- "breakpoints",
                "stacks", "watches"
            },
            size = 40, -- 40 columns
            position = "left"
        }
        --[[ {
    elements = {
    "repl",
    "console",
    },
    size = 0.25, -- 25% of total lines
    position = "bottom",
  }, ]]
    },
    floating = {
        max_height = nil,  -- These can be integers or a float between 0 and 1.
        max_width = nil,   -- Floats will be treated as percentage of your screen.
        border = "single", -- Border style. Can be "single", "double" or "rounded"
        mappings = { close = { "q", "<Esc>" } }
    },
    windows = { indent = 1 },
    render = {
        max_type_length = nil -- Can be integer or nil.
    }
})

-- c#
dap.adapters.netcoredbg = {
    type = 'executable',
    command = '/usr/sbin/netcoredbg',
    args = { '--interpreter=vscode', '--hot-reload' }
}

dap.configurations.cs = {
    {
        type = "netcoredbg",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
            local dll = io.popen("find bin/Debug/ -maxdepth 2 -name \"*.dll\"")
            return vim.fn.getcwd() .. "/" .. dll:lines()()
            -- return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
        end
    }
}

-- python
require('dap-python').setup('/usr/bin/python')

-- rust
local extension_path = '/usr/lib/codelldb/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'

dap.adapters.codelldb = require('rust-tools.dap').get_codelldb_adapter(
    codelldb_path, liblldb_path)

dap.configurations.rust = {
    {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
            -- vim.notify("Building package...")
            -- local _ = io.popen("cargo build")
            local executable = io.popen(
                "find target/debug/ -maxdepth 1 -executable -type f")
            return vim.fn.getcwd() .. "/" .. executable:lines()()
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false
    }
}

-- typescript
require("dap-vscode-js").setup({
    debugger_path = os.getenv('HOME') ..
        '/.local/share/nvim/site/pack/packer/opt/vscode-js-debug',
    adapters = {
        'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal',
        'pwa-extensionHost'
    }
})

for _, language in ipairs({ "typescript", "javascript" }) do
    require("dap").configurations[language] = {
        {
            name = "Launch Chrome",
            type = "chrome",
            request = "launch",
            sourceMaps = true,
            trace = true,
            port = 9222,
            webRoot = "${workspaceFolder}",
            runtimeExecutable = "/usr/bin/google-chrome-stable",
            runtimeArgs = {
                "--app=http://localhost", "--remote-debugging-port=9222"
            }
        },
        {
            type = "pwa-node",
            request = "launch",
            name = "Launch Nodemon",
            program = "${file}",
            cwd = "${workspaceFolder}",
            runtimeExecutable = "nodemon"
        },
        {
            type = "pwa-node",
            request = "launch",
            name = "Launch",
            program = "${file}",
            cwd = "${workspaceFolder}",
            runtimeExecutable = "ts-node"
        },
        {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require 'dap.utils'.pick_process,
            cwd = "${workspaceFolder}"
        }
    }
end

dap.adapters.reactnative = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '~/code/mobile/node_modules/react-native/local-cli/cli.js', 'debug'}
}

dap.configurations.javascript = {
  {
    type = 'reactnative',
    request = 'launch',
    name = 'Launch Expo App',
    program = '${workspaceFolder}/App.ts', -- Modify this if necessary
    cwd = '${workspaceFolder}',
    runtimeExecutable = 'node',
    env = {
      NODE_ENV = 'development',
    },
    sourceMaps = true,
    console = 'integratedTerminal',
    protocol = 'inspector',
  }
}


-- ruby
require('dap-ruby').setup()

-- php

dap.adapters.php = {
    type = 'executable',
    command = 'node',
    args = { '/usr/lib/node_modules/php-debug/out/phpDebug.js' }
}

dap.configurations.php = {
    {
        name = 'Listen for Xdebug',
        type = 'php',
        request = 'launch',
        port = 9000,
        pathMappings = { ['/var/www/html'] = "${workspaceFolder}" }
    },
    {
        name = 'Launch currently open script',
        type = 'php',
        request = 'launch',
        program = '${file}',
        cwd = '${fileDirname}',
        port = 0,
        runtimeArgs = { '-dxdebug.start_with_request=yes' },
        env = {
            XDEBUG_MODE = "debug, develop",
            XDEBUG_CONFIG = "client_port=${port}"
        }
    },
    {
        name = 'Listen for PHPUnit Xdebug',
        type = 'php',
        request = 'launch',
        port = 9001,
        pathMappings = { ['/var/www/html'] = "${workspaceFolder}" },
        log = 'true'
    }
}
