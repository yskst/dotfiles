syntax on
filetype on
filetype plugin on
filetype indent on
set backup

noremap  
noremap!  
noremap <BS> 
noremap! <BS> 
noremap <C-j> <Esc>
noremap! <C-j> <Esc>

set noswapfile
set backspace=indent,eol,start
set ruler
set showcmd
set showmode
set list      " show invisibility character
set listchars=tab:>^,extends:»,precedes:«
set laststatus=2

set tabstop=4 
set shiftwidth=4
set expandtab   " insert space when tab key pushed.
set smartindent " insert indent when move to new line.
set showmatch
set number      " show line number.
set cursorline  " highlight the screen line of the cursor.
set title       " set terminal's title.

set wildmenu    " use complecation of command line.
set history=500 " number of commandlines to recommend.

set incsearch   " inclemental search
set hlsearch    " highlight search result.
set ignorecase  " ignore case in search patterns.
set smartcase   " If including big letter, disable ignore case.

set hidden      " don't unload buffer when it is abandoned

set fileencodings=utf-8,euc-jp,cp932,iso-2022-jp,default

set t_Co=256 " 256 color
syntax enable

"python's option
filetype plugin on
autocmd FileType python setl autoindent
autocmd FileType python setl expandtab tabstop=4 shiftwidth=4 softtabstop=4

"configuration of highlight
hi Comment ctermfg=lightblue


"configuration for neobundle
"Note: Skip initialization for vim-tiny or vim-small.
 if 0 | endif

 if &compatible
   set nocompatible               " Be iMproved
 endif

 " Required:
 set runtimepath^=~/.vim/bundle/neobundle.vim/

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!
 NeoBundle 'Shougo/neocomplcache' 

 " Color scheme plugin.
 NeoBundle 'tomasr/molokai'

" status line plugin.
NeoBundle 'itchyny/lightline.vim'

" show git diff
NeoBundle 'airblade/vim-gitgutter'

" git command
NeoBundle 'tpope/vim-fugitive'

 call neobundle#end()

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck



"Configuration for neocomplecache
"Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"-------------------------------------------------------------------------------------
" Setting for molokai
if neobundle#is_installed('molokai') " 
    colorscheme molokai
endif


"-------------------------------------------------------------------------------------
" setting for lightline
let g:lightline = {
      \ "colorscheme": "Dracula",
      \ "active": {
      \   "left": [ ['mode', 'paste'],
      \             ['readonly', 'filename', 'modified', 'gitbranch'] ]
      \ },
      \ 'component_function' : {
      \      'gitbranch': 'fugitive#head'
      \ }
      \ }
