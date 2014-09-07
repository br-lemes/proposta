
os.setlocale("pt_BR")
os.setlocale("C", "numeric")

require("lfs")
require("iuplua")
require("layout")
require("action")
require("functions")

fun.plugin("icons", "ico")
fun.plugin("plugins", "plug")

gui.dialog:show()
iup.MainLoop()
