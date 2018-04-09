" store in ~/.vim_runtime
" https://github.com/amix/vimrc

""""""""""""""""""""""""""""""""
" => AESTHETICS
""""""""""""""""""""""""""""""""

" Overwrite statusbar settings (make sure to clone PaperColor theme)
let g:lightline = {'colorscheme': 'PaperColor'}

" Set theme
colorscheme one
set background=light
set guifont=Inconsolata\ 13
"let g:airline_theme='one'
"let g:airline_powerline_fonts=1
let g:one_allow_italics=1

" Make window bigger on startup
if has("gui_running")
    set lines=60 columns=150
endif

" Turn on relative line numbering
set relativenumber
" Turn off blinking cursor
set guicursor+=a:blinkon0
" Disable line folding
set nofoldenable

" Change title of window
autocmd BufEnter * if expand("%:t")=='' | let &titlestring = "Hey man, you're not editing anything at the moment" | else | let &titlestring = "Hey man, you're editing" .  " " . expand("%:t") | endif

" Set default working directory
cd ~/GitProjects/

""""""""""""""""""""""""""""""""
" => CONFIGURATIONS
""""""""""""""""""""""""""""""""

" Exit zenroom without fucking up theme
nnoremap <silent> <leader>Z :Goyo! \| colorscheme one<cr>

" Configure pencil to make wrapped lines more easy to navigate
augroup pencil
  autocmd!
  autocmd FileType markdown,md,mkd call pencil#init({'wrap': 'soft'})
  autocmd FileType text            call pencil#init()
augroup END

" Markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" Vimtex
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_latexlog = {'default' : 0}
let g:vimtex_compiler_latexmk = {'callback' : 0}
" Disable warnings for LaTeX files
let g:syntastic_tex_chktex_quiet_messages={'level':'warnings'}

" Ale
let g:ale_python_flake8_executable = 'home/bobby/anaconda/bin/flake8'
" Only lint when saving the file
let g:ale_lint_on_text_changed = 'never'
" Don't lint when opening a file
let g:ale_lint_on_enter = 0

" Jedi
let g:pymode_python = 'python3'
let g:pymode_virtualenv_path='/home/bobby/anaconda'
let g:jedi#force_py_version=3

""""""""""""""""""""""""""""""""
" => REMAPS
""""""""""""""""""""""""""""""""

" Remap tabular to align on anything
let mapleader=','
vnoremap <Leader>a :Tabular<space>/

" Copy to clipboard with YY or Ctrl-c
vnoremap  YY "+y
vnoremap <C-c> "+y
" paste from clipboard with Ctrl-v
set pastetoggle=<F10>
inoremap <C-v> <F10><C-r>+<F10>

""""""""""""""""""""""""""""""""
" => CUSTOM FUNCTIONS
""""""""""""""""""""""""""""""""

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
