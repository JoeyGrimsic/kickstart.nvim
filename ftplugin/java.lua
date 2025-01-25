local jdtls = require 'jdtls'
local home = os.getenv 'HOME'

-- (1) Construct the workspace folder path
--     Eclipse jdt.ls needs a separate data folder per project (for internal state).
--     This picks a folder name based on your current directory name:
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = home .. '/.local/share/eclipse/' .. project_name

-- (2) Find the mason-installed JDTLS location
--     Mason typically puts jdtls here:
local mason_jdtls = home .. '/.local/share/nvim/mason/packages/jdtls'

-- (3) Set up the `cmd` that launches jdtls:
local config = {
  cmd = {
    'java', -- Make sure this is Java 21+
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '--add-modules=ALL-SYSTEM',
    '--add-opens',
    'java.base/java.util=ALL-UNNAMED',
    '--add-opens',
    'java.base/java.lang=ALL-UNNAMED',

    -- The jar file inside the Mason-installed jdtls:
    '-jar',
    mason_jdtls .. '/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar',

    -- The jdtls config (linux, mac, or win):
    '-configuration',
    mason_jdtls .. '/config_linux', -- or config_mac / config_win

    -- The workspace
    '-data',
    workspace_dir,
  },

  -- Determine root directory for your project.
  root_dir = require('jdtls.setup').find_root { '.git', 'mvnw', 'gradlew' },

  -- Extra options; for simple code-completion of fields, default is fine:
  settings = {
    java = {},
  },
}

-- Start or attach
jdtls.start_or_attach(config)
