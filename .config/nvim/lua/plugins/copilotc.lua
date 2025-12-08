return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      "github/copilot.vim",
      "nvim-lua/plenary.nvim",
    },
    build = "make tiktoken",

    opts = {
      mappings = {
        submit_prompt = {
          normal = "<Leader>s",
        },
      },
      window = {
        layout = "float",    -- 'vertical', 'horizontal', 'float', 'replace'
        relative = "win",    -- 'editor', 'win', 'cursor', 'mouse'
        border = "single",   -- 'none', 'single', 'double', 'rounded', 'solid', 'shadow'
        title = "Chat",
      },
    },

    keys = {
      { "<Leader>co", function() require("CopilotChat").open_chat() end,   desc = "CopilotChat: Open" },
      { "<Leader>cc", function() require("CopilotChat").close_chat() end,  desc = "CopilotChat: Close" },
      { "<Leader>cs", function() require("CopilotChat").submit_prompt() end, desc = "CopilotChat: Submit" },
      { "<Leader>ct", function() require("CopilotChat").toggle_chat() end, desc = "CopilotChat: Toggle" },
    },

    config = function(_, opts)
      require("CopilotChat").setup(opts)
    end,
  },
}

