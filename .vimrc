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
filetype plugin on

Plug 'tpope/vim-fugitive'
Plug 'lyokha/vim-xkbswitch'
let g:XkbSwitchEnabled = 1 
let g:XkbSwitchLib = '/usr/lib/libxkbswitch.so' " Enable autochange layout in normal mode
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
Plug 'xuhdev/vim-latex-live-preview', {'for': 'tex' }
Plug 'lervag/vimtex'                , {'for': 'tex'}

Plug 'ervandew/supertab'
Plug 'thinca/vim-fontzoom'
Plug 'crusoexia/vim-monokai'
"Plug 'sickill/vim-monokai'
Plug 'ErichDonGubler/vim-sublime-monokai' 
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/vim-easy-align'
xmap ga <Plug>(EasyAlign) nmap ga <Plug>(EasyAlign)

let g:NERDTreeQuitOnOpen = 1
Plug 'davidhalter/jedi-vim'
let g:jedi#auto_initialization=1
let g:jedi#popup_on_dot=0
let g:jedi#configure_call_signatures=1
let g:jedi#show_call_signatures_delay=10
"Plug 'sheerun/vim-polyglot'
Plug 'kh3phr3n/python-syntax'
"Plug 'vim-python/python-syntax'
let python_higlight_all = 1

Plug 'octol/vim-cpp-enhanced-highlight'
"Plug 'python-mode/python-mode'
"let g:pymode_python = 'python3'
"Plug 'spolu/dwm.vim'
Plug 'roman/golden-ratio'
let g:golden_ratio_autocommand = 1
let g:golden_ratio_exclude_nonmodifiable = 1

Plug 'mboughaba/i3config.vim'

aug i3config_ft_detection
  au!
  au BufNewFile,BufRead */i3/config set filetype=i3config
aug end

"let g:pymode_lint = 0
call plug#end()
"------------------------------------------------------------
" 2. Language and encoding
"------------------------------------------------------------
" Change menu language of Vim to Russian 
language messages    ru_RU.UTF-8 
let $LANG          ='ru_RU.UTF-8'
set langmenu       =ru_RU.UTF-8  
set encoding       =utf-8 
set termencoding   =utf-8
set fileencodings  =utf-8
set fileformats    =unix,dos,mac
set spelllang=ru
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim
"------------------------------------------------------------
" 3. Features
""------------------------------------------------------------
" Auto change current working directory, after change buffer
set autochdir

set noeb vb t_vb =
set wildmenu
set exrc
set secure
" Enable syntax highlighting
syntax on
" Line numbering 
set number
set clipboard=unnamed
"


" Disable '--INSERT--' in statusline
set noshowmode
"set showmatch 
"set hlsearch
"set incsearch
"set ignorecase

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

let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
"------------------------------
" 3.1. Statusbar settings
"------------------------------
set laststatus=1
"set statusline +=%1*\ %n\ %*            "buffer number
"set statusline +=%5*%{&ff}%*            "file format
"set statusline +=%3*%y%*                "file type
"set statusline +=%4*\ %<%F%*            "full path
"set statusline +=%2*%m%*                "modified flag
"set statusline +=%1*%=%5l%*             "current line
"set statusline +=%2*/%L%*               "total lines
"set statusline +=%1*%4v\ %*             "virtual column number
"------------------------------
" 3.2. GUI settings           
"------------------------------

" Remove toolbar
set guioptions-=T
" Remove menu bar
set guioptions-=m 
" Remove right-hand scroll bar
set guioptions-=r  
set guioptions-=L
set guiheadroom=0
set guioptions-=e
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
" Copy to system clipboard
noremap <leader>y "*y
noremap <leader>p "*p
noremap <leader>Y "+y
noremap <leader>P "+p
"Delete without copy
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d
"Delete with copy (cut)
nnoremap <leader>x "_x
nnoremap <leader>d "_d
nnoremap <leader>D "_D
nnoremap <localleader>t :call Console() <CR> 
nnoremap <silent> <C-o> :NERDTreeToggle <CR>
"Save with root
command! W  w !sudo tee %
"------------------------------------------------------------

command! -nargs=? -complete=buffer -bang Bonly
    \ :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang BOnly
    \ :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang Bufonly
    \ :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang BufOnly
    \ :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang Clear
    \ :call BufOnly('<args>', '<bang>')

function! BufOnly(buffer, bang)
	if a:buffer == ''
		" No buffer provided, use the current buffer.
		let buffer = bufnr('%')
	elseif (a:buffer + 0) > 0
		" A buffer number was provided.
		let buffer = bufnr(a:buffer + 0)
	else
		" A buffer name was provided.
		let buffer = bufnr(a:buffer)
	endif

	if buffer == -1
		echohl ErrorMsg
		echomsg "No matching buffer for" a:buffer
		echohl None
		return
	endif

	let last_buffer = bufnr('$')

	let delete_count = 0
	let n = 1
	while n <= last_buffer
		if n != buffer && buflisted(n)
			if a:bang == '' && getbufvar(n, '&modified')
				echohl ErrorMsg
				echomsg 'No write since last change for buffer'
							\ n '(add ! to override)'
				echohl None
			else
				silent exe 'bdel' . a:bang . ' ' . n
				if ! buflisted(n)
					let delete_count = delete_count+1
				endif
			endif
		endif
		let n = n+1
	endwhile

	if delete_count == 1
		echomsg delete_count "buffer deleted"
	elseif delete_count > 1
		echomsg delete_count "buffers deleted"
	endif

endfunction

function! Tilda()
    "hi! airline_c          ctermbg=NONE guibg=NONE
    "hi! airline_tabfill    ctermbg=NONE guibg=NONE
    hi! Normal             ctermbg=NONE guibg=NONE
    "hi! NormalColor        ctermbg=NONE guibg=NONE
    "hi! VisualColor        ctermbg=NONE guibg=NONE
    "hi! InsertColor        ctermbg=NONE guibg=NONE
    hi! Statement          ctermbg=NONE guibg=NONE
    hi! Title              ctermbg=NONE guibg=NONE
    "hi! Todo               ctermbg=NONE guibg=NONE
    "hi! Underlined         ctermbg=NONE guibg=NONE
    "hi! ErrorMsg           ctermbg=NONE guibg=NONE
    "Number transparency
    hi! LineNr             ctermbg=NONE guibg=NONE
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
" <vi>" - выделить всё между двумя ближайшими двойными кавычками
" <vi'> - выделить всё между двумя ближайшими одинарными кавычками
" <ggVG> - выделить весь файл
" <Ctrl+v> - выделять прямоугольником
"
"------------------------------
"Прочее
"------------------------------
" <gq> - в Visual-mode  переформатирует строку
" <Ctrl+a> - увеличить число под курсором на 1
" <Ctrl+x> - уменьшить число под курсором на 1
" <~> - изменить регистр символа на противоположный
" <J> - объединить текущую строку со следующей
