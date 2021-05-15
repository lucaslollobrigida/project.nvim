# project.nvim

Browser and launch your projects with telescope.

## Requires

`telescope` to be installed.

## Installation

Plug:
```vim
Plug 'lucaslollobrigida/project.nvim'
```

Packer:
```lua
use {'lucaslollobrigida/project.nvim'}
```

## Usage

`project.browse`
- `require('telescope').extensions.project.browse()`

Can be called with `:Telescope project browse`

## Configuration

```lua
require('telescope').setup {
    extensions = {
        project = {
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
