" store in ~/.vim_runtime
" https://github.com/amix/vimrc

" let g:solarized_termtrans = 1
" set background=dark
" colorscheme solarized
" colorscheme onedark
set guifont=Source\ Code\ Pro\ 12
" let g:airline_theme='silver'

" One theme
let g:airline_theme='one'
let g:airline_powerline_fonts=1
let g:one_allow_italics=1
colorscheme one
set background=light
set t_Co=256

set relativenumber
:set guicursor+=a:blinkon0
set nofoldenable "disable line folding

" remap tabular to align on anything
let mapleader=','
vnoremap <Leader>a :Tabular<space>/

" exit zenroom
nnoremap <silent> <leader>Z :Goyo! \| colorscheme solarized<cr>

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

" copy to clipboard with YY or Ctrl-c
vnoremap  YY "+y
vnoremap <C-c> "+y
" paste from clipboard with Ctrl-v
set pastetoggle=<F10>
inoremap <C-v> <F10><C-r>+<F10>

" resolve common LaTeX errors and warnings
function! CleanLatexFunction()
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
" :CleanLatex

" append characters to rows of numbers or text
function! PadMaterialsFunction() range
    silent execute a:firstline . ',' . a:lastline . 's/^/000/'
endfunction
command! -range PadMaterials <line1>,<line2> call PadMaterialsFunction()

" convert rows of numbers or text (as if pasted from excel column) to a tuple
function! ToTupleFunction() range
    silent execute a:firstline . "," . a:lastline . "s/^/'/"
    silent execute a:firstline . "," . a:lastline . "s/$/',/"
    silent execute a:firstline . "," . a:lastline . "join"
    silent execute "normal I("
    silent execute "normal $xa)"
    silent execute "normal ggVGYY"
endfunction
command! -range ToTuple <line1>,<line2> call ToTupleFunction()

" convert rows of numbers or text (as if pasted from excel column) to an array
function! ToArrayFunction() range
    silent execute a:firstline . "," . a:lastline . "s/^/'/"
    silent execute a:firstline . "," . a:lastline . "s/$/',/"
    silent execute a:firstline . "," . a:lastline . "join"
    silent execute "normal I["
    silent execute "normal $xa]"
endfunction
command! -range ToArray <line1>,<line2> call ToArrayFunction()

" :so % to reload configs
