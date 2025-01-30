return {
  -- Themery
  {
    'zaldih/themery.nvim',
    lazy = false,
    config = function()
      require('themery').setup {
        themes = { 'gruvbox', 'tokyonight', 'monokai', 'citruszest', 'ashen' },
        livePreview = true,
      }
    end,
  },
  -- Colorbuddy
  {
    'tjdevries/colorbuddy.nvim',
  },

  -- THEMES LIST
  { 'morhetz/gruvbox' }, -- Gruvbox
  --{ 'ayu-theme/ayu-vim' }, -- Ayu
  { 'folke/tokyonight.nvim' }, -- Tokyo Night
  { 'tanvirtin/monokai.nvim' },
  { 'zootedb0t/citruszest.nvim' },
  --{ 'scottmckendry/cyberdream.git' },
  --{ 'sainnhe/gruvbox-material.git' },
  --{ 'sainnhe/everforest.git' },
  { 'ficcdaf/ashen.nvim' },

  -- Alpha: Nvim Cover Page
  --  {
  --    'goolord/alpha-nvim',
  --    dependencies = { 'echasnovski/mini.icons' },
  --    config = function()
  --      require('alpha').setup(require('alpha.themes.startify').config)
  --    end,
  --  },

  -- Gruvbox-material
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.gruvbox_material_enable_italic = true
      vim.cmd.colorscheme 'gruvbox-material'
    end,
  },
}
