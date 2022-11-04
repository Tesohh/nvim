local status, feline = pcall(require, "feline")
if not status then
	return
end

-- local navic_setup, navic = pcall(require, "nvim-navic")
-- if not navic_setup then
-- 	return
-- end

local clrs = require("catppuccin.palettes").get_palette()
local lsp = require("feline.providers.lsp")
local vi_mode_utils = require("feline.providers.vi_mode")

local force_inactive = {
	filetypes = {},
	buftypes = {},
	bufnames = {},
}

local components = {
	active = { {}, {}, {} },
	inactive = { {}, {}, {} },
}

local colors = {
	bg = "NONE",
	black = clrs.text,
	yellow = clrs.yellow,
	cyan = clrs.teal,
	oceanblue = clrs.blue,
	green = clrs.green,
	orange = clrs.maroon,
	violet = clrs.lavender,
	lavender = clrs.lavender,
	magenta = clrs.flamingo,
	white = clrs.subtext1,
	fg = clrs.text,
	skyblue = clrs.sky,
	red = clrs.red,
}

local vi_mode_colors = {
	NORMAL = "lavender",
	OP = "green",
	INSERT = "orange",
	VISUAL = "skyblue",
	LINES = "skyblue",
	BLOCK = "skyblue",
	REPLACE = "violet",
	["V-REPLACE"] = "violet",
	ENTER = "cyan",
	MORE = "cyan",
	SELECT = "orange",
	COMMAND = "magenta",
	SHELL = "green",
	TERM = "green",
	NONE = "yellow",
}

local vi_mode_text = {
	NORMAL = "n",
	OP = "op",
	INSERT = "i",
	VISUAL = "v",
	LINES = "vl",
	BLOCK = "vb",
	REPLACE = "r",
	["V-REPLACE"] = "vr",
	ENTER = "e",
	MORE = "more",
	SELECT = "s",
	COMMAND = "c",
	SHELL = "$",
	TERM = "t",
	NONE = "NONE",
}

local buffer_not_empty = function()
	if vim.fn.empty(vim.fn.expand("%:t")) ~= 1 then
		return true
	end
	return false
end

local checkwidth = function()
	local squeeze_width = vim.fn.winwidth(0) / 2
	if squeeze_width > 40 then
		return true
	end
	return false
end

force_inactive.filetypes = {
	"NvimTree",
	"dbui",
	"packer",
	"startify",
	"fugitive",
	"fugitiveblame",
}

force_inactive.buftypes = {
	"terminal",
}

-- LEFT

-- vi-mode

-- vi-symbol
components.active[1][1] = {
	provider = function()
		return " " .. vi_mode_text[vi_mode_utils.get_vim_mode()]
	end,
	hl = function()
		local val = {}
		val.fg = vi_mode_utils.get_mode_color()
		val.bg = "bg"
		val.style = "bold"
		return val
	end,
	right_sep = " ",
}
-- filename
components.active[1][2] = {
	provider = function()
		local filename = vim.fn.expand("%:t")
		local extension = vim.fn.expand("%:e")
		local icon = require("nvim-web-devicons").get_icon(filename, extension)
		if icon == nil then
			icon = ""
		end
		return icon .. " " .. vim.fn.expand("%:t")
	end,
	hl = {
		fg = "skyblue",
		bg = "bg",
		style = "bold",
	},
	right_sep = {
		str = "  ",
		hl = {
			fg = "skyblue",
			bg = "bg",
			style = "bold",
		},
	},
}
-- gitBranch
components.active[1][3] = {
	provider = "git_branch",
	hl = {
		fg = "yellow",
		bg = "bg",
		style = "bold",
	},
}

-- MID
-- -- Navic
-- components.active[2][1] = {
-- 	provider = function()
-- 		return navic.get_location()
-- 	end,
-- 	enabled = function()
-- 		return navic.is_available()
-- 	end,
-- 	hl = {
-- 		bg = "bg",
-- 	},
-- 	right_sep = "",
-- }

-- fileIcon
components.active[3][1] = {
	provider = function()
		local filename = vim.fn.expand("%:t")
		local extension = vim.fn.expand("%:e")
		local icon = require("nvim-web-devicons").get_icon(filename, extension)
		if icon == nil then
			icon = ""
		end
		return icon
	end,
	hl = function()
		local val = {}
		local filename = vim.fn.expand("%:t")
		local extension = vim.fn.expand("%:e")
		local icon, name = require("nvim-web-devicons").get_icon(filename, extension)
		if icon ~= nil then
			val.fg = vim.fn.synIDattr(vim.fn.hlID(name), "fg")
		else
			val.fg = "white"
		end
		val.bg = "bg"
		val.style = "bold"
		return val
	end,
	right_sep = " ",
}
-- fileType
components.active[3][2] = {
	provider = "file_type",
	hl = function()
		local val = {}
		local filename = vim.fn.expand("%:t")
		local extension = vim.fn.expand("%:e")
		local icon, name = require("nvim-web-devicons").get_icon(filename, extension)
		if icon ~= nil then
			val.fg = vim.fn.synIDattr(vim.fn.hlID(name), "fg")
		else
			val.fg = "white"
		end
		val.bg = "bg"
		val.style = "bold"
		return val
	end,
	right_sep = " ",
}
-- diagnosticErrors
components.active[3][3] = {
	provider = "diagnostic_errors",
	enabled = function()
		return lsp.diagnostics_exist(vim.diagnostic.severity.ERROR)
	end,
	hl = {
		fg = "red",
		style = "bold",
	},
}
-- diagnosticWarn
components.active[3][4] = {
	provider = "diagnostic_warnings",
	enabled = function()
		return lsp.diagnostics_exist(vim.diagnostic.severity.WARN)
	end,
	hl = {
		fg = "yellow",
		style = "bold",
	},
}
-- diagnosticHint
components.active[3][5] = {
	provider = "diagnostic_hints",
	enabled = function()
		return lsp.diagnostics_exist(vim.diagnostic.severity.HINT)
	end,
	hl = {
		fg = "cyan",
		style = "bold",
	},
}
-- diagnosticInfo
components.active[3][6] = {
	provider = "diagnostic_info",
	enabled = function()
		return lsp.diagnostics_exist(vim.diagnostic.severity.INFO)
	end,
	hl = {
		fg = "skyblue",
		style = "bold",
	},
	right_sep = " ",
}

components.active[3][7] = {
	provider = function()
		return " " .. os.date("%H:%M") .. " "
	end,
	hl = {
		fg = "cyan",
		bg = "bg",
		style = "bold",
	},
}

-- INACTIVE

-- filename
components.inactive[1][1] = {
	provider = function()
		local filename = vim.fn.expand("%:t")
		local extension = vim.fn.expand("%:e")
		local icon = require("nvim-web-devicons").get_icon(filename, extension)
		if icon == nil then
			icon = ""
		end
		return icon .. " " .. vim.fn.expand("%:t")
	end,
	hl = {
		fg = "skyblue",
		bg = "bg",
		style = "bold",
	},
	right_sep = {
		str = "  ",
		hl = {
			fg = "skyblue",
			bg = "bg",
			style = "bold",
		},
	},
}

feline.setup({
	theme = colors,
	default_bg = bg,
	default_fg = fg,
	vi_mode_colors = vi_mode_colors,
	components = components,
	force_inactive = force_inactive,
})
