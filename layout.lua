
gui = { }

gui.dialog = iup.dialog{
	rastersize = "600x440", 
	title      = "Pro-Posta 0.1+",
	font       = "HELVETICA_BOLD_12",
	iup.vbox{
		margin = "10x10",
		gap    = "10",
		iup.hbox{
			margin = "0",
			iup.text{
				name       = "search",
				expand     = "HORIZONTAL",
				rastersize = "x24",
			},
			iup.button{
				name  = "menubutton",
			},
		},
		iup.list{
			name           = "result",
			visiblelines   = "1",
			visiblecolumns = "1",
			expand         = "YES",
			showimage      = "YES",
		},
	}
}

function gui.iupnames(self, elem)
	if type(elem) == "userdata" then
		if elem.name ~= "" and elem.name ~= nil then
			self[elem.name] = elem
		end
	end
	local i = 1
	while elem[i] do
		self:iupnames(elem[i])
		i = i + 1
	end
end

gui:iupnames(gui.dialog)
