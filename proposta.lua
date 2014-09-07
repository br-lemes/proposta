
os.setlocale("pt_BR")
os.setlocale("C", "numeric")

require("lfs")
require("iuplua")
require("layout")
require("action")
require("functions")

fun.plugin("icons", "ico")
fun.plugin("plugins", "plug")

if plug[1] and plug[1].open then
	plug[1].open()
end

gui.dialog:show()
iup.MainLoop()
