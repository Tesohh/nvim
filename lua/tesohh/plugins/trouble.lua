local setup_trouble, trouble = pcall(require, "trouble")
if not setup_trouble then
	return
end

local setup_todo, todo = pcall(require, "todo-comments")
if not setup_todo then
	return
end

trouble.setup()
todo.setup({})
