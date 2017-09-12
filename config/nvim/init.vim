
" :help plugins
" :scriptnames   show all scripts loaded in the current session.
"                generally follows: plugins, ftplugin, after/ftplugin, syntax, after/syntax
" :set ro        be careful with important files


"""""""""""""
""PLUGINS"""
"""""""""""""
call plug#begin('~/.config/nvim/plugged')
"""ON DEMAND LOADING""" so its not slow (like webstorm):  Plug 'plugin' { 'on': ['cmd1', 'cmd2']}
"""GROUP DEPENDENCIES""" Plug 'independent' | Plug 'dependent'
" colorschemes
Plug 'chriskempson/base16-vim'
" utilities
Plug 'bfredl/nvim-ipy' " send/recieve code to IPython kernel
" Plug 'ctrlpvim/ctrlp.vim' " fuzzy file finder, 
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
" Plug 'ryanoasis/vim-devicons' " file drawer, these can be pretty distracting
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mileszs/ack.vim' " search inside files using ack. Same as command line ack utility, but use :Ack
Plug 'rking/ag.vim' " Ag commands
Plug 'Raimondi/delimitMate' " automatic closing of quotes, parenthesis, brackets, etc.
Plug 'tpope/vim-commentary' " comment stuff out, gcc: line, gc: selection
Plug 'tpope/vim-unimpaired' " READ which are simply short normal mode aliases for commonly used ex commands
" Plug 'tpope/vim-endwise' " automatically add end in ruby
Plug 'tpope/vim-ragtag' " endings for html, xml, etc. - ehances surround
Plug 'tpope/vim-surround' " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
Plug 'benmills/vimux' " tmux integration for vim
Plug 'vim-airline/vim-airline' " fancy statusline: see :help statusline
Plug 'vim-airline/vim-airline-themes' " themes for vim-airline
" Plug 'scrooloose/syntastic' " syntax checking for vim
Plug 'benekastah/neomake' " neovim replacement for syntastic using neovim's job control functonality
Plug 'tpope/vim-fugitive' " amazing git wrapper for vim
Plug 'tpope/vim-characterize'  " ga to characterize unicode characters
Plug 'tpope/vim-repeat' " enables repeating other supported plugins with the . command
Plug 'garbas/vim-snipmate' " snippet manager
Plug 'editorconfig/editorconfig-vim' " .editorconfig support
Plug 'MarcWeber/vim-addon-mw-utils' " interpret a file by function and cache file automatically
Plug 'tomtom/tlib_vim' " utility functions for vim
Plug 'sotte/presenting.vim', { 'for': 'markdown' } " a simple tool for presenting slides in vim based on text files
Plug 'ervandew/supertab' " Perform all your vim insert mode completions with Tab
Plug 'tpope/vim-dispatch' " asynchronous build and test dispatcher
" Plug 'mtth/scratch.vim'
" Plug 'tpope/vim-vinegar'
" Plug 'tpope/vim-abolish'
Plug 'AndrewRadev/splitjoin.vim' " single/multi line code handler: gS - split one line into multiple, gJ - combine multiple lines into one
Plug 'vim-scripts/matchit.zip' " extended % matching
Plug 'tpope/vim-sleuth' " detect indent style (tabs vs. spaces)
Plug 'sickill/vim-pasta' " context-aware pasting
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' } " distraction-free writing
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' } " focus tool. Good for presentating with vim
Plug 'darfink/vim-plist' " Support plist. 
" language-specific plugins
" Plug 'mattn/emmet-vim', { 'for': 'html' } " emmet support for vim - easily create markdup wth CSS-like syntax
" Plug 'gregsexton/MatchTag', { 'for': 'html' } " match tags in html, similar to paren support
" Plug 'othree/html5.vim', { 'for': 'html' } " html5 support
" Plug 'pangloss/vim-javascript', { 'for': 'javascript' } " JavaScript support
" Plug 'gavocanov/vim-js-indent', { 'for': 'javascript' } " JavaScript indent support
" Plug 'moll/vim-node', { 'for': 'javascript' } " node support
" Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' } " JavaScript syntax plugin
" Plug 'othree/yajs.vim', { 'for': 'javascript' } " JavaScript syntax plugin
" Plug 'mxw/vim-jsx', { 'for': 'jsx' } " JSX support
" Plug 'elzr/vim-json', { 'for': 'json' } " JSON support
" Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' } " ES6 and beyond syntax
" Plug 'Shougo/vimproc.vim', { 'do': 'make' } " interactive command execution in vim
" Plug 'leafgarland/typescript-vim', { 'for': 'typescript' } " typescript support
" Plug 'mustache/vim-mustache-handlebars' " mustach support
" Plug 'digitaltoad/vim-jade', { 'for': ['jade', 'pug'] } " jade support
" Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' } " sass scss syntax support
Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] } " markdown support
" Plug 'groenewege/vim-less', { 'for': 'less' } " less support
Plug 'ap/vim-css-color', { 'for': ['css','stylus','scss'] } " set the background of hex color values to the color
" Plug 'hail2u/vim-css3-syntax', { 'for': 'css' } " CSS3 syntax support
Plug 'itspriddle/vim-marked', { 'for': 'markdown', 'on': 'MarkedOpen' } " Open markdown files in Marked.app - mapped to <leader>m
" Plug 'tpope/vim-markdown', { 'for': 'markdown' } " markdown support
" Plug 'fatih/vim-go', { 'for': 'go' } " go support
" Plug 'timcharper/textile.vim', { 'for': 'textile' } " textile support
" Plug 'tclem/vim-arduino' " arduino support - compile wihtout needing to open the arduino IDE
call plug#end()


"""""""""""""""""""""""""""
"""GENERAL CONFIGURATION"""
"""""""""""""""""""""""""""
" Abbreviations
abbr funciton function
abbr teh the
abbr tempalte template
abbr fitler filter
" Terminal settings
set nocompatible " not compatible with vi
set splitright " default right with :vnew
set autoread " detect when a file is changed
" make backspace behave in a sane manner
set backspace=indent,eol,start
" set a map leader for more key combos
let g:mapleader = " "
set history=1000 " change history to 1000
set textwidth=120
" Tab control
set noexpandtab " insert tabs rather than spaces for <Tab>
" set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'
set completeopt+=longest
if has('mouse')
    set mouse=a  " n: normal, v:visual, etc., a:all
    " set ttymouse=xterm2
endif
set clipboard=unnamed
" faster redrawing
set ttyfast
set diffopt+=vertical
" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
" tell vim to keep backups
" set backup
" tell vim where to put backup files
" set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" If edited outside, update changes. Can also do :e!
set autoread
" tell vim where to put swap files
" set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set laststatus=2 " show the satus line all the time
" cursorline mappings in unimpaired
" set cursorline " can make scrolling too slow


"""""""""""""""""""""
"""""AUTOGROUPS"""""
"""""""""""""""""""""
" :help autocmd
" :set filetype? (see what filetype has been detected)
" :help ftplugin-overrule
augroup configgroup
    autocmd!
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType html setlocal ts=4 sts=4 sw=4 noexpandtab indentkeys-=*<return>
    autocmd FileType jade setlocal ts=2 sts=2 sw=2 noexpandtab
    autocmd FileType python setlocal expandtab
    autocmd FileType *.md.js :call SyntasticReset<cr>
    autocmd FileType markdown,textile setlocal textwidth=0 wrapmargin=0 wrap " spell
    autocmd FileType .xml exe ":silent %!xmllint --format --recover - 2>/dev/null"
    " autocmd FileType .plist setlocal nobackup nowritebackup " Using plugin now
    " automatically resize panes on resize
    autocmd VimResized * exe 'normal! \<c-w>='
    autocmd BufWritePost .vimrc source %
    autocmd BufWritePost .vimrc.local source %
    " save all files on focus lost, ignoring warnings about untitled buffers
    autocmd FocusLost * silent! wa
    " autocmd BufNewFile,BufRead *.plist set filetype=xml " Using plugin now
    autocmd BufNewFile,BufRead *.ejs set filetype=html
    autocmd BufNewFile,BufRead *.ino set filetype=c
    autocmd BufNewFile,BufRead *.svg set filetype=xml
    autocmd BufNewFile,BufRead .babelrc set filetype=json
    autocmd BufNewFile,BufRead .jshintrc set filetype=json
    autocmd BufNewFile,BufRead .eslintrc set filetype=json
    autocmd BufNewFile,BufRead *.es6 set filetype=javascript
    " make quickfix windows take all the lower section of the screen
    " when there are multiple windows open
    autocmd FileType qf wincmd J
    autocmd BufNewFile,BufReadPost *.md set filetype=markdown
    let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'json=javascript', 'stylus', 'html']
    " autocmd! BufEnter * call ApplyLocalSettings(expand('<afile>:p:h'))
    autocmd BufNewFile,BufRead,BufWrite *.md syntax match Comment /\%^---\_.\{-}---$/
    " autocmd! BufWritePost * Neomake
augroup END


""""""""""""""""""""
"""USER INTERFACE"""
""""""""""""""""""""
" see :help option-list
" code folding settings
set foldmethod=syntax " fold based on indent
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1
set so=7 " set 7 lines to the cursors - when moving vertical
set wildmenu " enhanced command line completion
set hidden " current buffer can be put into background
set showcmd " show incomplete commands
set noshowmode " don't show which mode disabled for PowerLine
set wildmode=list:longest " complete files like a shell
set scrolloff=3 " lines of text around cursor
" Terminal
set shell=/usr/local/bin/zsh  " CtrlP acting weird with this shell
" set shell=/bin/bash
set cmdheight=1 " command bar height
set title " set terminal title
" Searching
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch " highlight search
set incsearch " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing macros
set magic " Set magic on, for regex
set showmatch " show matching braces
set mat=2 " how many tenths of a second to blink
" error bells
set noerrorbells
set visualbell
set t_vb=
set tm=500
" switch syntax highlighting on
syntax on
set encoding=utf8
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
" if you have italic supported font and terminal
highlight CursorLine term=bold cterm=bold ctermbg=darkblue
" base16
if filereadable(expand("~/.vimrc_background"))
  " let base16colorspace=256
  source ~/.vimrc_background
endif
" Setting italics must come after setting the colorscheme
highlight Comment cterm=italic
highlight htmlArg cterm=italic
set number " show line numbers
" set relativenumber " show relative line numbers, see leader z
set wrap "turn on line wrapping
set wrapmargin=8 " wrap lines when coming within n characters from side
set linebreak " set soft wrapping
set showbreak=… " show ellipsis at breaking
set autoindent " automatically set indent of new line
" paste toggle (yO, see unimpaired)
" set smartindent
filetype plugin indent on



function! ChompedSystem( ... )
    return substitute(call('system', a:000), '\n\+$', '', '')
endfunction

let g:python3_host_prog = ChompedSystem("which python")
let g:python_host_prog = globpath('~/anaconda3/envs/py27/bin', 'python')
let g:nvim_ipy_perform_mappings = 0
let g:silent_custom_command = 0
" toggle invisible characters
set invlist
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮  " col, unimpaire
" make the highlighting of tabs less annoying
highlight SpecialKey ctermbg=none
set showbreak=↪
" nerdtree
" close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=0
" show hidden files in NERDTree
let NERDTreeShowHidden=1
" remove some files by extension
let NERDTreeIgnore = ['\.js.map$']
" neomake
let g:neomake_javascript_jshint_maker = {
    \ 'args': ['--verbose'],
    \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
\ }
let g:neomake_typescript_tsc_maker = {
    \ 'args': ['-m', 'commonjs', '--noEmit' ],
    \ 'append_file': 0,
    \ 'errorformat':
        \ '%E%f %#(%l\,%c): error %m,' .
        \ '%E%f %#(%l\,%c): %m,' .
        \ '%Eerror %m,' .
        \ '%C%\s%\+%m'
\ }
" autocmd FileType javascript let g:neomake_javascript_enabled_makers = findfile('.jshintrc', '.;') != '' ? ['jshint'] : ['eslint']
" let g:neomake_javascript_enabled_makers = ['jshint', 'jscs']
" Find tags 
set tags+=doc/tags
set tags+=.git/tags
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*checkpoint.ipynb     " MacOSX/Linux
" airline
let g:airline_powerline_fonts=0
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='base16_atelierlakeside'
" don't hide quotes in json files
let g:vim_json_syntax_conceal = 0
let g:SuperTabCrMapping = 0
" gui
if (has("gui_running"))
    set guioptions=egmrt
    set background=light
    colorscheme solarized
    let g:airline_left_sep=''
    let g:airline_right_sep=''
    let g:airline_powerline_fonts=0
    let g:airline_theme='solarized'
endif


"""""""""""""""""""""
"""LEADER MAPPINGS"""
"""""""""""""""""""""
" find all commented leader mappings: /".*\_s.*<leader>
" ipy
" nnoremap <leader>c :call IPyRun('plt.close("all")',1)<cr>

" The default inline backend for jupyter console doesn't work with nvim-ipy, override with env var
" let $MPLBACKEND = "macosx"
" select whole block
nmap <leader>p {V}
" last tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()
" markdown to html
nmap <leader>md :%!markdown --html4tags <cr>
" remove extra whitespace
nmap <leader><space> :%s/\s\+$<cr>
" then wipes the last buffer. This retains split windows.
nmap <silent> <leader>c :Bclose<cr>
" shortcut to write
nmap <leader>w :w<cr>
" wipout buffr. bp selects previous (just needs to be different)
nmap <leader>q :q<cr>
" toggle paste mode:   unimpaired yo
" map <leader>v :set paste!<cr>
" edit ~/.config/nvim/init.vim
map <leader>ev :e! ~/.config/nvim/init.vim<cr>
" edit gitconfig
map <leader>eg :e! ~/.gitconfig<cr>
" edit zshrc
map <leader>ez :e! ~/.zshrc<cr>
" edit tmux
map <leader>et :e! ~/.tmux.conf<cr>
" edit aliases 
map <leader>ea :e! ~/.dotfiles/zsh/aliases.zsh<cr>
" edit snippets
map <leader>es :e! ~/.config/nvim/snippets/
" view tmux cheatsheet
map <leader>vt :e! ~/.tmux-cheatsheet.markdown<cr>
" toggle cursor line coc (unimpaired)
" Textmate style indentation
vmap <leader>[ <gv
" switch between current and last buffer
nmap <leader><leader> <c-^>
" search for word under the cursor
nnoremap <leader>s "fyiw :/<c-r>f<cr>
nmap <leader>o :Goyo<cr>
" rnu toggle (cor, unimpaired)
" number toggle (con, unimpaired)
" NERDTree
nmap <silent> <leader>n :NERDTreeToggle<cr>
" expand to the path of the file in the current buffer
nmap <silent> <leader>y :NERDTreeFind<cr>
" ack !=don't go to first file
nnoremap <Leader>a :Ack! <Space> 
nmap <leader>li :set list!<cr>
vmap <leader>] >gv
nmap <leader>[ <<
nmap <leader>] >>
" resize windows
nmap <up> :res +10<cr>
nmap <down> :res -10<cr>
nmap <left> :vertical :res -10<cr>
nmap <right> :vertical :res +10<cr>
" map <leader>wc :wincmd q<cr>
" custom highlighters: see functions section
" highlight interesting words
nnoremap <silent> <leader>1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>6 :call HiInterestingWord(6)<cr>
" fugitive
nmap <silent> <leader>gs :Gstatus<cr>
nmap <leader>ge :Gedit<cr>
nmap <silent><leader>gr :Gread<cr>
nmap <silent><leader>gb :Gblame<cr>
" markdown
nmap <leader>m :MarkedOpen!<cr>
nmap <leader>mq :MarkedQuit<cr>
" limelight
nmap <leader>f :Limelight!!<cr>
" map <leader>s :call SetCustomCommand()<cr>
" inoremap <tab> <c-r>=Smart_TabComplete()<CR>
" map <leader>r :call RunCustomCommand()<cr>
" clear all matches
nnoremap <leader>0 :call clearmatches()<cr>
" escape html
nnoremap <silent> <leader>u :call HtmlUnEscape()<cr>

"""""""""""""""
"""MAPPTINGS"""
"""""""""""""""
" remap esc
inoremap ;a <esc>
" Terminal
tnoremap <esc> <C-\><C-n>
" disable Ex mode
noremap Q <NOP>
" clear highlighted search (coh, unimpaired)
" activate spell-checking alternatives
nmap ;;s :set invspell spelllang=en<cr>
" ipython
imap <C-F> <Plug>(IPy-Complete)
" send line or selection
map ;s <Plug>(IPy-Run)
" send paragraph, the /. helps execute indented blocks
nmap ;d V}<Plug>(IPy-Run)}j
imap ;i <Plug>(IPy-WordObjInfo)
map ;i <Plug>(IPy-WordObjInfo)
nmap \i <Plug>(IPy-Interrupt)
" best way to restart is to close then send and reply 'yes' to prompt
map ;c <Plug>(IPy-Terminate)
nmap \s :set ts=4 sts=4 sw=4 et<cr>
" nmap <leader>w :setf textile<cr> :Goyo<cr>
nmap \t :set ts=4 sts=4 sw=4 noet<cr>
nnoremap <space> i<space><esc>
" latex
" write file, then compile. %=filename, %:r=root
" nnoremap \c :w<CR>:!rm *.aux *.blg *.bcf *.bbl *.run.xml; pdflatex %; biber %:r; pdflatex %; pdflatex %;<CR>
" view
" nnoremap \v :!open -a Preview %:r.pdf &<CR><CR>
" hi SpellBad ctermfg=015 ctermbg=000
" enable . command in visual mode
vnoremap . :normal .<cr>
map  <C-h> :call WinMove('h')<cr>
map  <C-j> :call WinMove('j')<cr>
map  <C-k> :call WinMove('k')<cr>
map  <C-l> :call WinMove('l')<cr>
" scroll the viewport faster
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>
" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$
" vim-commentary defaults: gc{motion} or gcc. gc is awkard for me.
nmap \ gc
" Typing <C-v><C-h> yields <BS> which is the emacs readline binding for <C-h>
" OSX includes wrong terminfo for xterm-256color see https://github.com/neovim/neovim/issues/2048 
" Likely due to programs ignoring the kbs description. A quick patch is:
" infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
" tic $TERM.ti
" However, this seems like overkill to change to whole terminal. Instead,
" if has('nvim')
"     nmap <BS> <C-W>h
" endif


"""""""""""""""
"""FUNCTIONS"""
"""""""""""""""

" The bang ! will suppress output when sourced.
" s: makes the function accessible within the vimrc, not outside

" thanks to @xolox on stackoverflow
function! s:Get_visual_selection()
    let [lnum1, col1] = getpos("'<")[1:2]
    let [lnum2, col2] = getpos("'>")[1:2]
    let lines = getline(lnum1, lnum2)
    let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][col1 - 1:]
    return join(lines, "\n")
endfunction

" Delete buffer while keeping window layout (don't close buffer's windows).
" Version 2008-11-18 from http://vim.wikia.com/wiki/VimTip165
if v:version < 700 || exists('loaded_bclose') || &cp
  finish
endif
let loaded_bclose = 1
if !exists('bclose_multiple')
  let bclose_multiple = 1
endif

" Display an error message.
function! s:Warn(msg)
  echohl ErrorMsg
  echomsg a:msg
  echohl NONE
endfunction

" Command ':Bclose' executes ':bd' to delete buffer in current window.
" The window will show the alternate buffer (Ctrl-^) if it exists,
" or the previous buffer (:bp), or a blank buffer if no previous.
" Command ':Bclose!' is the same, but executes ':bd!' (discard changes).
" An optional argument can specify which buffer to close (name or number).
function! s:Bclose(bang, buffer)
  if empty(a:buffer)
    let btarget = bufnr('%')
  elseif a:buffer =~ '^\d\+$'
    let btarget = bufnr(str2nr(a:buffer))
  else
    let btarget = bufnr(a:buffer)
  endif
  if btarget < 0
    call s:Warn('No matching buffer for '.a:buffer)
    return
  endif
  if empty(a:bang) && getbufvar(btarget, '&modified')
    call s:Warn('No write since last change for buffer '.btarget.' (use :Bclose!)')
    return
  endif
  " Numbers of windows that view target buffer which we will delete.
  let wnums = filter(range(1, winnr('$')), 'winbufnr(v:val) == btarget')
  if !g:bclose_multiple && len(wnums) > 1
    call s:Warn('Buffer is in multiple windows (use ":let bclose_multiple=1")')
    return
  endif
  let wcurrent = winnr()
  for w in wnums
    execute w.'wincmd w'
    let prevbuf = bufnr('#')
    if prevbuf > 0 && buflisted(prevbuf) && prevbuf != w
      buffer #
    else
      bprevious
    endif
    if btarget == bufnr('%')
      " Numbers of listed buffers which are not the target to be deleted.
      let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != btarget')
      " Listed, not target, and not displayed.
      let bhidden = filter(copy(blisted), 'bufwinnr(v:val) < 0')
      " Take the first buffer, if any (could be more intelligent).
      let bjump = (bhidden + blisted + [-1])[0]
      if bjump > 0
        execute 'buffer '.bjump
      else
        execute 'enew'.a:bang
      endif
    endif
  endfor
  execute 'bdelete'.a:bang.' '.btarget
  execute wcurrent.'wincmd w'
endfunction
command! -bang -complete=buffer -nargs=? Bclose call s:Bclose('<bang>', '<args>')

" Move barrier using resize commands
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction
"
" Window movement shortcuts
" move to the window in the direction shown, or create a new window
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

" recursively search up from dirname, sourcing all .vimrc.local files along the way
function! ApplyLocalSettings(dirname)
    " convert windows paths to unix style
    let l:curDir = substitute(a:dirname, '\\', '/', 'g')
    " walk to the top of the dir tree
    let l:parentDir = strpart(l:curDir, 0, strridx(l:curDir, '/'))
    if isdirectory(l:parentDir)
        call ApplyLocalSettings(l:parentDir)
    endif
    " now walk back down the path and source .vimsettings as you find them.
    " child directories can inherit from their parents
    let l:settingsFile = a:dirname . '/.vimrc.local'
    if filereadable(l:settingsFile)
        exec ':source' . l:settingsFile
    endif
endfunction
call ApplyLocalSettings(expand('.'))

" smart tab completion
function! Smart_TabComplete()
    let line = getline('.')                         " current line
    let substr = strpart(line, -1, col('.')+1)      " from the start of the current
    " line to one character right
    " of the cursor
    let substr = matchstr(substr, '[^ \t]*$')       " word till cursor
    if (strlen(substr)==0)                          " nothing to match on empty string
        return '\<tab>'
    endif
    let has_period = match(substr, '\.') != -1      " position of period, if any
    let has_slash = match(substr, '\/') != -1       " position of slash, if any
    if (!has_period && !has_slash)
        return '\<C-X>\<C-P>'                         " existing text matching
    elseif ( has_slash )
        return '\<C-X>\<C-F>'                         " file matching
    else
        return '\<C-X>\<C-O>'                         " plugin matching
    endif
endfunction

" execute a custom command
function! RunCustomCommand()
    up
    if g:silent_custom_command
        execute 'silent !' . s:customcommand
    else
        execute '!' . s:customcommand
    endif
endfunction

function! SetCustomCommand()
    let s:customcommand = input('Enter Custom Command$ ')
endfunction

function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195
function! HiInterestingWord(n)
    " Save our location.
    normal! mz
    " Yank the current word into the z register.
    normal! "zyiw
    " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
    let mid = 86750 + a:n
    " Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)
    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'
    " Actually match the words.
    call matchadd("InterestingWord" . a:n, pat, 1, mid)
    " Move back to our original location.
    normal! `z
endfunction

function! HtmlUnEscape()
  silent s/&lt;/</eg
  silent s/&gt;/>/eg
  silent s/&amp;/\&/eg
endfunction

