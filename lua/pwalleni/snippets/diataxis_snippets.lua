local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

local diataxis_snippets = {
	s("diataxis-tutorial", {
		t({
			"# Tutorial: Your Tutorial Title Here",
			"",
			"## Introduction",
			"",
			"## Prerequisites",
			"",
			"## Steps",
			"",
			"1. Your step here",
			"2. Your step here",
			"",
			"## Conclusion",
			"",
		}),
	}),
	s("diataxis-howto", {
		t({
			"# How-To Guide: Your How-To Title Here",
			"",
			"## Introduction",
			"",
			"## Steps",
			"",
			"1. Your step here",
			"1. Your step here",
			"",
			"## Additional Resources",
			"",
		}),
	}),
	s("diataxis-explanation", {
		t({
			"# Explanation: Your Explanation Title Here",
			"",
			"## Background",
			"",
			"## Key Concepts",
			"",
			"1. Key concept 1",
			"1. Key concept 2",
			"",
			"## Summary",
			"",
		}),
	}),
	s("diataxis-reference", {
		t({
			"# Reference: Your Reference Title Here",
			"",
			"## Functions",
			"",
			"### Function 1",
			"",
			"- **Parameters:**",
			"- **Returns:**",
			"",
			"## Constants",
			"",
		}),
	}),
}

ls.add_snippets("markdown", diataxis_snippets)
