" .vimrc
" Author: Philip Thrasher
" Source: https://github.com/pthrasher/thrash/blob/master/home/.vimrc
"
" Email or tweet with any questions. Glad to answer.

" Vundle Bootloader {{{
  set nocompatible               " be iMproved
  filetype off                   " required!

  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()

  " let Vundle manage Vundle
  " required!
  Bundle 'gmarik/vundle'
"}}}

" Vundles {{{

  " Dependencies
  " Bundle 'L9'
  Bundle 'mileszs/ack.vim'

  " Colors
  Bundle 'flazz/vim-colorschemes'

  " Generic editing
  Bundle 'tpope/vim-repeat'
  Bundle 'tpope/vim-fugitive'
  Bundle 'tpope/vim-abolish'
  Bundle 'tpope/vim-commentary'
  Bundle 'tpope/vim-endwise'
  Bundle 'tpope/vim-surround'
  Bundle 'tpope/vim-git'

  Bundle 'scrooloose/syntastic'
  Bundle 'scrooloose/snipmate-snippets'

  Bundle 'kien/ctrlp.vim'
  Bundle 'Shougo/neocomplcache.git'
  Bundle 'Lokaltog/vim-powerline'
  " Bundle 'ervandew/supertab'
  Bundle 'Raimondi/delimitMate'
  Bundle 'AndrewRadev/linediff.vim'
  Bundle 'scratch.vim'
  Bundle 'Align'
  Bundle 'Conque-Shell'
  Bundle 'ZoomWin'
  " possible use this in the future...
  " Bundle 'sjbach/lusty'

  Bundle 'sjl/strftimedammit.vim'
  Bundle 'sjl/gundo.vim'

  " Cross compiled scripts
  Bundle 'tpope/vim-liquid'
  Bundle 'tpope/vim-markdown'
  Bundle 'groenewege/vim-less'

  " Javascript
  Bundle 'leshill/vim-json'
  Bundle 'pangloss/vim-javascript'

  " Python
  Bundle 'vim-scripts/python.vim'
  Bundle 'klen/python-mode.git'
  Bundle 'michaeljsmith/vim-indent-object'

  " PHP
  Bundle 'spf13/PIV'

  " HTML
  Bundle 'zeekay/vim-autoclose'
  Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}

  " CSS
  Bundle 'ChrisYip/Better-CSS-Syntax-for-Vim'


  filetype plugin indent on
"}}}

" Misc {{{

  " Tab stuff
  set tabstop=2
  set shiftwidth=2
  set softtabstop=2
  set expandtab
  set autoindent
  set smartindent
  set smarttab

  set encoding=utf-8
  set backspace=indent,eol,start
  set textwidth=80
  set colorcolumn=+1

  " Text formatting options
  set formatoptions+=qorn1
  set modelines=0
  set ruler

  set showmode
  set showcmd
  set hidden
  set visualbell
  set cursorline
  set ttyfast
  set number
  set relativenumber
  set laststatus=2
  set history=1000
  set undofile
  set undoreload=10000
  set list
  set listchars=tab:\ ▸,trail:⌴
  set shell=/bin/bash

  set showmatch
  set matchtime=3

  set splitbelow
  set splitright
  set fillchars=diff:⣿,vert:│

  set timeoutlen=500

  set shiftround
  set title

  set dictionary=/usr/share/dict/words

  set autowrite
  set autoread

  " cpoptions :help cpoptions
  set cpoptions=aABceFs

  " Make Vim able to edit crontab files again.
  set backupskip=/tmp/*,/private/tmp/*"

  " save on focus lost
  au FocusLost * :silent! wa

  " Resize splits when the window is resized
  au VimResized * :wincmd =


"}}}

" Wildmenu stuff {{{
  set wildmenu
  set wildmode=list:longest

  set wildignore+=.hg,.git,.svn                    " Version control
  set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
  set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
  set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
  set wildignore+=*.spl                            " compiled spelling word lists
  set wildignore+=*.sw?                            " Vim swap files
  set wildignore+=*.DS_Store                       " OSX bullshit

  set wildignore+=migrations                       " Django migrations
  set wildignore+=*.pyc                            " Python byte code
"}}}

" Line Return {{{

" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
  augroup line_return
    au!
    au BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \     execute 'normal! g`"zvzz' |
      \ endif
  augroup END

" }}}

" Backups {{{

  set undodir=~/.vim/undo//         " undo files
  " set backupdir=~/.vim/tmp/backup// " backups
  " set directory=~/.vim/tmp/swap//   " swap files
  set nobackup                      " no need for backups -- we have vcs
  set nowb
  set noswapfile                    " It's 2012, Vim.

" }}}

" Leader {{{

  let mapleader = ","
  let maplocalleader = "\\"

" }}}

" Color scheme {{{

  syntax on
  set background=dark
  colorscheme mustang

  " Highlight VCS conflict markers
  match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" }}}

" Searching and moving {{{

  " Use sane regexes.
  nnoremap / /\v
  vnoremap / /\v

  set ignorecase
  set smartcase
  set incsearch
  set showmatch
  set hlsearch
  set gdefault

  set scrolloff=8
  set sidescroll=1
  set sidescrolloff=10

  set virtualedit+=block

  noremap <leader><space> :noh<cr>:call clearmatches()<cr>

  " Highlight all occurances of the word under the cursor without changing
  " cursor position.
  nnoremap <leader>h *<C-O>

  "quick buffer switching
  nnoremap <leader><leader> <c-^>

  " Made D behave
  nnoremap D d$

  " Keep search matches in the middle of the window and pulse the line when moving
  " to them.
  nnoremap n nzzzv
  nnoremap N Nzzzv

  " Don't move on *
  nnoremap * *<c-o>

  " Same when jumping around
  nnoremap g; g;zz
  nnoremap g, g,zz

  " Window resizing
  nnoremap <c-left> 5<c-w>>
  nnoremap <c-right> 5<c-w><

  " Easier to type, and I never use the default behavior.
  noremap H ^
  noremap L g_

  " Quickly jump to beg or end in insert mode
  inoremap <c-a> <esc>I
  inoremap <c-e> <esc>A

  " Open a Quickfix window for the last search.
  nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

  " Ack for the last search.
  nnoremap <silent> <leader>? :execute "Ack! '" . substitute(substitute(substitute(@/, "\\\\<", "\\\\b", ""), "\\\\>", "\\\\b", ""), "\\\\v", "", "") . "'"<CR>

  " Fix linewise visual selection of various text objects
  nnoremap VV V
  nnoremap Vit vitVkoj
  nnoremap Vat vatV
  nnoremap Vab vabV
  nnoremap VaB vaBV

"}}}

" Error navigation {{{
  "
  "             Location List     QuickFix Window
  "            (e.g. Syntastic)     (e.g. Ack)
  "            ----------------------------------
  " Next      |     M-j               M-Down     |
  " Previous  |     M-k                M-Up      |
  "            ----------------------------------
  "
  nnoremap ∆ :lnext<cr>zvzz
  nnoremap ˚ :lprevious<cr>zvzz
  inoremap ∆ <esc>:lnext<cr>zvzz
  inoremap ˚ <esc>:lprevious<cr>zvzz
  nnoremap <m-Down> :cnext<cr>zvzz
  nnoremap <m-Up> :cprevious<cr>zvzz

"}}}

" Directional Keys {{{

  " It's 2011.
  noremap j gj
  noremap k gk

  " Easy buffer navigation
  noremap <C-h>  <C-w>h
  noremap <C-j>  <C-w>j
  noremap <C-k>  <C-w>k
  noremap <C-l>  <C-w>l
  noremap <leader>v <C-w>v

"}}}

" Folding {{{

  set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo
  set foldlevelstart=0

  " Make the current location sane.
  nnoremap <c-cr> zvzt

  " Space to toggle folds.
  nnoremap <Space> za
  vnoremap <Space> za

  " Make zO recursively open whatever top level fold we're in, no matter where the
  " cursor happens to be.
  nnoremap zO zCzO

  " Use ,z to "focus" the current fold.
  nnoremap <leader>z zMzvzz

  " Set a nicer foldtext function
  function! MyFoldText()
    let line = getline(v:foldstart)
    if match( line, '^[ \t]*\(\/\*\|\/\/\)[*/\\]*[ \t]*$' ) == 0
      let initial = substitute( line, '^\([ \t]\)*\(\/\*\|\/\/\)\(.*\)', '\1\2', '' )
      let linenum = v:foldstart + 1
      while linenum < v:foldend
        let line = getline( linenum )
        let comment_content = substitute( line, '^\([ \t\/\*]*\)\(.*\)$', '\2', 'g' )
        if comment_content != ''
          break
        endif
        let linenum = linenum + 1
      endwhile
      let sub = initial . ' ' . comment_content
    else
      let sub = line
      let startbrace = substitute( line, '^.*{[ \t]*$', '{', 'g')
      if startbrace == '{'
        let line = getline(v:foldend)
        let endbrace = substitute( line, '^[ \t]*}\(.*\)$', '}', 'g')
        if endbrace == '}'
          let sub = sub.substitute( line, '^[ \t]*}\(.*\)$', '...}\1', 'g')
        endif
      endif
    endif
    let n = v:foldend - v:foldstart + 1
    let info = " " . n . " lines"
    let sub = sub . "                                                                                                              "
    let num_w = getwinvar( 0, '&number' ) * getwinvar( 0, '&numberwidth' )
    let fold_w = getwinvar( 0, '&foldcolumn' )
    let sub = strpart( sub, 0, winwidth(0) - strlen( info ) - num_w - fold_w - 5 )
    return sub . info
  endfunction
  set foldtext=MyFoldText()

" }}}

" Powerline {{{

  let g:Powerline_symbols = 'fancy'

" }}}

" GUI {{{



  if has('gui_running')
    " Not sure if this one has all the right glyphs
    " set guifont=Ubuntu\ Regular\ for\ Powerline:h14
    set guifont=Menlo\ for\ Powerline:h12

    set transparency=3
    " Remove all the UI cruft
    set go-=T
    set go-=l
    set go-=L
    set go-=r
    set go-=R

    highlight SpellBad term=underline gui=undercurl guisp=Orange

    " Use a line-drawing char for pretty vertical splits.

    " Different cursors for different modes.
    "highlight iCursor guifg=white guibg=black
    "set guicursor=n-c:block-Cursor-blinkon0
    "set guicursor+=v:block-vCursor-blinkon0
    "set guicursor+=i-ci:ver20-iCursor

    if has("gui_macvim")
      " Color column should be a sane color.
      highlight ColorColumn guibg=#666666

      " Full screen means FULL screen
      set fuoptions=maxvert,maxhorz

      " Use the normal HIG movements, except for M-Up/Down
      let macvim_skip_cmd_opt_movement = 1
      no   <D-Left>       <Home>
      no!  <D-Left>       <Home>
      no   <M-Left>       <C-Left>
      no!  <M-Left>       <C-Left>

      no   <D-Right>      <End>
      no!  <D-Right>      <End>
      no   <M-Right>      <C-Right>
      no!  <M-Right>      <C-Right>

      no   <D-Up>         <C-Home>
      ino  <D-Up>         <C-Home>
      imap <M-Up>         <C-o>{

      no   <D-Down>       <C-End>
      ino  <D-Down>       <C-End>
      imap <M-Down>       <C-o>}

      imap <M-BS>         <C-w>
      inoremap <D-BS>     <esc>my0c`y
    else
      " Non-MacVim GUI, like Gvim
    end
  else
    " Console Vim
  endif
"}}}

" Convenience mappings {{{

  "ios style periods
  imap <Space><Space> .

  " yank line without $
  nnoremap ,y ^yg_"_dd

  " Clean trailing whitespace
  nnoremap <leader>w :%s/\s\+$//<cr>:let @/=''<cr>

  " Send visual selection to gist.github.com as a private, filetyped Gist
  " Requires the gist command line too (brew install gist)
  vnoremap <leader>G :w !gist -p -t %:e \| pbcopy<cr>
  vnoremap <leader>UG :w !gist -p \| pbcopy<cr>

  " Change case
  nnoremap <C-U> gUiw
  inoremap <C-U> <esc>gUiwea
  nnoremap <C-u> guiw
  inoremap <C-u> <esc>guiwea

  " Substitute
  nnoremap <leader>s :%s//<left>

  " Emacs bindings in command line mode
  cnoremap <c-a> <home>
  cnoremap <c-e> <end>

  " Diffoff
  nnoremap <leader>D :diffoff!<cr>

  " Formatting, TextMate-style
  nnoremap Q gqip
  vnoremap Q gq

  " Easier linewise reselection
  nnoremap <leader>V V`]

  " S to split
  " The normal use of S is covered by cc, so don't worry about shadowing it.
  " Basically this splits the current line into two new ones at the cursor position,
  " then joins the second one with whatever comes next.
  "
  " Example:                      Cursor Here
  "                                    |
  "                                    V
  " foo = ('hello', 'world', 'a', 'b', 'c',
  "        'd', 'e')
  "
  " becomes
  "
  " foo = ('hello', 'world', 'a', 'b',
  "        'c', 'd', 'e')
  "
  " Especially useful for adding items in the middle of long lists/tuples in Python
  " while maintaining a sane text width.
  nnoremap S <nop>
  nnoremap S h/[^ ]<cr>"zd$jyyP^v$h"zpJk:s/\v +$//<cr>:noh<cr>j^

  " Acking current word under cursor
  map <Leader>f :execute "Ack " . expand("<cword>") <Bar> cw<CR>

  " Align text
  nnoremap <leader>Al :left<cr>
  nnoremap <leader>Ac :center<cr>
  nnoremap <leader>Ar :right<cr>
  vnoremap <leader>Al :left<cr>
  vnoremap <leader>Ac :center<cr>
  vnoremap <leader>Ar :right<cr>

  " Less chording
  nnoremap ; :
  vnoremap ; :
  inoremap jf <esc>

  " Cmdheight switching
  nnoremap <leader>1 :set cmdheight=1<cr>
  nnoremap <leader>2 :set cmdheight=2<cr>

  " send to preview as pdf
  nnoremap <D-p> "_ddPV`]=

  " Marks and Quotes
  noremap ' `

  " Select (charwise) the contents of the current line, excluding indentation.
  " Great for pasting Python lines into REPLs.
  nnoremap vv ^vg_

  " Calculator
  inoremap <C-B> <C-O>yiW<End>=<C-R>=<C-R>0<CR>

  " create new vert split, and switch to new buff
  nnoremap <leader>W <C-w>v<C-w>l

  " bindings for easy split nav
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l

  " Opens an edit command with the path of the currently edited file filled in
  " Normal mode: <Leader>e
  map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

  " Yank from here till end of line.
  nnoremap Y y$

  " Better Completion
  set completeopt=longest,menuone,preview

  " Sudo to write
  cnoremap w!! w !sudo tee % >/dev/null
"}}}

" Align {{{

  vnoremap <leader>a :Align =<cr>

"}}}

" Linediff {{{

  vnoremap <leader>l :Linediff<cr>
  nnoremap <leader>L :LinediffReset<cr>

"}}}

" Supertab {{{

  let g:SuperTabDefaultCompletionType = "<c-n>"
  let g:SuperTabLongestHighlight = 1

"}}}

" Syntastic {{{

  let g:syntastic_enable_signs = 1
  let g:syntastic_disabled_filetypes = ['html']
  let g:syntastic_stl_format = '[%E{%e Errors}%B{, }%W{%w Warnings}]'
  let g:syntastic_jsl_conf = '$HOME/.vim/jsl.conf'

"}}}

" Abbreviations {{{

  function! EatChar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
  endfunction

  function! MakeSpacelessIabbrev(from, to)
      execute "iabbrev <silent> ".a:from." ".a:to."<C-R>=EatChar('\\s')<CR>"
  endfunction

  call MakeSpacelessIabbrev('pt/',  'http://philipthrasher.com/')
  call MakeSpacelessIabbrev('gh/',  'http://github.com/')
  call MakeSpacelessIabbrev('ghp/', 'http://github.com/pthrasher/')

  iabbrev ldis ಠ_ಠ

  iabbrev pt@ philipthrasher@gmail.com

  " Yes... I do this. ;-)
  " execute "Abolish pythong python"

"}}}

" C {{{

  augroup ft_c
    au!
    au FileType c setlocal foldmethod=syntax
  augroup END

" }}}

" CSS and LessCSS {{{

  augroup ft_css
    au!

    au BufNewFile,BufRead *.less setlocal filetype=less

    au Filetype less,css setlocal foldmethod=marker
    au Filetype less,css setlocal foldmarker={,}
    au Filetype less,css setlocal omnifunc=csscomplete#CompleteCSS
    au Filetype less,css setlocal iskeyword+=-

    " Use <leader>S to sort properties.  Turns this:
    "
    "     p {
    "         width: 200px;
    "         height: 100px;
    "         background: red;
    "
    "         ...
    "     }
    "
    " into this:

    "     p {
    "         background: red;
    "         height: 100px;
    "         width: 200px;
    "
    "         ...
    "     }
    au BufNewFile,BufRead *.less,*.css nnoremap <buffer> <localleader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>

    " Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
    " positioned inside of them AND the following code doesn't get unfolded.
    au BufNewFile,BufRead *.less,*.css inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>
  augroup END

" }}}

" Django {{{

  augroup ft_django
    au!

    au BufNewFile,BufRead urls.py           setlocal nowrap
    au BufNewFile,BufRead urls.py           normal! zR
    au BufNewFile,BufRead dashboard.py      normal! zR
    au BufNewFile,BufRead local_settings.py normal! zR

    au BufNewFile,BufRead admin.py     setlocal filetype=python.django
    au BufNewFile,BufRead urls.py      setlocal filetype=python.django
    au BufNewFile,BufRead models.py    setlocal filetype=python.django
    au BufNewFile,BufRead views.py     setlocal filetype=python.django
    au BufNewFile,BufRead settings.py  setlocal filetype=python.django
    au BufNewFile,BufRead settings.py  setlocal foldmethod=marker
    au BufNewFile,BufRead forms.py     setlocal filetype=python.django
    au BufNewFile,BufRead common_settings.py  setlocal filetype=python.django
    au BufNewFile,BufRead common_settings.py  setlocal foldmethod=marker
  augroup END

"}}}

" HTML and HTMLDjango {{{

  augroup ft_html
    au!

    au BufNewFile,BufRead *.html setlocal filetype=htmldjango
    au FileType html,jinja,htmldjango setlocal foldmethod=manual

    " Use <localleader>f to fold the current tag.
    au FileType html,jinja,htmldjango nnoremap <buffer> <localleader>f Vatzf

    " Use <localleader>t to fold the current templatetag.
    au FileType html,jinja,htmldjango nmap <buffer> <localleader>t viikojozf

    " Use Shift-Return to turn this:
    "     <tag>|</tag>
    "
    " into this:
    "     <tag>
    "         |
    "     </tag>
    au FileType html,jinja,htmldjango nnoremap <buffer> <s-cr> vit<esc>a<cr><esc>vito<esc>i<cr><esc>

    " Smarter pasting
    au FileType html,jinja,htmldjango nnoremap <buffer> p :<C-U>YRPaste 'p'<CR>v`]=`]
    au FileType html,jinja,htmldjango nnoremap <buffer> P :<C-U>YRPaste 'P'<CR>v`]=`]
    au FileType html,jinja,htmldjango nnoremap <buffer> π :<C-U>YRPaste 'p'<CR>
    au FileType html,jinja,htmldjango nnoremap <buffer> ∏ :<C-U>YRPaste 'P'<CR>

    " Indent tag
    au FileType html,jinja,htmldjango nnoremap <buffer> <localleader>= Vat=

    " Django tags
    au FileType jinja,htmldjango inoremap <buffer> <c-t> {%<space><space>%}<left><left><left>

    " Django variables
    au FileType jinja,htmldjango inoremap <buffer> <c-f> {{<space><space>}}<left><left><left>
  augroup END

"}}}

" Javascript {{{

  augroup ft_javascript
      au!

      au FileType javascript setlocal foldmethod=marker
      au FileType javascript setlocal foldmarker={,}

      " Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
      " positioned inside of them AND the following code doesn't get unfolded.
      au Filetype javascript inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>
  augroup END

"}}}

" Plain Text {{{

  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction

  au BufRead,BufNewFile *.txt call s:setupWrapping()
  au BufRead,BufNewFile *.txt set spell
"}}}

" Markdown {{{

  function s:setupMarkup()
    call s:setupWrapping()
    map <buffer> <Leader>p :Mm <CR>
  endfunction

  augroup ft_markdown
      au!

      au BufNewFile,BufRead *.{md,markdown,mdown,mkd,mkdn} setlocal filetype=markdown
      au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()
      au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} set spell

      " Use <localleader>1/2/3 to add headings.
      au Filetype markdown nnoremap <buffer> <localleader>1 yypVr=
      au Filetype markdown nnoremap <buffer> <localleader>2 yypVr-
      au Filetype markdown nnoremap <buffer> <localleader>3 I### <ESC>
  augroup END

" }}}

" Python {{{

  augroup ft_python
      au!

      " au FileType python setlocal omnifunc=pythoncomplete#Complete
      au FileType python setlocal define=^\s*\\(def\\\\|class\\)


      au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

      au FileType python if exists("python_space_error_highlight") | unlet python_space_error_highlight | endif


  augroup END

"}}}

" PHP {{{

  augroup ft_php
    au!

    au FileType php set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79
    au Filetype php setlocal foldmethod=syntax
  augroup END

"}}}

" ReStructuredText {{{

  augroup ft_rest
      au!

      au Filetype rst nnoremap <buffer> <localleader>1 yypVr=
      au Filetype rst nnoremap <buffer> <localleader>2 yypVr-
      au Filetype rst nnoremap <buffer> <localleader>3 yypVr~
      au Filetype rst nnoremap <buffer> <localleader>4 yypVr`
  augroup END

" }}}

" Ruby {{{

  augroup ft_ruby
      au!
      au Filetype ruby setlocal foldmethod=syntax
  augroup END

"}}}

" Vim {{{

  augroup ft_vim
      au!

      au FileType vim setlocal foldmethod=marker
      au FileType help setlocal textwidth=78
      au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
  augroup END

"}}}

" Trailing Spaces {{{

augroup trailing
    au!
    au InsertEnter * :set listchars=tab:▸\ 
    au InsertLeave * :set listchars=tab:▸\ ,trail:⌴
augroup END

"}}}


