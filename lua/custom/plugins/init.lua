return {
  -- Themery.nvim
  {
    'zaldih/themery.nvim',
    lazy = false,
    config = function()
      require('themery').setup {
        themes = { 'gruvbox', 'tokyonight', 'monokai', 'citruszest', 'ashen', 'linlin' },
        livePreview = true,
      }
    end,
  },

  -- Example themes
  { 'morhetz/gruvbox' }, -- Gruvbox
  --{ 'ayu-theme/ayu-vim' }, -- Ayu
  { 'folke/tokyonight.nvim' }, -- Tokyo Night
  { 'tanvirtin/monokai.nvim' },
  { 'zootedb0t/citruszest.nvim' },
  --{ 'scottmckendry/cyberdream.git' },
  --{ 'sainnhe/gruvbox-material.git' },
  --{ 'sainnhe/everforest.git' },
  { 'ficcdaf/ashen.nvim' },

  --  {
  --    'goolord/alpha-nvim',
  --    dependencies = { 'echasnovski/mini.icons' },
  --    config = function()
  --      require('alpha').setup(require('alpha.themes.startify').config)
  --    end,
  --  },
}
