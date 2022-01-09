local plugins = {}

plugins['nvim-treesitter/nvim-treesitter'] = {
  config = function ()
    -- vim.api.nvim_command('set foldmethod=expr')
    -- vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')
    require('nvim-treesitter.configs').setup {
      ensure_installed = "maintained",
      sync_install = true,
      highlight = {
        enable = true
      },
      indent = {
        enable = false,
      },
      context_commentstring = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
      textobjects = {
        select = {
          enable = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
      },
    }
  end
}

plugins['nvim-treesitter/playground'] = {
  cmd = 'TSPlaygroundToggle'
}

plugins['numToStr/Comment.nvim'] = {
  event = 'VimEnter',
  config = function()
    require("Comment").setup({
      ignore = '^$',
      pre_hook = function(ctx)
        -- Only calculate commentstring for tsx filetypes
        if vim.bo.filetype == 'typescriptreact' then
          local U = require('Comment.utils')

          -- Detemine whether to use linewise or blockwise commentstring
          local type = ctx.ctype == U.ctype.line and '__default' or '__multiline'

          -- Determine the location where to calculate commentstring from
          local location = nil
          if ctx.ctype == U.ctype.block then
            location = require('ts_context_commentstring.utils').get_cursor_location()
          elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
            location = require('ts_context_commentstring.utils').get_visual_start_location()
          end

          return require('ts_context_commentstring.internal').calculate_commentstring({
            key = type,
            location = location,
          })
        end
      end,
    })
    local ft = require('Comment.ft')
    ft.set('fish', '# %s')
  end
}

plugins['elixir-editors/vim-elixir'] = {
  opt = true,
  ft = {'elixir', 'eelixir'},
}

plugins['JoosepAlviste/nvim-ts-context-commentstring'] = {
  event = 'VimEnter',
  requires = {'nvim-treesitter', 'Comment.nvim'},
}

plugins['nvim-treesitter/nvim-treesitter-textobjects'] = {
  requires = 'nvim-treesitter',
}

plugins['styled-components/vim-styled-components'] = {
  branch = 'main',
  opt = true,
  ft = {'javascript', 'typescript', 'javascriptreact'},
}

plugins['jxnblk/vim-mdx-js'] = {
  opt = true,
  ft = {'mdx'}
}

plugins['iamcco/markdown-preview.nvim'] = {
  opt = true,
  ft = {'markdown'},
  run = 'cd app && yarn install',
  cmd = 'MarkdownPreview'
}

return plugins
