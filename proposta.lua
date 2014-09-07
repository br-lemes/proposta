
os.setlocale("pt_BR")
os.setlocale("C", "numeric")

require("lfs")
require("iuplua")
require("layout")
require("functions")
require("action")

fun.plugin("icons", "ico")
fun.plugin("plugins", "plug")

plug.current = 1
fun.fun(plug, plug.current, "open")

gui.dialog:show()
fun.reload()
iup.MainLoop()
