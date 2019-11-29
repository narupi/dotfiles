if &compatible

endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

    call dein#add($HOME.'/.cache/dein/repos/github.com/Shougo/dein.vim')
    call dein#add('~/.cache/dein')
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('itchyny/lightline.vim')    
    call dein#add('kana/vim-filetype-haskell')
    call dein#add('thinca/vim-quickrun')
    call dein#add('fatih/vim-go')
    call dein#add('Shougo/unite.vim')
    call dein#add('Shougo/neomru.vim')
    call dein#add('scrooloose/nerdtree')
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('tomasr/molokai')
    call dein#add('scrooloose/nerdtree')
    call dein#add('leafgarland/typescript-vim')
    call dein#add('udalov/kotlin-vim')
    call dein#add('prabirshrestha/async.vim')
    call dein#add('prabirshrestha/vim-lsp')
    call dein#add('prabirshrestha/asyncomplete.vim')
    call dein#add('prabirshrestha/asyncomplete-lsp.vim')
    call dein#add('natebosch/vim-lsc')

    if !has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
    endif

    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

let g:deoplete#enable_at_startup = 1

set t_ut=

set splitbelow "新しいウィンドウを下に開く
set splitright "新しいウィンドウを右に開く

" defaut nerd tree up
" autocmd VimEnter * execute 'NERDTree'

"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden

set showcmd


" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
"set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk

"Escをjjにバインド"
inoremap <silent> jj <ESC>
"Ctl+a Ctl+e" キー操作補助
noremap!  <C-A>       <Home>
noremap!  <C-E>       <End>
noremap!  <C-L>       <DEL>

noremap   <C-A>       <Home>
noremap   <C-E>       <End>

" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4
" 行頭でのTab文字の表示幅
set shiftwidth=4
"TAB
"set expandtab
set softtabstop=4
set autoindent
set smartindent

"SCREEN
set title
set number
set cursorline
set showmatch
set ambiwidth=double

" vim-lsp
let g:lsp_diagnostics_enabled = 1
"debug
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/vim-lsp.log')
let g:asyncomplete_log_file = expand('~/asyncomplete.log')

" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

colorscheme molokai

" ヤンクでクリップボードにコピー
set clipboard=unnamed,autoselect

set display=lastline
set pumheight=10

set backspace=indent,eol,start
" ---- key-mappings for deoplete ----
"   Ctrl+k : Jump target
"   Tab    : Select snippet AND Jump target
"   Ctrl+n : Move cursol
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)"
        \: pumvisible() ? "\<C-n>" : "\<TAB>"
        smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
                \: "\<TAB>"

" python lsp
if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

"java lsp 
if executable('java') && filereadable(expand('~/lsp/eclipse.jdt.ls/plugins/org.eclipse.equinox.launcher_1.5.300.v20190213-1655.jar'))
    au User lsp_setup call lsp#register_server({
                \ 'name': 'eclipse.jdt.ls',
                \ 'cmd': {server_info->[
                \     'java',
                \     '-Declipse.application=org.eclipse.jdt.ls.core.id1',
                \     '-Dosgi.bundles.defaultStartLevel=4',
                \     '-Declipse.product=org.eclipse.jdt.ls.core.product',
                \     '-Dlog.level=ALL',
                \     '-noverify',
                \     '-Dfile.encoding=UTF-8',
                \     '-Xmx1G',
                \     '-jar',
                \     expand('~/lsp/eclipse.jdt.ls/plugins/org.eclipse.equinox.launcher_1.5.300.v20190213-1655.jar'),
                \     '-configuration',
                \     expand('~/lsp/eclipse.jdt.ls/config_win'),
                \     '-data',
                \     getcwd()
                \ ]},
                \ 'whitelist': ['java'],
                \ })
endif

"Rust lsp
if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
        \ 'whitelist': ['rust'],
        \ })
endif
