"###########################################
"#         sprig's minimal vimrc           #
"###########################################

"===================================
" 表示設定
"===================================
set termguicolors " gui colorsを使用
set title
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum" "for tmux 256 color
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
lang en_US.UTF-8

colorscheme iceberg
augroup TweakColors " カラースキーム変更
  autocmd!
  autocmd ColorScheme * highlight Visual ctermbg=216 ctermfg=234
  autocmd ColorScheme * highlight Normal ctermbg=none guibg=none
  autocmd ColorScheme * highlight NonText ctermbg=none guibg=none
  autocmd ColorScheme * highlight LineNr ctermbg=none guibg=none
  autocmd ColorScheme * highlight Folded ctermbg=none guibg=none
  autocmd ColorScheme * highlight EndOfBuffer ctermbg=none
  autocmd ColorScheme * highlight CursorWord guibg=#610f23 guifg=none ctermbg=52 ctermfg=none
  autocmd ColorScheme * highlight Cursor guibg=#8a1330 guifg=none ctermbg=52 ctermfg=none
augroup END

if has('vim_starting')
  " 挿入モードで非点滅縦棒
  let &t_SI .= "\e[6 q"
  " ノーマルモードで非点滅ブロック
  let &t_EI .= "\e[2 q"
  " 置換モードで非点滅下線
  let &t_SR .= "\e[4 q"
endif

set showmatch "括弧入力時の対応する括弧を表示
set number "行番号表示
syntax enable "コードの色分け
set expandtab
set tabstop=2 "インデントをスペース4つ分に設定
set shiftwidth=2
set smartindent "オートインデント
set cursorline " カーソルラインをハイライト
set conceallevel=0 " jsonの引用符表示
let g:vim_json_syntax_conceal = 0

autocmd FileType qf setlocal wrap

" 不可視文字の表示
hi NonText    ctermbg=None ctermfg=59 guibg=NONE guifg=None
hi SpecialKey ctermbg=None ctermfg=59 guibg=NONE guifg=None
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%

"===================================
" key mapping
"===================================
let mapleader = "\<Space>"
map q <ESC>
nnoremap Q <Nop>
nnoremap + <C-a>
nnoremap - <C-x>
nnoremap <C-a> 0
nnoremap <C-e> $
nnoremap <silent> <S-j> :split<CR>
nnoremap <silent> <S-l> :vsplit<CR>
nnoremap <silent> <C-u> :bprev<CR>
nnoremap <silent> <C-i> :bnext<CR>
nnoremap <silent> <C-n> :call comfortable_motion#flick(250)<CR>
nnoremap <silent> <C-p> :call comfortable_motion#flick(-250)<CR>
nnoremap <silent> U :redo<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap j gj
nnoremap k gk
nnoremap gr gT
nnoremap <silent> p p`]
" x,sでレジスタを汚さない
nnoremap x "_x
nnoremap s "_s
" 行を移動
nnoremap <C-Up> "zdd<Up>"zP
nnoremap <C-Down> "zdd"zp

" カーソル下の単語をハイライト
nnoremap <silent> <Space><Space> :let @/ = '\<' . expand('<cword>') . '\>'<CR>:set hlsearch<CR>
nnoremap <Leader>s :<C-u>w<CR>
nnoremap Y y$

nnoremap <Leader>ga :Git add %:p<CR><CR>
nnoremap <Leader>gc :Git commit<CR><CR>
nnoremap <Leader>gl :Gclog<CR>
nnoremap <Leader>gb :Git blame<CR>

nmap n nzz
nmap N Nzz
nmap * *zz
" #でカーソル下の単語をハイライトしてから置換
nmap # <Space><Space>:%s/<C-r>///gc<Left><Left><Left>

inoremap <silent> jk <ESC>
inoremap <silent> Jk <ESC>
inoremap <silent> JK <ESC>
inoremap <silent> jj <ESC><Right>
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-e> <End>
inoremap <C-a> <home>

vnoremap j gj
vnoremap k gk
vnoremap q <Esc>
vnoremap <silent> y y`]
vnoremap <silent> p p`]
vnoremap < <gv
vnoremap > >gv
" 複数行を移動
vnoremap <C-Up> "zx<Up>"zP`[V`]
vnoremap <C-Down> "zx"zp`[V`]


"===================================
" search
"===================================
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る
set incsearch " インクリメンタルサーチ. １文字入力毎に検索を行う
set hlsearch " 検索結果をハイライト
" C-lでハイライトを消す
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>


"===================================
" by the file-type
"===================================
augroup vimrc
  autocmd!
  autocmd Filetype * call s:filetype(expand('<amatch>'))
augroup END

function! s:filetype(ftype) abort
  if !empty(a:ftype) && exists('*' . 's:filetype_' . a:ftype)
    execute 'call s:filetype_' . a:ftype . '()'
  endif
endfunction


"===================================
" misc
"===================================
set wildmenu " コマンドモードの補完
set clipboard+=unnamed " クリップボード
set noswapfile " swapを作らない
set mouse=a " マウスを使用
set cmdheight=1 "コマンドウィンドウの高さ
set backup
# set backupdir=~/vimbackup

" completment
set completeopt=menuone,noinsert

" カーソル位置記憶
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif
