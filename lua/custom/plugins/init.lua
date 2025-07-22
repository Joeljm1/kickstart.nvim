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
}
