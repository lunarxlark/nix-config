return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-nvim-lsp-document-symbol",
    "saadparwaiz1/cmp_luasnip",
    {
      "zbirenbaum/copilot-cmp",
      dependencies = {
        "zbirenbaum/copilot.lua",
      },
      config = function()
        require("copilot").setup({
          suggestion = { enabled = false },
          panel = { enabled = false },
          filetypes = { gitcommit = true, markdown = true },
        })
        require("copilot_cmp").setup()
      end,
    },
  },
  event = "InsertEnter",
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      formatting = {
        format = function(entry, vim_item)
          vim_item.menu = ({
            copilot = "[Copilot]",
            nvim_lsp = "[LSP]",
            luasnip = "[Lsnip]",
            buffer = "[Buf]",
            path = "[Path]",
          })[entry.source.name]
          vim_item.abbr = string.sub(vim_item.abbr, 1, 50)
          return vim_item
        end,
      },
      mapping = {
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      },
      sources = {
        { name = "copilot" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      },
    })
  end,
}
