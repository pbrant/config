
call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'neoclide/coc.nvim', { 'do': { -> coc#util#install() } }
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/fzf.vim'
Plug('purescript-contrib/purescript-vim')
Plug 'derekwyatt/vim-scala'
Plug 'scrooloose/nerdtree'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

call plug#end()

syntax on
filetype on
filetype plugin indent on

"nnoremap <leader>] :call CocActionAsync('jumpDefinition')<CR>
"nnoremap <leader>[ :call CocActionAsync('jumpReferences')<CR>
"nnoremap <leader>= :call CocActionAsync('doHover')<CR>
"nnoremap <leader>) :call CocActionAsync('jumpImplementation')<CR>
"nnoremap <leader>\ :<C-u>CocList -I symbols<CR>
"nnoremap <leader>r :call CocAction('rename')<CR>
"nnoremap <leader><space> :CocList<CR>

set number

au BufRead,BufNewFile *.sbt set filetype=scala

au BufRead,BufNewFile *.rb,*.erb,*.html,*.css,*.json,*.js,*.scss,*.xsl,*.hs,*.purs,*.tex set ts=2 sw=2 sts=2 expandtab
au BufRead,BufNewFile *.java set ts=4 sw=4 sts=4 expandtab

set tags=./tags;~,tags

let g:purescript_indent_if = 2
let g:purescript_indent_case = 2
let g:purescript_indent_let = 4
let g:purescript_indent_in = 0
let g:purescript_indent_where = 2
let g:purescript_indent_do = 2

" START metals config

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Some server have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for do codeAction of current line
nmap <leader>ac <Plug>(coc-codeaction)

" Remap for do action format
nnoremap <silent> F :call CocAction('format')<CR>

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" END metals config

let g:NERDTreeWinSize=60

nmap <silent> ,n :NERDTreeToggle<CR>
nmap <silent> ,f :NERDTreeFind<CR>

nmap <silent> <Leader>b :Buffers<CR>
nmap <silent> ,x :GFiles<CR>

let g:prettier#autoformat = 1

nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

noremap <C-k>k :execute "grep --exclude-dir=target --exclude-dir=node_modules -Iwre " . expand("<cword>") . " **/*"<CR>:copen 6<CR><CR>

let $FZF_DEFAULT_COMMAND = "fd -I --exclude target --exclude node_modules"
