local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

local mkdocs_admonition_snippets = {
	s("admonition-note", {
		t({
			'!!! note "Note"',
			"",
			"    Note content goes here.",
			"",
		}),
	}),
	s("admonition-tip", {
		t({
			'!!! tip "Tip"',
			"",
			"    Tip content goes here.",
			"",
		}),
	}),
	s("admonition-warning", {
		t({
			'!!! warning "warning"',
			"",
			"    Warning content goes here.",
			"",
		}),
	}),
	s("admonition-important", {
		t({
			'!!! important "important"',
			"",
			"    Important content goes here.",
			"",
		}),
	}),
	s("admonition-info", {
		t({
			'!!! info "Info"',
			"",
			"    Info content goes here.",
			"",
		}),
	}),
}

ls.add_snippets("markdown", mkdocs_admonition_snippets)
