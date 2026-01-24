-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {

  -- my changes
  -- uncomment form using gruvbox
  --
  -- {
  --   {
  --     'ellisonleao/gruvbox.nvim',
  --     priority = 1000,
  --     config = function()
  --       -- Default options:
  --       require('gruvbox').setup {
  --         terminal_colors = true, -- add neovim terminal colors
  --         undercurl = true,
  --         underline = true,
  --         bold = true,
  --         italic = {
  --           strings = true,
  --           emphasis = true,
  --           comments = true,
  --           operators = false,
  --           folds = true,
  --         },
  --         strikethrough = true,
  --         invert_selection = false,
  --         invert_signs = false,
  --         invert_tabline = false,
  --         inverse = true, -- invert background for search, diffs, statuslines and errors
  --         contrast = '', -- can be "hard", "soft" or empty string
  --         palette_overrides = {},
  --         overrides = {},
  --         dim_inactive = false,
  --         transparent_mode = false,
  --       }
  --       vim.cmd 'colorscheme gruvbox'
  --     end,
  --     opts = ...,
  --   },
  -- },

  {
    'kdheepak/lazygit.nvim',
    lazy = true,
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
  },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = true,
  },
  {
    'chentoast/marks.nvim',
    event = 'VeryLazy',
    opts = {},
  },
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
  },
  -- {
  --   {
  --     'yetone/avante.nvim',
  --     -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --     -- ⚠️ must add this setting! ! !
  --     build = vim.fn.has 'win32' ~= 0 and 'powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false' or 'make',
  --     event = 'VeryLazy',
  --     version = false, -- Never set this value to "*"! Never!
  --     ---@module 'avante'
  --     ---@type avante.Config
  --     opts = {
  --       -- add any opts here
  --       -- for example
  --       provider = 'claude',
  --       providers = {
  --         claude = {
  --           endpoint = 'https://api.anthropic.com',
  --           model = 'claude-sonnet-4-20250514',
  --           timeout = 30000, -- Timeout in milliseconds
  --           extra_request_body = {
  --             temperature = 0.75,
  --             max_tokens = 20480,
  --           },
  --         },
  --         moonshot = {
  --           endpoint = 'https://api.moonshot.ai/v1',
  --           model = 'kimi-k2-0711-preview',
  --           timeout = 30000, -- Timeout in milliseconds
  --           extra_request_body = {
  --             temperature = 0.75,
  --             max_tokens = 32768,
  --           },
  --         },
  --       },
  --     },
  --     dependencies = {
  --       'nvim-lua/plenary.nvim',
  --       'MunifTanjim/nui.nvim',
  --       --- The below dependencies are optional,
  --       'echasnovski/mini.pick', -- for file_selector provider mini.pick
  --       'nvim-telescope/telescope.nvim', -- for file_selector provider telescope
  --       'hrsh7th/nvim-cmp', -- autocompletion for avante commands and mentions
  --       'ibhagwan/fzf-lua', -- for file_selector provider fzf
  --       'stevearc/dressing.nvim', -- for input provider dressing
  --       'folke/snacks.nvim', -- for input provider snacks
  --       'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
  --       'zbirenbaum/copilot.lua', -- for providers='copilot'
  --       {
  --         -- support for image pasting
  --         'HakonHarnes/img-clip.nvim',
  --         event = 'VeryLazy',
  --         opts = {
  --           -- recommended settings
  --           default = {
  --             embed_image_as_base64 = false,
  --             prompt_for_file_name = false,
  --             drag_and_drop = {
  --               insert_mode = true,
  --             },
  --             -- required for Windows users
  --             use_absolute_path = true,
  --           },
  --         },
  --       },
  --       {
  --         -- Make sure to set this up properly if you have lazy=true
  --         'MeanderingProgrammer/render-markdown.nvim',
  --         opts = {
  --           file_types = { 'markdown', 'Avante' },
  --         },
  --         ft = { 'markdown', 'Avante' },
  --       },
  --     },
  --   },
  -- },
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
  },
  {
    'mistweaverco/kulala.nvim',
    keys = {
      { '<leader>Rs', desc = 'Send request' },
      { '<leader>Ra', desc = 'Send all requests' },
      { '<leader>Rb', desc = 'Open scratchpad' },
    },
    ft = { 'http', 'rest' },
    opts = {
      -- your configuration comes here
      global_keymaps = false,
      global_keymaps_prefix = '<leader>R',
      kulala_keymaps_prefix = '',
    },
  },
  -- {
  --   'olimorris/codecompanion.nvim',
  --   opts = {},
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --     'nvim-treesitter/nvim-treesitter',
  --   },
  -- },
  {
    'folke/sidekick.nvim',
    opts = {
      -- add any options here
      cli = {
        mux = {
          backend = 'zellij',
          enabled = false,
        },
      },
    },
  -- stylua: ignore
	keys = {
	  {
		"<tab>",
		function()
		  -- if there is a next edit, jump to it, otherwise apply it if any
		  if not require("sidekick").nes_jump_or_apply() then
			return "<Tab>" -- fallback to normal tab
		  end
		end,
		expr = true,
		desc = "Goto/Apply Next Edit Suggestion",
	  },
	  {
		"<leader>aa",
		function() require("sidekick.cli").toggle() end,
		desc = "Sidekick Toggle CLI",
	  },
	  {
		"<leader>as",
		function() require("sidekick.cli").select() end,
		-- Or to select only installed tools:
		-- require("sidekick.cli").select({ filter = { installed = true } })
		desc = "Select CLI",
	  },
	  {
		"<leader>at",
		function() require("sidekick.cli").send({ msg = "{this}" }) end,
		mode = { "x", "n" },
		desc = "Send This",
	  },
	  {
		"<leader>av",
		function() require("sidekick.cli").send({ msg = "{selection}" }) end,
		mode = { "x" },
		desc = "Send Visual Selection",
	  },
	  {
		"<leader>ap",
		function() require("sidekick.cli").prompt() end,
		mode = { "n", "x" },
		desc = "Sidekick Select Prompt",
	  },
	  {
		"<c-.>",
		function() require("sidekick.cli").focus() end,
		mode = { "n", "x", "i", "t" },
		desc = "Sidekick Switch Focus",
	  },
	  -- Example of a keybinding to open Claude directly
	  {
		"<leader>ac",
		function() require("sidekick.cli").toggle({ name = "claude", focus = true }) end,
		desc = "Sidekick Toggle Claude",
	  },
	},
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  -- Amp Plugin
  {
    'sourcegraph/amp.nvim',
    branch = 'main',
    lazy = false,
    opts = { auto_start = true, log_level = 'info' },
    {
      'debugloop/telescope-undo.nvim',
      dependencies = { -- note how they're inverted to above example
        {
          'nvim-telescope/telescope.nvim',
          dependencies = { 'nvim-lua/plenary.nvim' },
        },
      },
      keys = {
        { -- lazy style key map
          '<leader>u',
          '<cmd>Telescope undo<cr>',
          desc = 'undo history',
        },
      },
      opts = {
        -- don't use `defaults = { }` here, do this in the main telescope spec
        extensions = {
          undo = {
            -- telescope-undo.nvim config, see below
          },
          -- no other extensions here, they can have their own spec too
        },
      },
      config = function(_, opts)
        -- Calling telescope's setup from multiple specs does not hurt, it will happily merge the
        -- configs for us. We won't use data, as everything is in it's own namespace (telescope
        -- defaults, as well as each extension).
        require('telescope').setup(opts)
        require('telescope').load_extension 'undo'
      end,
    },
  },
  {
    'kawre/leetcode.nvim',
    build = ':TSUpdate html', -- if you have `nvim-treesitter` installed
    dependencies = {
      -- include a picker of your choice, see picker section for more details
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      {
        '3rd/image.nvim',
        build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
        opts = {
          processor = 'magick_cli',
        },
      },
    },
    opts = {
      -- configuration goes here
      ---@type string
      arg = 'leetcode.nvim',

      ---@type lc.lang
      lang = 'cpp',

      cn = { -- leetcode.cn
        enabled = false, ---@type boolean
        translator = true, ---@type boolean
        translate_problems = true, ---@type boolean
      },

      ---@type lc.storage
      storage = {
        home = vim.fn.stdpath 'data' .. '/leetcode',
        cache = vim.fn.stdpath 'cache' .. '/leetcode',
      },

      ---@type table<string, boolean>
      plugins = {
        non_standalone = false,
      },

      ---@type boolean
      logging = true,

      injector = {}, ---@type table<lc.lang, lc.inject>

      cache = {
        update_interval = 60 * 60 * 24 * 7, ---@type integer 7 days
      },

      editor = {
        reset_previous_code = true, ---@type boolean
        fold_imports = true, ---@type boolean
      },

      console = {
        open_on_runcode = true, ---@type boolean

        dir = 'row', ---@type lc.direction

        size = { ---@type lc.size
          width = '90%',
          height = '75%',
        },

        result = {
          size = '60%', ---@type lc.size
        },

        testcase = {
          virt_text = true, ---@type boolean

          size = '40%', ---@type lc.size
        },
      },

      description = {
        position = 'left', ---@type lc.position

        width = '40%', ---@type lc.size

        show_stats = true, ---@type boolean
      },

      ---@type lc.picker
      picker = { provider = nil },

      hooks = {
        ---@type fun()[]
        ['enter'] = {},

        ---@type fun(question: lc.ui.Question)[]
        ['question_enter'] = {},

        ---@type fun()[]
        ['leave'] = {},
      },

      keys = {
        toggle = { 'q' }, ---@type string|string[]
        confirm = { '<CR>' }, ---@type string|string[]

        reset_testcases = 'r', ---@type string
        use_testcase = 'U', ---@type string
        focus_testcases = 'H', ---@type string
        focus_result = 'L', ---@type string
      },

      ---@type lc.highlights
      theme = {},

      ---@type boolean
      image_support = false,
    },
  },
  {
    'mikesmithgh/kitty-scrollback.nvim',
    enabled = true,
    lazy = true,
    cmd = {
      'KittyScrollbackGenerateKittens',
      'KittyScrollbackCheckHealth',
      'KittyScrollbackGenerateCommandLineEditing',
    },
    event = { 'User KittyScrollbackLaunch' },
    -- version = '*', -- latest stable version, may have breaking changes if major version changed
    -- version = '^6.0.0', -- pin major version, include fixes and features that do not have breaking changes
    config = function()
      require('kitty-scrollback').setup()
    end,
  },
  {
    'mikavilpas/yazi.nvim',
    version = '*', -- use the latest stable version
    event = 'VeryLazy',
    dependencies = {
      { 'nvim-lua/plenary.nvim', lazy = true },
    },
    keys = {
      -- 👇 in this section, choose your own keymappings!
      {
        '<leader>-',
        mode = { 'n', 'v' },
        '<cmd>Yazi<cr>',
        desc = 'Open yazi at the current file',
      },
      {
        -- Open in the current working directory
        '<leader>cw',
        '<cmd>Yazi cwd<cr>',
        desc = "Open the file manager in nvim's working directory",
      },
      {
        '<c-up>',
        '<cmd>Yazi toggle<cr>',
        desc = 'Resume the last yazi session',
      },
    },
    opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = false,
      keymaps = {
        show_help = '<f1>',
      },
    },
    -- 👇 if you use `open_for_directories=true`, this is recommended
    init = function()
      -- mark netrw as loaded so it's not loaded at all.
      --
      -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
      vim.g.loaded_netrwPlugin = 1
    end,
  },
  {
    'R-nvim/R.nvim',
    -- Only required if you also set defaults.lazy = true
    lazy = false,
    -- R.nvim is still young and we may make some breaking changes from time
    -- to time (but also bug fixes all the time). If configuration stability
    -- is a high priority for you, pin to the latest minor version, but unpin
    -- it and try the latest version before reporting an issue:
    -- version = "~0.1.0"
    config = function()
      -- Create a table with the options to be passed to setup()
      ---@type RConfigUserOpts
      local opts = {
        hook = {
          on_filetype = function()
            vim.api.nvim_buf_set_keymap(0, 'n', '<Enter>', '<Plug>RDSendLine', {})
            vim.api.nvim_buf_set_keymap(0, 'v', '<Enter>', '<Plug>RSendSelection', {})
          end,
        },
        R_args = { '--quiet', '--no-save' },
        min_editor_width = 72,
        rconsole_width = 78,
        objbr_mappings = { -- Object browser keymap
          c = 'class', -- Call R functions
          ['<localleader>gg'] = 'head({object}, n = 15)', -- Use {object} notation to write arbitrary R code.
          v = function()
            -- Run lua functions
            require('r.browser').toggle_view()
          end,
        },
        disable_cmds = {
          'RClearConsole',
          'RCustomStart',
          'RSPlot',
          'RSaveClose',
        },
      }
      -- Check if the environment variable "R_AUTO_START" exists.
      -- If using fish shell, you could put in your config.fish:
      -- alias r "R_AUTO_START=true nvim"
      if vim.env.R_AUTO_START == 'true' then
        opts.auto_start = 'on startup'
        opts.objbr_auto_start = true
      end
      require('r').setup(opts)
    end,
  },
}
