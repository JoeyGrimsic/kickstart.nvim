-- clipboard.lua

-- Detect whether we are on Wayland
local is_wayland = (os.getenv 'WAYLAND_DISPLAY' ~= nil)

-- Check if "wl-copy" or "xclip" is executable
local has_wl_clip = (vim.fn.executable 'wl-copy' == 1)
local has_xclip = (vim.fn.executable 'xclip' == 1)

if is_wayland and has_wl_clip then
  -- Wayland + wl-clipboard
  vim.g.clipboard = {
    name = 'wl-clipboard (Wayland)',
    copy = {
      ['+'] = 'wl-copy',
      ['*'] = 'wl-copy',
    },
    paste = {
      ['+'] = 'wl-paste --no-newline',
      ['*'] = 'wl-paste --no-newline',
    },
    cache_enabled = 1,
  }
elseif has_xclip then
  -- Xorg + xclip
  vim.g.clipboard = {
    name = 'xclip (X11)',
    copy = {
      ['+'] = 'xclip -selection clipboard',
      ['*'] = 'xclip -selection primary',
    },
    paste = {
      ['+'] = 'xclip -selection clipboard -o',
      ['*'] = 'xclip -selection primary -o',
    },
    cache_enabled = 1,
  }
else
  -- Fallback: rely on Neovim’s built-in unnamedplus or do nothing
  vim.opt.clipboard = 'unnamedplus'
end
