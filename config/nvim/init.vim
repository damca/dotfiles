" To find out more...
" :help plugins
" :scriptnames   show all scripts loaded in the current session.
"                generally follows: plugins, ftplugin, after/ftplugin, syntax, after/syntax
" If :help option doesn't take you where you want, e.g. :help tm, then you can try
" 1. :help <anything>, then :tag /<thing> and cycle with :tn, :tp, OR :tselect /<thing>
" 2. For options, consulting :help option-list can be useful.
" The bang ! will suppress output when sourced.
" s: makes the function accessible within the vimrc, not outside

" functions# (see functions.vim in nvim/autoload
call plug#begin('~/.config/nvim/plugged')
" Plug 'independent' | Plug 'dependent'

" General
    set nocompatible " not compatible with vi
    " Abbreviations
    abbr funciton function
    abbr teh the
    abbr tempalte template
    abbr fitler filter

    " set a map leader for more key combos
    " find all commented leader mappings: /".*\_s.*<leader>
    let g:mapleader = " "

    " get currently active python 3
    let g:python3_host_prog = functions#ChompedSystem("which python3")
    " get python 2
    let g:python_host_prog = functions#ChompedSystem("which python2")

    " R markdown
    " Plug 'vim-pandoc/vim-pandoc'
    " Plug 'vim-pandoc/vim-pandoc-syntax'
    " Plug 'vim-pandoc/vim-rmarkdown'

    " git
    Plug 'tpope/vim-fugitive' " amazing git wrapper for vim
    Plug 'tpope/vim-rhubarb'
    nmap <silent> <leader>gs :Gstatus<cr>
    nmap <leader>ge :Gedit<cr>
    nmap <silent><leader>gr :Gread<cr>
    nmap <silent><leader>gb :Gblame<cr>

    " code linting
    Plug 'scrooloose/syntastic' 
    set statusline+=%#warningmsg#
    set statusline+=%*
    set statusline+=%{SyntasticStatuslineFlag()}

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_python_python_exec = 'python3'
    let g:syntastic_python_checkers = ['python3']

    " tags
    " within ~/tags for a particular conda env
       " ctags -R -f envtags /path/to/env --python-kinds=-i
       " -f option must preceed directory
    " need to use let &option for string output, also '~/tags/' is not interpreted, need $HOME
    if !empty($VIRTUAL_ENV)
        let &tags=$VIRTUAL_ENV . "/tags"
    endif
    set tags+=./tags;$HOME  " semicolon looks 'up to' $HOME.
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*checkpoint.ipynb  " MacOSX/Linux

    " code folding settings
    set foldmethod=syntax " fold based on indent
    set foldnestmax=10 " deepest fold is 10 levels
    set nofoldenable " don't fold by default
    set foldlevel=1
    set so=7 " set 7 lines to the cursors - when moving vertical

    " Misc
    set autoread " If edited outside of vim, update changes. Can also do :e!
    set wildmenu " enhanced command line completion
    set hidden " current buffer can be put into background
    set showcmd " show incomplete commands
    set wildmode=list:longest " complete files like a shell
    set magic " Set magic on, for regex
    set noerrorbells
    set visualbell
    set tm=500  " timeout time in milliseconds
    set encoding=UTF-8

    " Searching
    " search for word under the cursor
    nnoremap <leader>s "fyiw :/<c-r>f<cr>
    Plug '/usr/bin/fzf'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    nmap <silent> <leader>r :Buffers<cr>
    nmap <silent> <leader>e :FZF<cr>
    nmap <leader><tab> <plug>(fzf-maps-n)
    xmap <leader><tab> <plug>(fzf-maps-x)
    omap <leader><tab> <plug>(fzf-maps-o)
    " Insert mode completion
    imap <c-x><c-k> <plug>(fzf-complete-word)
    imap <c-x><c-f> <plug>(fzf-complete-path)
    imap <c-x><c-j> <plug>(fzf-complete-file-ag)
    imap <c-x><c-l> <plug>(fzf-complete-line)

    command! FZFMru call fzf#run({
    \  'source':  v:oldfiles,
    \  'sink':    'e',
    \  'options': '-m -x +s',
    \  'down':    '40%'})

    command! -bang -nargs=* Find call fzf#vim#grep(
        \ 'rg --column --line-number --no-heading --follow --color=always '.<q-args>, 1,
        \ <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)

    set ignorecase " case insensitive searching
    set smartcase " case-sensitive if expresson contains a capital letter
    set hlsearch " highlight search
    set incsearch " set incremental search, like modern browsers
    set cursorline  " toggle with coc (see Plug unimpaired)

    " Terminal settings
    set title " set terminal title
    " let &shell=functions#ChompedSystem("which zsh")  " way to use variables or output to set options
    set shell=$SHELL
    hi! TermCursorNC ctermfg=15 guifg=#fdf6e3 ctermbg=14 guibg=#93a1a1 cterm=NONE gui=NONE
    tnoremap <Esc> <C-\><C-n>
    if has('nvim')
          tnoremap <expr> <A-r> '<Esc>"'.nr2char(getchar()).'pi'
    endif

    " Backups
    " set backup
    set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp  "temp files
    set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp  "swap files
    set laststatus=2 " show the satus line all the time
    if has('mouse')
        set mouse=a  " n: normal, v:visual, etc., a:all
        " set ttymouse=xterm2
    endif
    set clipboard=unnamed
    " faster redrawing
    set ttyfast
    set diffopt+=vertical

" Appearance
    let g:silent_custom_command = 0
    set invlist " toggle invisible characters
    set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮  " col, unimpaire
    let &showbreak='..'
    " autocmd FileType javascript let g:neomake_javascript_enabled_makers = findfile('.jshintrc', '.;') != '' ? ['jshint'] : ['eslint']
    " let g:neomake_javascript_enabled_makers = ['jshint', 'jscs']
    set showmatch " show matching braces
    set noshowmode " don't show which mode disabled for PowerLine
    set mat=2 " how many tenths of a second to blink
    set scrolloff=3 " lines of text around cursor
    set cmdheight=1 " command bar height
    set nolazyredraw " don't redraw while executing macros
    set number " show line numbers
    " set relativenumber " show relative line numbers, see leader z
    set wrap "turn on line wrapping
    " set wrapmargin=8 " wrap lines when coming within n characters from side
    set linebreak " set soft wrapping
    set splitright " default right with :vnew
    set backspace=indent,eol,start " make backspace behave in a sane manner
    set history=1000 " change history to 1000
    set textwidth=0
    " paste toggle (yO, see unimpaired)
    " Indent control
    set autoindent " keep indent from previous line
    " set smartindent
    filetype plugin indent on " this turns on 'filetype' detection, loading 'plugin' files for the ft, loading 'indent' files
    " Tab control
    set expandtab " insert tabs rather than spaces for <Tab>
    set smarttab " tab respects /tabstop', 'shiftwidth', and 'softtabstop'
    set tabstop=4 " the visible width of tabs
    set softtabstop=4 " edit as if the tabs are 4 characters wide
    set shiftwidth=4 " number of spaces to use for indent and unindent
    " set shiftround " round indent to a multiple of 'shiftwidth'

    set completeopt+=longest  "only insert the longest common text for completion
    set encoding=utf8

    " Colors, load plug here, set colorscheme outside Plug
    Plug 'chriskempson/base16-vim'

" General Mappings
    Plug 'tpope/vim-unimpaired' " READ which are simply short normal mode aliases for commonly used ex commands
    " select whole block
    nmap <leader>p {V}
    " last tab
    let g:lasttab = 1
    nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
    au TabLeave * let g:lasttab = tabpagenr()
    " remove extra whitespace
    nmap <leader>d :%s/\s\+$<cr>
    " then wipes the last buffer. This retains split windows.
    " defined in autoload/functions.vim
    nnoremap <silent> <leader>c :Bclose<CR>
    " shortcut to write
    nmap <leader>w :w<cr>
    " wipout buffr. bp selects previous (just needs to be different)
    nmap <leader>q :q<cr>
    " toggle paste mode:   unimpaired yo
    " map <leader>v :set paste!<cr>

    " Quick edits
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

    " Qucik views
    map <leader>vt :e! ~/.tmux-cheatsheet.markdown<cr>

    map  <C-h> :call functions#WinMove('h')<cr>
    map  <C-j> :call functions#WinMove('j')<cr>
    map  <C-k> :call functions#WinMove('k')<cr>
    map  <C-l> :call functions#WinMove('l')<cr>
    " scroll the viewport faster
    nnoremap <C-e> 5<C-e>
    nnoremap <C-y> 5<C-y>
    " moving up and down work as you would expect
    nnoremap <silent> j gj
    nnoremap <silent> k gk
    nnoremap <silent> ^ g^
    nnoremap <silent> $ g$

    " switch between current and last buffer
    nmap <leader><leader> <c-^>
    nmap <leader>o :Goyo<cr>
    " rnu toggle (cor, unimpaired)
    " number toggle (con, unimpaired)
    " ack !=don't go to first file
    nnoremap <Leader>a :Ack! <Space> 
    nmap <leader>li :set list!<cr>

    " resize windows
    nmap <up> :res +5<cr>
    nmap <down> :res -5<cr>
    nmap <left> :vertical :res -5<cr>
    nmap <right> :vertical :res +5<cr>
    " find highlighting group under cursor
    map <leader>( :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
        \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
        \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
    " clear all matches
    nnoremap <leader>0 :call functions#clearmatches()<cr>
    " escape html
    nnoremap <silent> <leader>u :call functions#HtmlUnEscape()<cr>
    " remap esc
    inoremap ;a <esc>
    " Terminal
    tnoremap <C-w> <C-\><C-n>
    " disable Ex mode
    noremap Q <NOP>
    " clear highlighted search (coh, unimpaired)
    " activate spell-checking alternatives
    nmap \s :set ts=4 sts=4 sw=4 et<cr>
    " nmap <leader>w :setf textile<cr> :Goyo<cr>
    nmap \t :set ts=4 sts=4 sw=4 noet<cr>
    nnoremap <space> i<space><esc>
    " latex
    " write file, then compile. %=filename, %:r=root
    nnoremap \c :w<CR>:!rm *.aux *.blg *.bcf *.bbl *.run.xml; pdflatex %; biber %:r; pdflatex %; pdflatex %; open %:r.pdf<CR>
    " view
    " nnoremap \v :!open -a Preview %:r.pdf &<CR><CR>
    " Typing <C-v><C-h> yields <BS> which is the emacs readline binding for <C-h>
    " Likely due to programs ignoring the kbs description. A quick patch is:
    " infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
    " tic $TERM.ti
    " However, this seems like overkill to change to whole terminal. Instead,
    " if has('nvim')
    "     nmap <BS> <C-W>h
    " endif

    " AutoGroups
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
        " autocmd FileType python setlocal sw=4 expandtab tags+=/usr/local/lib/python3.7/tags
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
        autocmd BufNewFile,BufRead *.tex set filetype=tex
        " make quickfix windows take all the lower section of the screen
        " when there are multiple windows open
        autocmd FileType qf wincmd J
        autocmd BufNewFile,BufReadPost *.md set filetype=markdown
        let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'json=javascript', 'stylus', 'html']
        " autocmd! BufEnter * call ApplyLocalSettings(expand('<afile>:p:h'))
        autocmd BufNewFile,BufRead,BufWrite *.md syntax match Comment /\%^---\_.\{-}---$/
        " autocmd! BufWritePost * Neomake
    augroup END

" General functionality
    Plug 'tpope/vim-repeat' " enables repeating other supported plugins with the . command
    vnoremap . :normal .<cr>
    " Plug 'jiangmiao/auto-pairs' " automatic closing of quotes, parenthesis, brackets, etc.
    Plug 'tpope/vim-commentary' " comment stuff out, gcc: line, gc: selection
    Plug 'tpope/vim-ragtag' " endings for html, xml, etc. - ehances surround
    Plug 'tpope/vim-surround' " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
    Plug 'tpope/vim-characterize'  " ga to characterize unicode characters
    Plug 'garbas/vim-snipmate' " snippet manager
    Plug 'MarcWeber/vim-addon-mw-utils'  " needed for snipmate
    Plug 'tomtom/tlib_vim'  " needed for snipmate
    Plug 'editorconfig/editorconfig-vim' " .editorconfig support
    " Plug 'tpope/vim-dispatch' " asynchronous build and test dispatcher
    Plug 'AndrewRadev/splitjoin.vim' " single/multi line code handler: gS - split one line into multiple, gJ - combine multiple lines into one
    Plug 'vim-scripts/matchit.zip' " extended % matching
    " Plug 'tpope/vim-sleuth' " detect indent style (tabs vs. spaces)
    Plug 'darfink/vim-plist' " Support plist. 

    " Writing in vim
    Plug 'sickill/vim-pasta' " context-aware pasting
    Plug 'junegunn/goyo.vim', { 'on': 'Goyo' } " distraction-free writing
    Plug 'junegunn/limelight.vim', { 'on': 'Limelight' } " focus tool. Good for presentating with vim

" language-specific plugins
    " html
    " Plug 'mattn/emmet-vim', { 'for': 'html' } " emmet support for vim - easily create markdup wth CSS-like syntax
    " Plug 'gregsexton/MatchTag', { 'for': 'html' } " match tags in html, similar to paren support
    " Plug 'othree/html5.vim', { 'for': 'html' } " html5 support

    " javascript
    Plug 'pangloss/vim-javascript', { 'for': 'javascript' } " JavaScript support
    " Plug 'gavocanov/vim-js-indent', { 'for': 'javascript' } " JavaScript indent support
    Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' } " ES6 and beyond syntax
    Plug 'moll/vim-node', { 'for': 'javascript' } " node support
    Plug 'mxw/vim-jsx', { 'for': 'jsx' } " JSX support
    Plug 'elzr/vim-json', { 'for': 'json' } " JSON support

    " instead use NVIM's terminal,  :vsplit | terminal
    " IPython
    nmap ;ii :vsplit \| terminal<CR>aipython --no-autoindent<CR><C-\><C-n><C-h>
    nmap ;d :let @i=''<CR>V}"iy:call functions#AddIPy()<CR><C-l>"jpa<CR><C-\><C-n><C-h>:let @i=''<CR>}
    nmap ;s yy<C-l>pa<CR><C-\><C-n><C-h>
    vmap ;s "iy:call functions#AddIPy()<CR><C-l>"jpa<CR><C-\><C-n><C-h>:let @i=''<CR>


    " markdown
    Plug 'tpope/vim-markdown', { 'for': 'markdown' } " markdown support
    Plug 'itspriddle/vim-marked', { 'for': 'markdown', 'on': 'MarkedOpen' } " Open markdown files in Marked.app - mapped to <leader>m
    nmap <leader>md :%!markdown --html4tags <cr>
    " view markdown example
    map <leader>em :e! ~/Documents/code/markdown_template.md
    nmap <leader>m :MarkedOpen!<cr>
    nmap <leader>mq :MarkedQuit<cr>

    " other language support
    Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] } " markdown support
    Plug 'groenewege/vim-less', { 'for': 'less' } " less support
    Plug 'ap/vim-css-color', { 'for': ['css','stylus','scss'] } " set the background of hex color values to the color
    Plug 'hail2u/vim-css3-syntax', { 'for': 'css' } " CSS3 syntax support
    Plug 'fatih/vim-go', { 'for': 'go' } " go support
    Plug 'timcharper/textile.vim', { 'for': 'textile' } " textile support
    Plug 'Shougo/vimproc.vim', { 'do': 'make' } " interactive command execution in vim
    Plug 'leafgarland/typescript-vim', { 'for': 'typescript' } " typescript support
    " Plug 'mustache/vim-mustache-handlebars' " mustach support


call plug#end()

" Use base16-shell
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
    source ~/.vimrc_background
endif

syntax on
filetype plugin indent on
" make the highlighting of tabs and other non-text less annoying
highlight SpecialKey ctermfg=236
highlight NonText ctermfg=236
" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
" switch syntax highlighting on
syntax on
" highlights after syntax=on to avoid options resetting
" make the highlighting of tabs less annoying
highlight SpecialKey ctermbg=none
highlight NonText ctermbg=none
" make comments and HTML attributes italic
highlight Comment cterm=italic
highlight htmlArg cterm=italic
highlight xmlAttrib cterm=italic
highlight Type cterm=italic
highlight Normal ctermbg=none
" hi SpellBad ctermfg=015 ctermbg=000
" vim struggles to highlight vimscript correctly, Especially line continuations.
let g:vimsyn_noerror = 1  " see help


""""
"""" GRAVEYARD
""""

" get currently active python 3
" let g:python3_host_prog = functions#ChompedSystem("which python3")
" get python 2
" let g:python_host_prog = functions#ChompedSystem("which python2")

" R markdown


" tags
" within ~/tags for a particular conda env
   " ctags -R -f envtags /path/to/env --python-kinds=-i
   " -f option must preceed directory
" need to use let &option for string output, also '~/tags/' is not interpreted, need $HOME
if !empty($VIRTUAL_ENV)
    let &tags=$VIRTUAL_ENV . "/tags"
endif
set tags+=./tags;$HOME  " semicolon looks 'up to' $HOME.

" Airline
" let g:airline_powerline_fonts=0
" let g:airline_left_sep=''
" let g:airline_right_sep=''
" " don't hide quotes in json files
" let g:vim_json_syntax_conceal = 0
" let g:SuperTabCrMapping = 0
" " let g:airline_theme='sol'  " automatically picks up base16 color scheme
" let g:airline#extensions#tabline#show_splits = 0
" let g:airline#extensions#whitespace#enabled = 0
" " enable airline tabline
" let g:airline#extensions#tabline#enabled = 1
" " only show tabline if tabs are being used (more than 1 tab open)
" let g:airline#extensions#tabline#tab_min_count = 2
" " do not show open buffers in tabline
" let g:airline#extensions#tabline#show_buffers = 0
" " gui
" if has("gui_running") || has("gui_vimr")
"     " set guioptions=egmrt
"     " set background=light
"     colorscheme solarized
"     " let g:airline_left_sep=''
"     " let g:airline_right_sep=''
"     " let g:airline_powerline_fonts=0
"     " let g:airline_theme='solarized'
" endif

" code linting
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_python_python_exec = 'python'
" let g:syntastic_python_checkers = ['python']

