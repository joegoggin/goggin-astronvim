-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  i = {
    -- Clipboard
    ["<C-v>"] = { "p", desc = "Paste" },
  },
  n = {
    -- Change
    ["cc"] = { '"_cc', desc = "Change line" },
    ["cw"] = { '"_cw', desc = "Change word" },
    ["ci{"] = { '"_ci{', desc = "Change inside {}" },
    ["ci["] = { '"_ci[', desc = "Change inside []" },
    ["ci<"] = { '"_ci<', desc = "Change inside <>" },
    -- Delete
    ["dd"] = { '"_dd', desc = "Delete line" },
    ["dw"] = { '"_dw', desc = "Delete word" },
    ["x"] = { '"_x', desc = "Delete character" },
    -- Clipboard
    ["<C-c>"] = { "yy", desc = "Copy" },
    ["<C-v>"] = { "p", desc = "Paste" },
    -- Move code
    ["<M-j>"] = { "<cmd>m +1<cr>", desc = "Move code down one line" },
    ["<M-k>"] = { "<cmd>m -2<cr>", desc = "Move code up on line" },
    -- Buffers
    ["L"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next Buffer",
    },
    ["H"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous Buffer",
    },
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  v = {
    -- Change
    ["c"] = { '"_c', desc = "Change Selection" },
    -- Delete
    ["d"] = { '"_d', desc = "Delete Selection" },
    -- Clipboard
    ["<C-c>"] = { "y", desc = "Copy Selection" },
    ["<C-v>"] = { "p", desc = "Paste Selection" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
