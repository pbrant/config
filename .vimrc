if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(expand('~/.vim/dein'))
  call dein#begin(expand('~/.vim/dein'))

  call dein#add(expand('~/.vim/dein/repos/github.com/Shougo/dein.vim'))
  call dein#add('vim-syntastic/syntastic')
  call dein#add('raichoo/purescript-vim')
  call dein#add('frigoeu/psc-ide-vim')
  call dein#add('kien/ctrlp.vim')
  call dein#add('joonty/vim-sauce')

  call dein#end()
  call dein#save_state()
endif

set modeline
set incsearch
set expandtab
set sr
set hlsearch
set sm
set clipboard+=unnamed
set autowrite
set lcs=tab:%-,eol:$,trail:~,extends:>,precedes:<
set hidden
set wildmenu
set wildmode=longest:full,full

set guioptions-=m
set guioptions-=T

" set ballooneval

syntax on

filetype indent on
filetype plugin on

set novisualbell
set noerrorbells
" set laststatus=2

au BufRead,BufNewFile *.rb,*.erb set tags=~/.vim/jruby_tags,tags
au BufRead,BufNewFile *.rb,*.erb,*.html,*.css,*.json,*.js,*.scss,*.xsl,*.hs,*.purs,*.tex set ts=2 sw=2 sts=2 expandtab
au BufRead,BufNewFile *.java set ts=4 sw=4 sts=4 expandtab

set dictionary+=/etc/dictionaries-common/words

imap <C-Space> <C-X><C-O>

nnoremap <Leader>b :CtrlPBuffer<CR>

nnoremap <Leader>d :bp<bar>sp<bar>bn<bar>bd<CR>

set title
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)\ (%{pathshorten(getcwd())})

" nnoremap <C-k> :execute "vimgrep /\\<" . expand("<cword>") . "\\>/ **/*"
nnoremap <C-k>k :execute "grep --exclude-dir=target --exclude-dir=node_modules -Iwre " . expand("<cword>") . " **/*"<CR>:copen 6<CR><CR>
nnoremap <C-k>j :execute "grep --exclude-dir=target --exclude-dir=node_modules -P -Ire '(?:extends\\\|with)[ \\t]+\\b" . expand("<cword>") . "\\b' **/*"<CR>:copen 6<CR><CR>

set sp=>

nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" set makeprg=./sbt-vim\ \"project\ jury\"\ compile
" set makeprg=./sbt-vim\ \"project\ cc-model\"\ compile
" set efm=%E\ %#[error]\ %f:%l:\ %m,%C\ %#[error]\ %p^,%-C%.%#,%Z,
"        \%W\ %#[warn]\ %f:%l:\ %m,%C\ %#[warn]\ %p^,%-C%.%#,%Z,
"        \%-G%.%#

set wildignore+=*/target/*,*/.git/*,*/dist/*,*/build/*,*/node_modules/*

" set runtimepath^=~/.vim/bundle/ctrlp.vim,~/.vim/bundle/nerdtree,~/.vim/bundle/ack,~/.vim/bundle/sauce,~/.vim/bundle/vim-clojure-static,~/.vim/bundle/rainbow_parentheses.vim,~/.vim/bundle/vim-fireplace,~/.vim/bundle/syntastic,~/.vim/bundle/haskellmode-vim,~/.vim/bundle/vim-hoogle,~/.vim/bundle/vim-hdevtools,~/.vim/bundle/purescript-vim,~/.vim/bundle/psc-ide-vim

set tags=./tags;~,tags

" au BufRead,BufNewFile *.scala set tags+=~/v4workspace/sourcedeps/tags

" source ~/.vim/autotag.vim

nnoremap ,cd :lcd %:p:h<CR>:pwd<CR>

let g:ctrlp_regexp = 1

if ! has('gui_running')
  set t_Co=256
  set background=dark
endif

nnoremap <Leader>e :Errors<CR>

let g:haddock_browser = "/usr/bin/firefox"

nnoremap <leader>ht :HdevtoolsType<CR>
nnoremap <leader>hc :HdevtoolsClear<CR>
nnoremap <leader>hi :HdevtoolsInfo<CR>

let g:hdevtools_options = '-c --enable-tests'
let g:syntastic_haskell_hdevtools_args = '-c --enable-tests'

au FileType haskell compiler ghc

au FileType haskell setlocal tags+=~/haskell/sources/tags

au FileType haskell set formatprg=pointfree\ --stdin
au FileType haskell map <buffer> <Leader>q :Hoogle
au FileType haskell map <buffer> <silent> <Leader>w :HoogleClose<CR>
" au FileType haskell map <buffer> <silent> <Leader>e :HoogleLine<CR>

digr ee 8799

set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds

let g:syntastic_ignore_files = ['\.java$','\.cc$', '\.cpp$']
let g:syntastic_haskell_checkers = ['hdevtools', 'hlint']
" let g:syntastic_haskell_checkers = ['hlint']
"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

set autoread
" nnoremap rr :silent! checktime<CR>

let g:clojure_fuzzy_indent = 1
let g:clojure_fuzzy_indent_patterns = ['^with', '^def', '^let', '^dom']
let g:clojure_fuzzy_indent_blacklist = ['-fn$', '\v^with-%(meta|out-str|loading-context)$']

let g:psc_ide_check_output_dir = 0
let g:psc_ide_syntastic_mode = 1

au FileType purescript nm <buffer> <leader>t :<C-U>Ptype<CR>
au FileType purescript nm <buffer> <leader>T :<C-U>PaddType<CR>
au FileType purescript nm <buffer> <leader>s :<C-U>Papply<CR>
au FileType purescript nm <buffer> <leader>a :<C-U>PaddType<CR>
au FileType purescript nm <buffer> <leader>i :<C-U>Pimport<CR>
au FileType purescript nm <buffer> <leader>r :<C-U>Pload<CR>
au FileType purescript nm <buffer> <leader>p :<C-U>Pursuit<CR>
au FileType purescript nm <buffer> <leader>C :<C-U>Pcase<CR>
au FileType purescript nm <buffer> <leader>f :<C-U>PaddClause<CR>
au FileType purescript nm <buffer> <leader>qa :<C-U>PaddImportQualifications<CR>
