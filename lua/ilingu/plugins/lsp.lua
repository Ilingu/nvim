local lsp = require("lsp-zero")
local keymap = vim.keymap

lsp.preset("recommended")

lsp.ensure_installed({
	"tsserver",
	"eslint",
	"sumneko_lua",
	"rust_analyzer",
	"emmet_ls",
	"tailwindcss",
	"html",
})

-- Fix Undefined global 'vim'
lsp.configure("sumneko_lua", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	if client.name == "eslint" then
		vim.cmd.LspStop("eslint")
		return
	end

	keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- go to definition
	keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration
	keymap.set("n", "gr", vim.lsp.buf.references, opts) -- go to references
	keymap.set("n", "gi", vim.lsp.buf.implementation, opts) -- go to implementation
	keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
	keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions
	keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename
	keymap.set("n", "<leader>D", vim.diagnostic.open_float, opts) -- show  diagnostics for line
	keymap.set("n", "[d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
	keymap.set("n", "]d", vim.diagnostic.goto_prev, opts) -- jump to prev diagnostic in buffer
	-- keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)

	-- typescript specific keymaps (e.g. rename file and update imports)
	if client.name == "tsserver" then
		keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
		keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>")
		keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>")
	end
end)

lsp.setup()
