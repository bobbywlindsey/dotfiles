" store in ~/.vim_runtime
" https://github.com/amix/vimrc
" let g:solarized_termtrans = 1
" set background=dark
" colorscheme solarized
colorscheme onedark
set relativenumber

" remap tabular to align on anything
let mapleader=','
vnoremap <Leader>a :Tabular<space>/

" configure pencil
augroup pencil
  autocmd!
  autocmd FileType markdown,md,mkd call pencil#init({'wrap': 'soft'})
  autocmd FileType text            call pencil#init()
augroup END

" configure markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" configure vimtex
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_latexlog = {'default' : 0}
let g:vimtex_compiler_latexmk = {'callback' : 0}

" disable warnings for LaTeX files
let g:syntastic_tex_chktex_quiet_messages={'level':'warnings'}

" resolve common LaTeX errors and warnings
function! CleanLatexFunction()
    :%s/}\ \\label/}\\label/ge
    :%s/\ \\ref/\~\\ref/ge
    :%s/\ "/\ ``/ge
    :%s/"\ /''\ /ge
    :%s/",/'',/ge
    :%s/"\./''\./ge
    :%s/")/'')/ge
    :%s/i\.e\.\ /i\.e\.\\\ /ge
    :%s/e\.g\.\ /e\.g\.\\\ /ge
endfunction
" :call CleanLatexFunction()
command! CleanLatex call CleanLatexFunction()
" :cleanlatex

" :so % to reload configs
