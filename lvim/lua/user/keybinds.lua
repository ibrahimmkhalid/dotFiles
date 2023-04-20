local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- redo
keymap("n", "<S-u>", ":redo<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- fast scrolling
keymap("n", "<S-j>", "5j", opts)
keymap("n", "<S-k>", "5k", opts)

-- saving files and exiting nvim
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>q", ":q<CR>", opts)
keymap("n", "<leader>Q", ":qa<CR>", opts)


keymap("n", "<leader>v", ":vsplit<CR>", opts)
keymap("n", "<leader>V", ":split<CR>", opts)

keymap("n", "<leader>h", ":nohlsearch<CR>", opts)
keymap("n", "<", "<<", opts)
keymap("n", ">", ">>", opts)

-- WSL workaround for visual block mode
keymap("n", "<M-v>", "<C-v>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "J", "5j", opts)
keymap("v", "K", "5k", opts)
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", "5j", opts)
keymap("x", "K", "5k", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Plugins related --
--

keymap("n", "<leader>e", ":NeoTreeFocusToggle<cr>", opts)

keymap("n", "<leader>f", ":Telescope find_files<cr>", opts)
keymap("n", "<leader>F", ":Telescope live_grep<cr>", opts)

keymap('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
keymap('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
keymap('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
keymap('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
keymap('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
keymap('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
keymap('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
keymap('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
keymap('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
keymap('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

keymap("n", "<S-l>", "<Cmd>BufferNext<CR>", opts)
keymap("n", "<S-h>", "<Cmd>BufferPrevious<CR>", opts)

keymap('n', '<leader>c', '<Cmd>BufferClose<CR>', opts)
keymap('n', '<leader>bL', '<Cmd>BufferCloseBuffersRight<CR>', opts)
keymap('n', '<leader>bH', '<Cmd>BufferCloseBuffersLeft<CR>', opts)
keymap('n', '<leader>bc', '<Cmd>BufferCloseAllButCurrent<CR>', opts)
keymap('n', '<leader>bl', '<Cmd>BufferMoveNext<CR>', opts)
keymap('n', '<leader>bh', '<Cmd>BufferMovePrevious<CR>', opts)
keymap('n', '<leader>bb', '<Cmd>BufferMove<CR>', opts)


local Terminal = require('toggleterm.terminal').Terminal
local _term_commands = {
  H = "htop",
  n = "node",
  p = "python",
  g = "lazygit",
}

M_terms = {}

for k, v in pairs(_term_commands) do
  M_terms[v] = Terminal:new({cmd = v, hidden = true, direction = "float"})
  keymap("n", "<leader>t" .. k, "<cmd>lua M_terms."..v..":toggle()<cr>", opts)
end
keymap("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", opts)
keymap("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal size=20<cr>", opts)
keymap("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical size=100<cr>", opts)

keymap("t", "<Esc>", "<C-\\><C-n>", opts)
keymap("t", "<C-h>", "<c-\\><c-n><c-w>h", opts)
keymap("t", "<C-j>", "<c-\\><c-n><c-w>j", opts)
keymap("t", "<C-k>", "<c-\\><c-n><c-w>k", opts)
keymap("t", "<C-l>", "<c-\\><c-n><c-w>l", opts)

keymap("n", "<leader><Tab>", ":ReachOpen buffers<cr>", opts)
keymap("n", "<leader>m", ":ReachOpen marks<cr>", opts)


keymap('n', '<leader>gh', '<Cmd>Gitsigns reset_hunk<CR>', opts)
keymap('n', '<leader>gb', '<Cmd>Gitsigns reset_buffer<CR>', opts)
keymap('n', '<leader>gH', '<Cmd>Gitsigns stage_hunk<CR>', opts)
keymap('n', '<leader>gB', '<Cmd>Gitsigns stage_buffer<CR>', opts)
keymap('n', '<leader>gp', '<Cmd>Gitsigns preview_hunk<CR>', opts)
keymap('n', '<leader>gk', '<Cmd>Gitsigns prev_hunk<CR>', opts)
keymap('n', '<leader>gj', '<Cmd>Gitsigns next_hunk<CR>', opts)
keymap('n', '<leader>gl', '<Cmd>Gitsigns blame_line<CR>', opts)

