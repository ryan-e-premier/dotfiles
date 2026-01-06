return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  -- enabled = false,
  -- version = "v0.0.23",
  version = "*", -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
  -- new version
  opts = {
    shortcuts = {
      {
        name = "refactor",
        description = "Refactor code with best practices",
        details = "Automatically refactor code to improve readability, maintainability, and follow best practices while preserving functionality. Do not include extaneous comments",
        prompt = "Please refactor this code following best practices, improving readability and maintainability while preserving functionality.",
      },
      {
        name = "eslint",
        description = "run eslint",
        details = "run eslint and fix errors",
        prompt = [[
run lint:file outlined in AGENTS.md and package.json for this file and fix any errors.
clean up the code by removing unused imports, variables, functions and unnecesary comments
update AGENTS.md with a linting section it it does not exist to prevent generating code with these errors in the future.
show me the raw succesful eslint output when done to prove that you are succesful
]],
      },
      {
        name = "fixTests",
        description = "Fix unit tests",
        details = "Run the unit tests for this file and fix them",
        prompt = [[
        Check if this file has an associated test file. If it does, run the tests and fix any failing tests.
Do not include extaneous comments.
check for existing test helpers 
run lint:file on the file and fix any errors
If you run tests run them like this: FILE=src/{PATH_TO_FILE}.tsx TESTFILE=src/{PATH_TO_TEST_FILE}.test.tsx pnpm test:single
check AGENTS.md for detailed information
show me the EXACT unit test output and coverage summary from the test run command after you are done. PLEASE SHOW THIS TO ME IF YOU DO NOT YOU ARE FIRED
]],
      },
      {
        name = "test",
        description = "Generate unit tests",
        details = "Create comprehensive unit tests covering edge cases, error scenarios, and various input conditions",
        prompt = [[
Please generate comprehensive unit tests for this code,
covering edge cases and error scenarios.
Do not include extaneous comments.
check for existing test helpers 
run lint:file on the file and fix any errors
If you run tests run them like this: FILE=src/{PATH_TO_FILE}.tsx TESTFILE=src/{PATH_TO_TEST_FILE}.test.tsx pnpm test:single
check AGENTS.md for detailed information
show me the EXACT unit test output and coverage summary from the test run command after you are done. PLEASE SHOW THIS TO ME IF YOU DO NOT YOU ARE FIRED
]],
      },
    },
    -- auto_suggestions_provider = "copilot",
    provider = "copilot",
    providers = {
      copilot = {
        model = "gpt-4.1", -- your desired model (or use gpt-4o, etc.)
        -- model = "gpt-5", -- your desired model (or use gpt-4o, etc.)
      },
    },
    features = {
      web_search = false,
      project_context = true,
      file_search = true,
    },
    {
      input = {
        provider = "snacks",
        provider_opts = {
          -- Additional snacks.input options
          title = "Avante Input",
          icon = " ",
        },
      },
    },
    behaviour = {
      cursor_planning_mode = false, -- enable cursor planning mode
      auto_suggestions = false,
      jump_result_buffer_on_finish = true,
      auto_focus_on_diff_view = true,
      enable_token_counting = true,
    },
    windows = {
      position = "right",
      width = 35,
    },
    mappings = {
      sidebar = {
        close_from_input = { normal = "q", insert = "<C-d>" },
      },
    },
  },
  -- opts = {
  --   behaviour = {
  --     enable_cursor_planning_mode = true,
  --   },
  --   provider = "copilot",
  --   copilot = {
  --     model = "gpt-4.1",
  --     -- extra_request_body = {
  --     -- timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
  --     -- temperature = 0.75,
  --     --   max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
  --     --   --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
  --     -- },
  --   },
  -- },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  -- build = "make BUILD_FROM_SOURCE=true",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  build = "make",
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- for syntax highlighting
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    -- "echasnovski/mini.pick", -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua", -- for file_selector provider fzf
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    "folke/snacks.nvim", -- for input provider snacks
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
