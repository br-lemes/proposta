
fun = { }

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
