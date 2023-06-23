return {
  {
    -- colorscheme creation aid
    "rktjmp/lush.nvim"
  },
  {
    "EdenEast/nightfox.nvim",
    enabled = true,
    config = function()
      local palettes = {
        duskfox = {
          bg1 = "#040C1C",
        },
      }
      require("nightfox").setup({
        palettes = palettes,
      })
      vim.cmd("colorscheme nordfox")
    end
  },
  {
    "lunarxlark/futurefunk.nvim",
    dev = true,
    enabled = false,
    config = function()
      vim.cmd([[colorscheme futurefunk]])
    end,
  },
}
