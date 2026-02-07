vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Moves line down in visual selections." })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Moves line up in visual selections." })

vim.keymap.set("n", "n", "nzzzv", { desc = "Keep cursor centered when moving to the next search item." })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Keep cursor centered when moving to the previous search item." })

vim.keymap.set("v", "<", "<gv", { desc = "Stay in visual mode while indenting ro the right." })
vim.keymap.set("v", ">", ">gv", { desc = "Stay in visual mode while indenting ro the left." })

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without replacing clipboard content." })

vim.keymap.set("n", "<Esc>", ":noh<CR>", { desc = "Removes search highlighting when in normal mode." })

vim.keymap.set("n", "x", [["_x]], { desc = "Prevents deleted characters from copying to clipboard." })

vim.keymap.set("n", "<leader>er", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Replace word that is on the cursor everywhere within the file." })

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
      vim.hl.on_yank()
  end,
})

vim.keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically." })
vim.keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Split window horizontally." })
vim.keymap.set("n", "<leader>w=", "<C-w>=", { desc = "Make splits equal size." })
vim.keymap.set("n", "<leader>wx", "<C-w>x", { desc = "Close current split window." })

vim.keymap.set("n", "<leader>fp", function()
  local filePath = vim.fn.expand("%:~") -- Gets the file path relative to the home directory
  vim.fn.setreg("+", filePath) -- Copy the file path to the clipboard register
  print("File path copied to clipboard: " .. filePath)
end, { desc = "Copy file path to clipboard" })
