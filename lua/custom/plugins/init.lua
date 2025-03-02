return {
  -- Themery configuration
  {
    'zaldih/themery.nvim',
    lazy = false,
    config = function()
      require('themery').setup {
        themes = { 'gruvbox', 'tokyonight', 'monokai', 'citruszest', 'ashen', 'gruvbox-material' },
        livePreview = true,
        beforeReload = function(theme)
          --_G.force_transparency() --uncomment to enable transparency by default
        end,
      }
    end,
  },

  { 'jiangmiao/auto-pairs' },

  -- Universal transparency setup with toggle
  {
    'nvim-lua/plenary.nvim',
    config = function()
      -- State management (set default to false)
      _G.transparency_enabled = false

      -- Transparency function
      _G.force_transparency = function()
        vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
        vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
        vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
        vim.api.nvim_set_hl(0, 'LineNr', { bg = 'none' })
        vim.api.nvim_set_hl(0, 'CursorLine', { bg = 'none' })
        vim.api.nvim_set_hl(0, 'CursorLineNr', { bg = 'none' })
        vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
      end

      -- Toggle function
      _G.toggle_transparency = function()
        _G.transparency_enabled = not _G.transparency_enabled
        if _G.transparency_enabled then
          _G.force_transparency()
          vim.notify('Transparency enabled', vim.log.levels.INFO)
        else
          -- Reset to theme defaults
          vim.cmd('colorscheme ' .. vim.g.colors_name)
          vim.notify('Transparency disabled', vim.log.levels.INFO)
        end
      end

      -- Theme change handler
      vim.api.nvim_create_autocmd('ColorScheme', {
        pattern = '*',
        callback = function()
          if _G.transparency_enabled then
            _G.force_transparency()
          end
        end,
      })

      -- Keymap
      vim.keymap.set('n', '<leader>tt', '<cmd>lua toggle_transparency()<CR>', {
        desc = '[T]oggle [T]ransparency',
        silent = true,
      })
    end,
  },

  -- Theme plugins
  { 'folke/tokyonight.nvim' },
  { 'morhetz/gruvbox' },
  { 'tanvirtin/monokai.nvim' },
  { 'zootedb0t/citruszest.nvim' },
  { 'ficcdaf/ashen.nvim' },
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_enable_italic = true
    end,
  },

  -- Other plugins
  { 'tjdevries/colorbuddy.nvim' },
  { 'ThePrimeagen/vim-be-good' },
}
