-- import presence plugin safely
local dashboard_setup, db = pcall(require, "dashboard")
if not dashboard_setup then
	return
end

db.custom_center = {
	{
		icon = "  ",
		desc = "New File                                ",
		action = "enew",
		shortcut = "SPC n  ",
	},
	{
		icon = "  ",
		desc = "Find  File                              ",
		action = "Telescope find_files find_command=rg,--hidden,--files",
		shortcut = "SPC f f",
	},
	{
		icon = "  ",
		desc = "File Browser                            ",
		action = "NvimTreeToggle",
		shortcut = "SPC e  ",
	},
}

db.custom_header = {
	"",
	"",
	" _   _  _____ _____  _   _ ________  ___",
	"| \\ | ||  ___|  _  || | | |_   _|  \\/  |",
	"|  \\| || |__ | | | || | | | | | | .  . |",
	"| . ` ||  __|| | | || | | | | | | |\\/| |",
	"| |\\  || |___\\ \\_/ /\\ \\_/ /_| |_| |  | |",
	"\\_| \\_/\\____/ \\___/  \\___/ \\___/\\_|  |_/",
	"",
}
