# project.nvim

Browser and launch your projects with telescope.

## Requires

`telescope` to be installed.

## Installation

Plug:
```vim
Plug 'lucaslollobrigida/explorer.nvim'
```

Packer:
```lua
use {'lucaslollobrigida/explorer.nvim'}
```

## Usage

`explorer.browse`
- `require('telescope').extensions.explorer.browse()`

Can be called with `:Telescope explorer browse`

## Configuration

```lua
require('telescope').setup {
    extensions = {
        explorer = {
            locations = {
                {'~/projects'},
                {'~/notes', pattern = 'Makefile'},
                {'~/.dotfiles', depth = 1},
            },
        }
    }
}
```

## TODO

+ [ ] Tests
- [ ] Add action configuration
- [ ] Normalize ~ into full path
- [ ] Default file to open (entry file) per path
- [ ] Preview entry file option?
- [ ] Pattern list per location?
