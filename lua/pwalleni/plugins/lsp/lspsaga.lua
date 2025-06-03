local saga = require("lspsaga")

saga.setup({
	use_saga_diagnostic_sign = true,
	error_sign = "",
    warn_sign = "",
    hint_sign = " ",
    infor_sign = "",
	border_style = "round",
})
