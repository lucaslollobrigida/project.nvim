local has_telescope, telescope = pcall(require, 'telescope')
if not has_telescope then
  error('This plugins requires telescope.nvim')
end

local Path = require('plenary.path')
local scan = require('plenary.scandir')

local state   = require('telescope.state')
local finders = require('telescope.finders')
local pickers = require('telescope.pickers')
local sorters = require('telescope.sorters')

local actions      = require('telescope.actions')
local action_state = require('telescope.actions.state')

local default_pattern = '.git$'
local default_depth = 1

local default_config = {
    locations = {},
}

local get_dirs = function(locations)
    local results = {}

    for _, location in ipairs(locations) do
        local lpath = location[1]
        local pattern = location.pattern or default_pattern
        local depth = location.depth or default_depth
        local items = scan.scan_dir(lpath, { search_pattern = pattern, hidden = true, add_dirs = true, depth = depth + 1 })

        for _, item in ipairs(items) do
            local p = Path:new { item , sep = '/'}
            table.insert(results, p:parent())
        end
    end

    return results
end

local launcher = function(cmd)
    return function(prompt_bufnr)
        actions.close(prompt_bufnr)
        local entry = action_state.get_selected_entry()

        if cmd and cmd ~= nil then
            vim.cmd(cmd)
        end

        vim.cmd(string.format('lcd %s', entry.value))
    end
end

local open_on_current = launcher()
local open_on_new_tab = launcher('tabnew')
local open_on_new_vsplit = launcher('vsplit')

local browse = function()
    local project_dirs = get_dirs(state.explorer_config.locations)

    pickers.new({
        prompt_title = 'Projects',
        finder = finders.new_table(project_dirs),
        sorter = sorters.get_fzy_sorter(),
        attach_mappings = function(_, map)
            map('i', '<CR>', open_on_current)
            map('n', '<CR>', open_on_current)

            map('i', '<C-t>', open_on_new_tab)
            map('n', '<C-t>', open_on_new_tab)

            map('i', '<C-v>', open_on_new_vsplit)
            map('n', '<C-v>', open_on_new_vsplit)
            return true
        end,
        default_selection_index = 1,
    }):find()
end

return telescope.register_extension {
    setup = function(user_opts, _)
        local config = vim.tbl_deep_extend('keep', user_opts, default_config)

        state.explorer_config = config
    end,
    exports = {
        browse = browse,
    }
}
