local function basename(str)
    return string.gsub(str, "(.*/)(.*)", "%2")
end

local function lualine_harpoon()
    local harpoon = require("harpoon")
    local keys = { "h", "j", "k", "l" }
    local currentfile = basename(vim.fn.expand("%:p"))

    local s = ""

    for i, v in ipairs(harpoon:list().items) do
        local fn = basename(v.value)
        local prefix = fn ~= currentfile and keys[i] or "󰛢"

        s = s .. prefix .. " " .. fn
        if i < #harpoon:list().items then
            s = s .. " ► "
        end
    end

    if #harpoon:list().items == 0 then
        s = "󰛢"
    end

    return s
end

return {
    "nvim-lualine/lualine.nvim",
    opts = {
        options = {
            component_separators = "|",
            section_separators = { left = "", right = "" },
        },
        sections = {
            lualine_a = {
                { "mode", separator = { left = "" }, right_padding = 2 },
            },
            lualine_b = { "filename", "branch", "diff" },
            lualine_c = {},
            lualine_x = {},
            lualine_y = { { lualine_harpoon } },
            lualine_z = {
                { "location", separator = { right = "" }, left_padding = 2 },
            },
        },
        inactive_sections = {
            lualine_a = { "filename" },
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = { "location" },
        },
        tabline = {},
        extensions = {},
    },
}
