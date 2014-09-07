
os.setlocale("pt_BR")
os.setlocale("C", "numeric")

require("lfs")
require("iuplua")
require("layout")
require("action")
require("functions")

function require_dir(dir)
	if not lfs.attributes(dir) then return end
	for file in lfs.dir(dir) do
		local i = file:find("%.lua$")
		if i then
			require(string.format("%s.%s",
				dir, file:sub(1, i - 1)))
		end
	end
end

ico = { }
plug = { }
require_dir("icons")
require_dir("plugins")

gui.dialog:show()
iup.MainLoop()
