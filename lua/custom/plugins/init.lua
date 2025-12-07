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
  },
}
