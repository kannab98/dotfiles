"Author:    Kirill Ponur    
"------------------------------------------------------------
" 1. Plugins
"------------------------------------------------------------
call plug#begin('~/.vim/plugged')
Plug 'terryma/vim-multiple-cursors'
"Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prew_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

Plug 'davidhalter/jedi-vim'
Plug 'lifepillar/vim-mucomplete'
set completeopt-=preview
set completeopt+=longest,menuone,noinsert,noselect
let g:jedi#popup_on_dot = 0  " It may be 1 as well
let g:mucomplete#enable_auto_at_startup = 1
set noinfercase
set shortmess+=c
let g:mucomplete#chains = {}
let g:mucomplete#chains.default =['path', 'omni', 'keyn', 'dict', 'spel']
let g:mucomplete#completion_delay = 1
let g:jedi#auto_initialization=1
let g:jedi#configure_call_signatures=1
let g:jedi#show_call_signatures_delay=30

Plug 'kh3phr3n/python-syntax'
"Plug 'vim-python/python-syntax'
let python_higlight_all = 1

if has('unix')
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    "for first running: pip install unidecode                        
    let g:UltiSnipsExpandTrigger       = "<tab>"
    let g:UltiSnipsJumpForwardTrigger  = "<tab>"
    let g:UltiSnipsJumpBackwardTrigger = "<S-tab>"
    let g:UltiSnipsSnippetDirectories  = ["UltiSnips",$HOME."/.vim/"]
endif
"Plug 'airblade/vim-gitgutter'

Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

Plug 'scrooloose/nerdcommenter'
filetype plugin indent on

Plug 'tpope/vim-fugitive'
Plug 'lyokha/vim-xkbswitch'

let g:XkbSwitchEnabled = 1 
let g:XkbSwitchLib = '/usr/lib/libxkbswitch.so' " Enable autochange layout in normal mode 
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
Plug 'lervag/vimtex'                , {'for': 'tex'}

"Plug 'ervandew/supertab'
Plug 'crusoexia/vim-monokai'
Plug 'ErichDonGubler/vim-sublime-monokai' 

Plug 'francoiscabrol/ranger.vim'
Plug 'junegunn/vim-easy-align'
xmap ga <Plug>(EasyAlign) nmap ga <Plug>(EasyAlign)
let g:NERDTreeQuitOnOpen = 1



Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'mboughaba/i3config.vim'



"let g:pymode_lint = 0
call plug#end()
"------------------------------------------------------------
" 2. Language and encoding
"------------------------------------------------------------
" Change menu language of Vim to Russian 
language en_US.utf8 
let $LANG          ='en_US'
set langmenu       =en_US
set termencoding   =utf-8
set fileencodings  =utf-8
set fileformats    =unix,dos,mac
set spelllang=ru,en
"------------------------------------------------------------
" 3. Features
""------------------------------------------------------------
" Auto change current working directory, after change buffer
set autochdir

" No annoying sound on errors
set noerrorbells
set novisualbell

set wildmenu
set wildchar=<TAB>

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

set exrc
set secure
" Enable syntax highlighting
syntax on
" Line numbering 
set number
" Copy to system clipboard
set clipboard=unnamedplus

set mousemodel=extend
set mouse=a

"set nobackup
"set nowritebackup
set noswapfile

set winaltkeys=no
"Always show current position
"set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Disable '--INSERT--' in statusline
set noshowmode
set showmatch 
set hlsearch
set incsearch
" Ingnore case in find
set ignorecase

set tw=79
set smarttab
set complete-=i

colorscheme monokai
set termguicolors
set t_Co=256


" Conceal for monokai
hi clear Conceal
hi Conceal guifg='#8EC9F2'



" Tab size
set tabstop=4
" Converting tabs to spaces
set expandtab
" Newline tab size
set shiftwidth=4
" Line break instead word wrap 
set wrap linebreak nolist
" Split window settings
set splitbelow
set splitright

"
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
"------------------------------
" 3.1. Statusbar settings
"------------------------------
" Always show the status line
set laststatus=2

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ \ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
"------------------------------
" 3.2. GUI settings           
"------------------------------
if has("gui_running")
    " Remove toolbar
    set guioptions-=T
    " Remove menu bar
    set guioptions-=m 
    " Remove right-hand scroll bar
    set guioptions-=r  
    set guioptions-=L
    set guiheadroom=0
    set guioptions-=e
endif
"------------------------------
" 3.3. Session Settings       
"------------------------------
let g:session_default_to_last   = 1
let g:session_autoload          = 'no'
let g:session_autosave          = 'yes'
" Autosave period in minutes 
let g:session_autosave_periodic = 1
let g:session_autosave_silent   = 1
set sessionoptions-=buffers
set sessionoptions-=help
set sessionoptions-=options
"------------------------------
" 3.3. Autocmd Settings       
"------------------------------
"Reload .vimrc after saving
"autocmd BufWritePost .vimrc Gist
"autocmd BufWrite .vimrc source ~/.vimrc 

autocmd! BufWritePost .vimrc  source %
autocmd! BufWritePost .bashrc !source %
autocmd! BufWritePost .zshrc  !source %
autocmd! BufEnter      *      call system("echo ". expand("%:p:h") ."> ~/.last_dir")

augroup Vimautocmd
    autocmd! BufLeave *
    autocmd BufEnter *.tex source ~/.vim/.vimrc_tex
    "autocmd BufEnter *.tex echo 'tex'
    autocmd BufEnter *.cpp source ~/.vim/.vimrc_cpp
    "autocmd BufEnter *.cpp echo 'cpp'
    autocmd BufEnter *.py  source ~/.vim/.vimrc_py
    "autocmd BufEnter *.py echo 'py'
augroup END
"------------------------------------------------------------
"4. Map definitions (Key bindings)                                   
"------------------------------------------------------------
"nnoremap <silent> <esc> :nohlsearch <CR>
"map <silent> <esc> :let @/=''<CR>
" Copy to system clipboard
"noremap <leader>y "*y
"noremap <leader>p "*p
"noremap <leader>Y "+y
"noremap <leader>P "+p
"Delete without copy
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d
"Delete with copy (cut)
nnoremap <leader>x "_x
nnoremap <leader>d "_d
nnoremap <leader>D "_D
cno $h e ~/ cno $d e ~/Desktop/
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>
cno $q <C-\>eDeleteTillSlash()<cr>



" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <C-j> mz:m+<cr>`z
nmap <C-k> mz:m-2<cr>`z
vmap <C-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <C-k> :m'<-2<cr>`>my`<mzgv`yo`z

nnoremap <silent> <C-o> :RangerCurrentDirectory <CR>
nnoremap <silent> <esc><esc> :silent! nohlsearch <CR>

"Save with root
command! W  execute 'w !sudo tee % > /dev/null' <bar> edit!
"command -nargs=* -complete=file New :call system('vim '.shellescape(<f-args>))
command New :call system("vim --servername vim2 .vimrc")

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
"vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
"vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
"nnoremap <silent> <ESC> :nohlsearch <CR>

" Smart way to move between windows
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" |  endif


" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

let g:term_count=0

function! Terminal()
    "let g:term_count+=1
    "silent exec "!$TERMINAL -d ".  expand("%:p:h")."&" 
    silent exec "!kitty @ --to unix:$i3/kittytmp new-window --window-type os --keep-focus --cwd ".expand('%:p:h')
endfunction

nnoremap <leader>t :call Terminal() <CR>
"cnoreabbrev vsplit !$TERMINAL &> /dev/null & <CR>
cnoreabbrev Explore  RangerCurrentDirectory <CR>
"------------------------------------------------------------


function! Tilda()
    hi! Normal             ctermbg=NONE guibg=NONE
    "hi! NormalColor        ctermbg=NONE guibg=NONE
    "hi! VisualColor        ctermbg=NONE guibg=NONE
    "hi! InsertColor        ctermbg=NONE guibg=NONE
    hi! Statement          ctermbg=NONE guibg=NONE
    hi! Title              ctermbg=NONE guibg=NONE
    "hi! Todo               ctermbg=NONE guibg=NONE
    "hi! Underlined         ctermbg=NONE guibg=NONE
    hi! ErrorMsg           ctermbg=NONE cterm=bold guibg=NONE guifg=red
    "Number transparency
    hi! LineNr             ctermbg=NONE guibg=NONE
    hi! StatusLine         ctermbg=NONE cterm=bold guibg=NONE guifg=white
    hi! StatusLineNC       ctermbg=NONE cterm=bold guibg=NONE guifg=white
endfunction

if has("gui_running")
  set colorcolumn=79
  highlight ColorColumn ctermbg=darkgray
  if has('win32')
    set guifont=Consolas:h13:cANSI
endif
  if has('unix')
      set guifont=Monospace\ 12
  endif
else
    call Tilda()
endif

func! DeleteTillSlash()
    let g:cmd = getcmdline()

    if has("win16") || has("win32")
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
    else
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
    endif

    if g:cmd == g:cmd_edited
        if has("win16") || has("win32")
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
        else
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
        endif
    endif   

    return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
    return a:cmd . " " . expand("%:p:h") . "/"
endfunc
"------------------------------------------------------------
" Шпаргака по горячим клавишам
"------------------------------------------------------------
"
"------------------------------
" Способы перейти в режим вставки
"------------------------------

"
" <i> - вставить текст слева от текущего
" <I> - вставить текст в начало строки
" <a> - вставить текст справа от текущего символа
" <A> - вставить текст в конец текущей строки
" <o> - создать новую строку под текущей
" <O> - создать новую строку над текущей
" <C> - заменить всё до конца строки
" <r> - заменить 1 символ
" <ciw> - заменить слово под курсором
" <ci"> - заменить текст между кавычками
" <ci(> - заменить текст между круглыми скобками
" <gi> - перейти к последнему месту, где производилось редактирование
"
"------------------------------
" Передвижение по тексту
"------------------------------
" <fx> - передвинуть курсор вперед к следующему вхождению 
"        символа 'x' в текущей строке
" <tx> - передвинуть курсор вперед к следующему вхождению 
"        символа 'x' в текущей строке
"        и установить курсор перед символом 'x'
" <Fx> - передвинуть курсор назад к предыдущему вхождению 
"        символа 'x' в текущей строке
" <w> - передвинуть курсор на одно слово вперед
" <b> - передвинуть курсор на одно слово назад 
" <0> - передвинуть курсор на начало текущей строки 
" <^> - передвинуть курсор на первый символ в текущей строке
" <$> - передвинуть курсор на конец текущей строки
" <*> - начать поиск по слову под курсором
" <#> - начать поиск по слову под курсором в обратном порядке
" <%> - перейти к закрывающейся парной скобке
"
"------------------------------
"Выделение текста
"------------------------------
" <v%> - когда курсор установлен на одной из скобок - выделит всё до её пары.
" <vib> - выделить всё между двумя ближайшими к курсору круглыми скобками
" <viB> - выделить всё между двумя ближайшими к курсору фигурными скобками
" <vi"> - выделить всё между двумя ближайшими двойными кавычками
" <vi'> - выделить всё между двумя ближайшими одинарными кавычками
" <ggVG> - выделить весь файл
" <Ctrl+v> - выделять прямоугольником
"
"------------------------------
"Прочее
"------------------------------
" <cw()<ESC>P> - заключить одно слово в скобки
" <gq> - в Visual-mode  переформатирует строку
" <Ctrl+a> - увеличить число под курсором на 1
" <Ctrl+x> - уменьшить число под курсором на 1
" <~> - изменить регистр символа на противоположный
" <J> - объединить текущую строку со следующей
