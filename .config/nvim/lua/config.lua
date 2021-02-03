local g = vim.g

vim.cmd('set showtabline=0')
vim.cmd('set number')
vim.cmd('set hidden')
vim.cmd('set tabstop=2 softtabstop=2')
vim.cmd('set shiftwidth=2')
vim.cmd('set expandtab')
vim.cmd('set smartindent')
vim.cmd('set ignorecase')
vim.cmd('set smartcase')
vim.cmd('set noswapfile')
vim.cmd('set nobackup')
vim.cmd('set undodir=~/.vim/undodir')
vim.cmd('set undofile')
vim.cmd('set incsearch')
vim.cmd('set scrolloff=8')
vim.cmd('set noshowmode')
vim.cmd('set completeopt=menuone,noinsert,noselect')
vim.cmd('set cmdheight=1')
vim.cmd('set updatetime=250')
vim.cmd('set shortmess+=cI')
vim.cmd('set colorcolumn=0')
vim.cmd('set termguicolors')
vim.cmd('set list')
vim.cmd('set listchars=tab:>-,eol:¬,extends:»,precedes:«')
vim.cmd('set dir=~/.vim/swap//')
vim.cmd('set showmatch')
vim.cmd('set cursorline')
vim.cmd('set lazyredraw')
vim.cmd('set redrawtime=10000')
vim.cmd('set splitbelow')
vim.cmd('set splitright')
vim.cmd('set nowritebackup')
-- vim.cmd('set grepprg=rg --vimgrep --no-heading --smart-case --hidden')
vim.cmd('set shell=/bin/zsh')
vim.cmd('set nowrap')
vim.cmd('set foldmethod=manual')
vim.cmd('set foldnestmax=10')
vim.cmd('set foldlevel=2')
vim.cmd('set inccommand=split')
vim.cmd('set signcolumn=yes')
vim.cmd('set wildignorecase')
vim.cmd('set rtp+=/usr/local/opt/fzf')
vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')
vim.cmd('set encoding=UTF-8')
vim.cmd("set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow")
vim.cmd("set colorcolumn=100")

vim.cmd('colorscheme my-theme')

vim.cmd('let $TERM = "alacritty"')
vim.cmd('let $GIT_EDITOR = "nvr -cc split --remote-wait"')

vim.cmd("highlight default link EndOfLineSpace diffRemoved")
vim.cmd("match EndOfLineSpace / \\+$/")

g.mapleader = " "

g["sneak#use_ic_scs"] = 1
g["sneak#target_labels"] = "asdfjkl;ghqweruioptyzxcvnmb"


-- fix for slow movement in large php files
g.php_syntax_extensions_enabled = {}
g.php_var_selector_is_identifier = 1
g.php_sql_query = 0
g.php_sql_heredoc = 0
g.php_sql_nowdoc = 0
g.php_html_load = 0
g.php_html_in_heredoc = 0
g.php_html_in_nowdoc = 0

