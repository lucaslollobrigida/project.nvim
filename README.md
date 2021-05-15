# project.nvim

*Work in progress*

Browser and launch your projects with telescope.

## Requires

`telescope` to be installed.

## Installation

Plug:
```vim
Plug 'lucaslollobrigida/project.nvim', { 'branch': 'main' }
```

Packer:
```lua
use {'lucaslollobrigida/project.nvim', branch = 'main'}
```

## Usage

`project.browse`
- `require('telescope').extensions.project.browse()`

Can be called with `:Telescope project browse`

- `<CR>` opens project in current window
- `<C-t>` opens project in a new tab

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

- [ ] Tests
- [ ] Add action configuration
- [ ] Normalize ~ into full path
- [ ] Default file to open (entry file) per path
- [ ] Preview entry file option?
- [ ] Pattern list per location?
