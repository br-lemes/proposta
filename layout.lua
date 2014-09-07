
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
		iup.zbox{
			name   = "mainzbox",
			margin = "0",
			iup.vbox{
				name = "resultbox",
				iup.list{
					name           = "result",
					visiblelines   = "1",
					visiblecolumns = "1",
					expand         = "YES",
					showimage      = "YES",
				},
				iup.zbox{
					name       = "bottomzbox",
					rastersize = "x50",
				},
			},
		},
	},
}
