return {
  "ibhagwan/fzf-lua",
  dependencies = {
    { "junegunn/fzf", build = "./install --bin" },
  },
  event = "VimEnter",
  keys = {
    { "<leader>v", "<cmd>FzfLua files cwd=$XDG_CONFIG_HOME/nvim<cr>" },
    { ",f",        "<cmd>FzfLua files<cr>" },
    { ",r",        "<cmd>FzfLua oldfiles<cr>" },
    { ",g",        "<cmd>FzfLua live_grep<cr>" },
    { ",G",        "<cmd>FzfLua lgrep_curbuf<cr>" },
    { ",b",        "<cmd>FzfLua buffers<cr>" },
  },
  config = function()
    local actions = require("fzf-lua").actions
    require("fzf-lua").setup({
      actions = {
        files = {
          ["default"] = actions.file_edit,
          ["ctrl-s"] = actions.file_split,
          ["ctrl-v"] = actions.file_vsplit,
          ["ctrl-t"] = actions.file_tabedit,
          ["ctrl-q"] = actions.file_sel_to_qf,
          ["ctrl-l"] = actions.file_sel_to_ll,
        },
      },
    })
  end,
}
