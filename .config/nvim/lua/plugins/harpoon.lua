return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
    config = function ()
        local harpoon = require("harpoon")
        harpoon:setup()

        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon: Add file" })
        vim.keymap.set("n", "<leader>d", function() harpoon:list():remove() end, { desc = "Harpoon: Remove current file" })

        vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon: Go to file 1" })
        vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Harpoon: Go to file 2" })
        vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Harpoon: Go to file 3" })
        vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Harpoon: Go to file 4" })
        vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end, { desc = "Harpoon: Go to file 5" })

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end, { desc = "Harpoon: Previous file" })
        vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end, { desc = "Harpoon: Next file" })

        local has_telescope, telescope_conf = pcall(function()
            return require("telescope.config").values
        end)

        local function toggle_telescope(harpoon_files)
            if not has_telescope then
                harpoon.ui:toggle_quick_menu(harpoon_files)
                return
            end

            local pickers = require("telescope.pickers")
            local finders = require("telescope.finders")
            local action_state = require("telescope.actions.state")

            local function build_file_paths()
                local file_paths = {}
                for i = 1, harpoon_files:length() do
                    local item = harpoon_files.items[i]
                    if item and item.value and item.value ~= "" then
                        table.insert(file_paths, item.value)
                    end
                end
                return file_paths
            end

            pickers.new({}, {
                prompt_title = "Harpoon (<C-x> remove)",
                finder = finders.new_table({
                    results = build_file_paths(),
                }),
                previewer = telescope_conf.file_previewer({}),
                sorter = telescope_conf.generic_sorter({}),
                attach_mappings = function(prompt_bufnr, map)
                    local function remove_selected()
                        local selection = action_state.get_selected_entry()
                        if not selection or not selection.value then
                            return
                        end

                        harpoon_files:remove({ value = selection.value })

                        local current_picker = action_state.get_current_picker(prompt_bufnr)
                        current_picker:refresh(finders.new_table({
                            results = build_file_paths(),
                        }), { reset_prompt = true })
                    end

                    map("i", "<C-x>", remove_selected)
                    map("n", "<C-x>", remove_selected)

                    return true
                end,
            }):find()
        end

        vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
            { desc = "Harpoon: Open list" })
            end
}
