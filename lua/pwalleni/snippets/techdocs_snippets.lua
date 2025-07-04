local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local techdocs_snippets = {
	-- TechDocs frontmatter
	s("techdocs-frontmatter", {
		t({
			"---",
			"title: ",
		}),
		i(1, "Page Title"),
		t({
			"",
			"description: ",
		}),
		i(2, "Page description"),
		t({
			"",
			"---",
			"",
			"# ",
		}),
		i(3, "Page Title"),
		t({
			"",
			"",
		}),
	}),

	-- Code block with title
	s("code-block", {
		t({
			"```",
		}),
		i(1, "language"),
		t({
			" title=\"",
		}),
		i(2, "filename"),
		t({
			"\"",
			"",
		}),
		i(3, "code content"),
		t({
			"",
			"```",
			"",
		}),
	}),

	-- Mermaid diagram
	s("mermaid-diagram", {
		t({
			"```mermaid",
			"graph TD",
			"    A[",
		}),
		i(1, "Start"),
		t({
			"] --> B[",
		}),
		i(2, "Process"),
		t({
			"]",
			"    B --> C[",
		}),
		i(3, "End"),
		t({
			"]",
			"```",
			"",
		}),
	}),

	-- Link reference
	s("link-ref", {
		t({
			"[",
		}),
		i(1, "link text"),
		t({
			"]: ",
		}),
		i(2, "URL"),
		t({
			" \"",
		}),
		i(3, "title"),
		t({
			"\"",
			"",
		}),
	}),

	-- MkDocs include snippets
	s("mkdocs-include", {
		t({
			":::related-docs:::",
			"",
			"---",
			"",
			'--8<-- "',
		}),
		i(1, "snippets/contributing.md"),
		t({
			'"',
			"",
			'--8<-- "',
		}),
		i(2, "snippets/sme/developer-plane.md"),
		t({
			'"',
			"",
		}),
	}),

	-- Single MkDocs include
	s("mkdocs-include-single", {
		t({
			'--8<-- "',
		}),
		i(1, "path/to/file.md"),
		t({
			'"',
			"",
		}),
	}),
}

ls.add_snippets("markdown", techdocs_snippets)
