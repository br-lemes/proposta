
function gui.dialog:close_cb()
	if fun.question("Sair do Pro-Posta?") then
		self:hide()
	else
		gui.result.value = nil
		iup.SetFocus(gui.search)
		return iup.IGNORE
	end
end

function gui.dialog:k_any(k)
	if k == iup.K_ESC then
		self:close_cb()
	end
end

function gui.result:k_any(k)
	if k == iup.K_CR then
		fun.fun(plug.current, "enter")
	elseif k == iup.K_F2 then
		fun.fun(plug.current, "edit")
	elseif k == iup.K_DEL then
		fun.fun(plug.current, "delete")
	else return iup.CONTINUE
	end
end

function gui.result:dblclick_cb()
	fun.fun(plug.current, "dblclick")
end

function gui.search:valuechanged_cb()
	if gui.mainzbox.value ~= gui.resultbox then return end
	fun.load_timer.run  = "NO"
	fun.load_timer.run  = "YES"
end

function gui.menubutton:action()
	gui.menu:popup(iup.MOUSEPOS, iup.MOUSEPOS)
end
