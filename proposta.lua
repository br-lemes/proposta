
os.setlocale("pt_BR")
os.setlocale("C", "numeric")

require("lfs")
require("iuplua")
require("layout")
require("functions")
require("action")

fun.plugin("icons", "ico")
fun.plugin("plugins", "plug")

fun.plugopen(plug.current)
gui.dialog:show()
iup.MainLoop()
