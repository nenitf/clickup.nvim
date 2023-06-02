<!-- panvimdoc-ignore-start -->

# clickup.nvim

Integração simples com clickup

- Listar tickets do clickup

<!-- panvimdoc-ignore-end -->

# Installation

**Using Packer**

```lua
use {
'nenitf/clickup.nvim',
requires = {
  'nvim-lua/plenary.nvim',
},
config = function()
  require('clickup-nvim').setup({
    env = {
      api_token = vim.env.CLICKUP_API_TOKEN,
      user_id = vim.env.CLICKUP_USER_ID,
      default_workspace = vim.env.CLICKUP_WORKSPACE_ID,
      default_space = vim.env.CLICKUP_SPACE_ID,
    }
  })
end,
}
```

# Configuration

- Recomendo utilizar `vim.env.NOMEDEVARIAVEL` a partir de um arquivo não versionado

```lua
local default_config = {
    env = {
        api_token = "pk_userid_etc",
        user_id = "userid",
        default_space = "spaceid",
        default_workspace = "workspaceid",
        default_filters = {
            statuses = {
                "ready for development",
                "backlog",
                "code review",
                "in development",
            },
        },
    },
}
```

- `env.api_token`: Token que é pego dentro do clickup
- `env.user_id`: Id do seu usuário
- `env.default_workspace`: Workspace
- `env.default_space`: Space
- `env.filters.statuses`: Status que devem aparecer

# Usage

#### :Clickup {doc=:Clickup}

Listar todos tickets na quick fix list
