
plug.tel = { }

if not plug.current then plug.current = plug.tel end

plug.tel.icon = ico.telephone
plug.tel.menuitem = iup.item{
	title  = "Telefones",
	action = function() fun.plugopen(plug.tel) end
}

iup.Insert(gui.menu, nil, plug.tel.menuitem)

function plug.tel.comp(a, b)
	local aname = a.name:match("%d%d%d%d%-%d%d%d%d (.*)")
	local bname = b.name:match("%d%d%d%d%-%d%d%d%d (.*)")
	if aname < bname then
		return true
	else
		return false
	end
end

function plug.tel:reload()
	fun.list = { }
	local datafile = io.open("telephone.txt", "r")
	if not datafile then return end
	local search = ""
	if gui.search.value then
		search = gui.search.value:
			gsub("^(%d%d%d%d)%-", "%1%%-"):upper()
	end
	for line in datafile:lines() do
		line = line:upper():gsub("\r", "")
		if line:find("^%d%d%d%d%-%d%d%d%d") and line:find(search) then
			table.insert(fun.list, { name = line, icon = ico.telephone })
		end
	end
	table.sort(fun.list, plug.tel.comp)
end
