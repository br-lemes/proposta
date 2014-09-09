
fun = { }

fun.lmax = 75

fun.list = { }

fun.load_timer = iup.timer{
	time      = 500,
	run       = "NO",
	action_cb = function() fun.reload() end
}

function fun.fun(t, f)
	if t and type(t[f]) == "function" then
		return t[f]()
	end
	return nil
end

function fun.iupnames(elem, dest)
	if type(elem) == "userdata" then
		if elem.name ~= "" and elem.name ~= nil then
			dest[elem.name] = elem
		end
	end
	local i = 1
	while elem[i] do
		fun.iupnames(elem[i], dest)
		i = i + 1
	end
end

fun.iupnames(gui.dialog, gui)

function fun.question(message)
	local dlg = iup.messagedlg{
		title      = "Confirmar",
		value      = message,
		buttons    = "YESNO",
		dialogtype = "QUESTION"
	}
	dlg:popup()
	return dlg.buttonresponse == "1"
end

function fun.plugin(dir, name)
	_G[name] = { }
	if not lfs.attributes(dir) then return end
	for file in lfs.dir(dir) do
		local i = file:find("%.lua$")
		if i then
			require(string.format("%s.%s",
				dir, file:sub(1, i - 1)))
		end
	end
end

function fun.reload()
	fun.fun(plug.current, "reload")
	fun.itemcount = 0
	fun.load_timer.run = "NO"
	gui.result.autoredraw = "NO"
	iup.SetIdle(fun.itemload)
end

function fun.itemload()
	local n = fun.itemcount + 1
	local v = fun.list[n]
	if v and n <= fun.lmax then
		if gui.result[n] ~= v.name then
			gui.result[n] = v.name
		end
		if gui.result["image" .. n] ~= v.icon then
			gui.result["image" .. n] = v.icon
		end
		fun.itemcount = n
	else
		iup.SetIdle(nil)
		gui.result[n] = nil
		gui.result.autoredraw = "YES"
	end
end

function fun.plugopen(plugin)
	plug.current = plugin
	plugin.menuitem.value = "ON"
	gui.menubutton.image = plugin.icon
	fun.reload()
end
