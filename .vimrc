
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
" set ballooneval

syntax on

filetype indent on
filetype plugin on

set novisualbell
set noerrorbells
" set laststatus=2

let g:rubycomplete_rails = 0
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_include_object = 1
let g:rubycomplete_include_objectspace = 1

au BufRead,BufNewFile *.rb,*.erb set tags=~/.vim/jruby_tags,tags
au BufRead,BufNewFile *.rb,*.erb set ts=2 sw=2 sts=2 expandtab

set dictionary+=/etc/dictionaries-common/words

imap <C-Space> <C-X><C-O>

nnoremap \b :CtrlPBuffer<CR>

set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)\ (%{pathshorten(getcwd())})

" nnoremap <C-k> :execute "vimgrep /\\<" . expand("<cword>") . "\\>/ **/*"
nnoremap <C-k>k :execute "grep --exclude-dir=target -Iwre " . expand("<cword>") . " **/*"<CR>:copen 6<CR><CR>
nnoremap <C-k>j :execute "grep --exclude-dir=target -P -Ire '(?:extends\\\|with)[ \\t]+\\b" . expand("<cword>") . "\\b' **/*"<CR>:copen 6<CR><CR>

set sp=>

nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" set makeprg=./sbt-vim\ \"project\ jury\"\ compile
set makeprg=./sbt-vim\ compile
set efm=%E\ %#[error]\ %f:%l:\ %m,%C\ %#[error]\ %p^,%-C%.%#,%Z,
       \%W\ %#[warn]\ %f:%l:\ %m,%C\ %#[warn]\ %p^,%-C%.%#,%Z,
       \%-G%.%#

set wildignore+=*/target/*,*/.git/*

set runtimepath^=~/.vim/bundle/ctrlp.vim,~/.vim/bundle/nerdtree,~/.vim/bundle/ack,~/.vim/bundle/sauce

set tags=./tags;~,tags

" au BufRead,BufNewFile *.scala set tags+=~/v4workspace/sourcedeps/tags

" source ~/.vim/autotag.vim

nnoremap ,cd :lcd %:p:h<CR>:pwd<CR>

nnoremap ,f :NERDTreeFind<CR>

let g:ctrlp_regexp = 1

