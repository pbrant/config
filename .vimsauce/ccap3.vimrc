set titlestring=VimCcap3%(\ %t%)%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)\ (%{pathshorten(getcwd())})

set tags=./tags;tags;~/v4workspace/sourcedeps/tags;~

nnoremap ,gh :lcd ~/v4workspace/ccap3<CR>:pwd<CR>

