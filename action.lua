
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

function gui.search:valuechanged_cb()
	if gui.mainzbox.value ~= gui.resultbox then return end
	fun.load_timer.run  = "NO"
	fun.load_timer.run  = "YES"
end

function gui.menubutton:action()
	gui.menu:popup(iup.MOUSEPOS, iup.MOUSEPOS)
end
