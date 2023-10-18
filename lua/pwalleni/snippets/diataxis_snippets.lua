-- diataxis_snippets.lua
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text

ls.snippets.all = {
	s("tutorial", {
		t("# Tutorial: "),
		t("\n## Introduction\n"),
		t("\n## Prerequisites\n"),
		t("\n## Steps\n"),
		t("\n1. "),
		t("\n2. "),
		t("\n## Conclusion\n"),
	}),
	s("howto", {
		t("# How-to Guide: "),
		t("\n## Requirements\n"),
		t("\n## Step-by-Step Guide\n"),
		t("\n1. "),
		t("\n2. "),
		t("\n## Additional Tips\n"),
	}),
	s("explanation", {
		t("# Explanation: "),
		t("\n## Background\n"),
		t("\n## Main Concepts\n"),
		t("\n1. "),
		t("\n2. "),
		t("\n## Summary\n"),
	}),
	s("reference", {
		t("# Reference: "),
		t("\n## Functions\n"),
		t("\n### Function 1\n"),
		t("\n- **Parameters:** "),
		t("\n- **Returns:** "),
		t("\n## Constants\n"),
	}),
}
