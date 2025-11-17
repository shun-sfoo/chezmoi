# README

## chezmoi

usage:

1. after modify config, use `chezmoi add`
2. look diff by `chezmoi diff`
3. apply the change `chezmoi -v apply`
4. push by `chezmoi cd` and `git add .` and `git commit -m` and `git push`

restore:

`chezmoi init --apply https://github.com/shun-sfoo/chezmoi.git`

## nvim

enable extras:

- [x] lang.clangd
- [x] lang.cmake
- [x] coding.blink
- [x] coding.yanky
- [x] editor.dial
- [x] editor.inc-rename
- [x] editor.snacks_explorer
- [x] util.dot
- [x] util.mini-hipatterns
- [x] util.json
- [x] util.markdown
- [x] util.python

### autocmds

```lua
-- autocmds.lua 
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    vim.cmd("setlocal formatoptions-=c formatoptions-=o formatoptions+=r formatoptions+=n")
  end,
})

-- markdown 和 纯文本中关闭单词检查
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text" },
  callback = function()
    vim.opt_local.spell = false
  end,
})

```

### keymaps

```lua
# keymaps.lua
vim.keymap.set("i", "jk", "<Esc>", nil)
```

### options

```lua
-- options.lua
vim.g.autoformat = false

```

### plugins

```lua
-- add plugins/my.lua
return {
  {
    "Pocco81/auto-save.nvim",
    lazy = false,
    opts = {
      debounce_delay = 500,
      condition = function(buf)
        local fn = vim.fn
        local utils = require("auto-save.utils.data")
        if fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.getbufvar(buf, "&filetype"), { "hyprlang", "zsh.chezmoitmpl" }) then
          return true -- met condition(s), can save
        end
        return false -- can't save
      end,
      execution_message = {
        message = function()
          return ""
        end,
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "storm",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      on_colors = function(colors)
        colors.bg_statusline = colors.none
      end,
    },
  },
}

```
