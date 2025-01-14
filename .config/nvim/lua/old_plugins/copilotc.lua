return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim" },
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
        mappings = {
            submit_prompt = {
                normal = '<Leader>s'
            },
        window = {
            layout = 'float', -- 'vertical', 'horizontal', 'float', 'replace'
            relative = 'win', -- 'editor', 'win', 'cursor', 'mouse'
            border = 'single', -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
            title = 'Chat' -- title of chat window
            },
        }
    },
    --config = function()
    --    require("CopilotChat").setup()
    --    vim.keymap.set({
    --        { 'n', '<Leader>co', '<Cmd>lua require("CopilotChat").open_chat()<CR>' },
    --        { 'n', '<Leader>cc', '<Cmd>lua require("CopilotChat").close_chat()<CR>' },
    --        { 'n', '<Leader>cs', '<Cmd>lua require("CopilotChat").submit_prompt()<CR>' },
    --        { 'n', '<Leader>ct', '<Cmd>lua require("CopilotChat").toggle_chat()<CR>' },
    --    })
    --end,
  },
}

