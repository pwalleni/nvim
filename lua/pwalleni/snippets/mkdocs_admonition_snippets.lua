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
	s("admonition-danger", {
		t({
			'!!! danger "Danger"',
			"",
			"    Danger content goes here.",
			"",
		}),
	}),
	s("admonition-success", {
		t({
			'!!! success "Success"',
			"",
			"    Success content goes here.",
			"",
		}),
	}),
	s("admonition-question", {
		t({
			'!!! question "Question"',
			"",
			"    Question content goes here.",
			"",
		}),
	}),
	s("admonition-example", {
		t({
			'!!! example "Example"',
			"",
			"    Example content goes here.",
			"",
		}),
	}),
	s("admonition-quote", {
		t({
			'!!! quote "Quote"',
			"",
			"    Quote content goes here.",
			"",
		}),
	}),
}

ls.add_snippets("markdown", mkdocs_admonition_snippets)
