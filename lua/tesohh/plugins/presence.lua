-- import presence plugin safely
local presence_setup, presence = pcall(require, "presence")
if not presence_setup then
	return
end

presence.setup()
