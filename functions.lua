
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
