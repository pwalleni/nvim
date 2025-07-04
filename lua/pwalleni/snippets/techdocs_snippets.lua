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

	-- API documentation template
	s("api-endpoint", {
		t({
			"## ",
		}),
		i(1, "Endpoint Name"),
		t({
			"",
			"",
			"**Method:** `",
		}),
		i(2, "GET"),
		t({
			"`",
			"",
			"**URL:** `",
		}),
		i(3, "/api/v1/endpoint"),
		t({
			"`",
			"",
			"",
			"### Description",
			"",
		}),
		i(4, "Endpoint description"),
		t({
			"",
			"",
			"### Parameters",
			"",
			"| Name | Type | Required | Description |",
			"|------|------|----------|-------------|",
			"| ",
		}),
		i(5, "param"),
		t({
			" | ",
		}),
		i(6, "string"),
		t({
			" | ",
		}),
		i(7, "Yes"),
		t({
			" | ",
		}),
		i(8, "Parameter description"),
		t({
			" |",
			"",
			"",
			"### Response",
			"",
			"```json",
			"{",
			'  "status": "success",',
			'  "data": {}',
			"}",
			"```",
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

	-- Service documentation template
	s("service-doc", {
		t({
			"# ",
		}),
		i(1, "Service Name"),
		t({
			"",
			"",
			"## Overview",
			"",
		}),
		i(2, "Service overview and purpose"),
		t({
			"",
			"",
			"## Architecture",
			"",
			"## Configuration",
			"",
			"## API Reference",
			"",
			"## Deployment",
			"",
			"## Troubleshooting",
			"",
			"### Common Issues",
			"",
			"### Logs",
			"",
			"### Monitoring",
			"",
		}),
	}),

	-- Troubleshooting section
	s("troubleshooting", {
		t({
			"## Troubleshooting",
			"",
			"### ",
		}),
		i(1, "Issue Title"),
		t({
			"",
			"",
			"**Problem:** ",
		}),
		i(2, "Description of the problem"),
		t({
			"",
			"",
			"**Solution:**",
			"",
			"1. ",
		}),
		i(3, "First step"),
		t({
			"",
			"2. ",
		}),
		i(4, "Second step"),
		t({
			"",
			"",
			"**Prevention:** ",
		}),
		i(5, "How to prevent this issue"),
		t({
			"",
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
