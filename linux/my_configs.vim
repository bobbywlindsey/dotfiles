" store in ~/.vim_runtime
" https://github.com/amix/vimrc
set background=dark
let g:solarized_termtrans = 1
" colorscheme solarized
" colorscheme pyte
set relativenumber
set gcr=a:blinkon0
set guifont=Hack\ 14

" shortcut for common alignment characters
let mapleader=','
nmap <Leader>a= :Tab /=<CR>
vmap <Leader>a= :Tab /=<CR>
nmap <Leader>a: :Tab /:<CR>
vmap <Leader>a: :Tab /:<CR>

" configure markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" configure pencil
augroup pencil
  autocmd!
  autocmd FileType markdown,md,mkd call pencil#init()
  autocmd FileType text            call pencil#init()
augroup END

" configure vimtex
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_latexlog = {'default' : 0}
