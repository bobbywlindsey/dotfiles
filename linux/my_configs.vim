" store in ~/.vim_runtime
" https://github.com/amix/vimrc

" Set theme
let g:airline_theme='one'
let g:airline_powerline_fonts=1
let g:one_allow_italics=1
colorscheme one
set background=light
set t_Co=256
set guifont=Inconsolata\ 12

" Make window bigger on startup
set lines=60 columns=150

" Set default working directory
cd ~/GitProjects/

" Turn on relative line numbering
set relativenumber
" Turn off blinking cursor
:set guicursor+=a:blinkon0
" Disable line folding
set nofoldenable 

" Remap tabular to align on anything
let mapleader=','
vnoremap <Leader>a :Tabular<space>/

" Exit zenroom without fucking up theme
nnoremap <silent> <leader>Z :Goyo! \| colorscheme one<cr>

" Configure pencil to make wrapped lines more easy to navigate
augroup pencil
  autocmd!
  autocmd FileType markdown,md,mkd call pencil#init({'wrap': 'soft'})
  autocmd FileType text            call pencil#init()
augroup END

" Configure markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" Configure vimtex
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_latexlog = {'default' : 0}
let g:vimtex_compiler_latexmk = {'callback' : 0}

" Disable warnings for LaTeX files
let g:syntastic_tex_chktex_quiet_messages={'level':'warnings'}

" Copy to clipboard with YY or Ctrl-c
vnoremap  YY "+y
vnoremap <C-c> "+y
" paste from clipboard with Ctrl-v
set pastetoggle=<F10>
inoremap <C-v> <F10><C-r>+<F10>

" Resolve common LaTeX errors and warnings
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

" Append characters to rows of numbers or text
function! PadMaterialsFunction() range
    silent execute a:firstline . ',' . a:lastline . 's/^/000/'
endfunction
command! -range PadMaterials <line1>,<line2> call PadMaterialsFunction()

" Convert rows of numbers or text (as if pasted from excel column) to a tuple
function! ToTupleFunction() range
    silent execute a:firstline . "," . a:lastline . "s/^/'/"
    silent execute a:firstline . "," . a:lastline . "s/$/',/"
    silent execute a:firstline . "," . a:lastline . "join"
    silent execute "normal I("
    silent execute "normal $xa)"
    silent execute "normal ggVGYY"
endfunction
command! -range ToTuple <line1>,<line2> call ToTupleFunction()

" Convert rows of numbers or text (as if pasted from excel column) to an array
function! ToArrayFunction() range
    silent execute a:firstline . "," . a:lastline . "s/^/'/"
    silent execute a:firstline . "," . a:lastline . "s/$/',/"
    silent execute a:firstline . "," . a:lastline . "join"
    silent execute "normal I["
    silent execute "normal $xa]"
endfunction
command! -range ToArray <line1>,<line2> call ToArrayFunction()

" Change title of window
let &titlestring = "Hey man, you're editing" . " " . expand("%:t")
if &term == "screen"
    set t_ts=^[k
    set t_fs=^[\
endif
if &term == "screen" || &term == "xterm"
    set title
endif

" :so % to reload configs
