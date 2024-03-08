local commands = {
	rust = "cargo run",
	go = "go run .",
	java = "jmain",
}

local Terminal = require("toggleterm.terminal").Terminal:new({
	hidden = true,
	direction = "float",
	close_on_exit = false,
})

local function run()
	local ft = vim.bo.filetype
	local run_command = commands[ft]
	Terminal.cmd = run_command
	Terminal:open()
end

vim.keymap.set({ "n", "x" }, "<leader>rp", run)
