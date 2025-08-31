return {
  'L3MON4D3/LuaSnip',
  -- follow latest release.
  version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  -- install jsregexp (optional!).
  build = 'make install_jsregexp',

  config = function()
    local luasnip = require 'luasnip'

    luasnip.config.set_config {
      -- Enable autotriggered snippets
      enable_autosnippets = true,

      -- Use Tab to trigger visual selection
      store_selections_keys = '<Tab>',
    }
    -- Load all snippets at startup
    require('luasnip.loaders.from_lua').load {
      paths = { '~/.config/nvim/LuaSnip/' },
    }
  end,
}
