" Basics {
  set nocompatible            " Explicitly get out of vi-compatible mode
  syntax on
" }
" General {
  filetype plugin indent on
  set backspace=indent,eol,start    " make backspace a bit more flexible
  set nobackup                      " No backup!
  set iskeyword+=_,@,%,#            " none of these are word dividers
  set noerrorbells                  " Do not make any noise!
" }
" UI {
  colorscheme desertEx          "
  set cursorline                " Highlight the current line
  set scrolloff=8               " Keep x line for scope while scrolling
  set sidescrolloff=8           " same same
  set showmatch                 " Show matching bracket
  set number                    " Show line numbers in gutter
  set ruler                     " Always show current position along the bottom
  set showcmd                   " Show the command being typed
  if has('gui_running')
   set lines=40                 "
   set columns=100              "
  endif
  set list
" }
" EDITING {
  set ff=unix                   " Unix EOL
  set fileencoding=UTF-8        " Speak UTF-8
  set encoding=UTF-8            " Display UTF-8
  set shiftround                " when at 3 spaces, and I hit > ... go to 4, not 5
  set ignorecase                " case sensitivity is dumb
  set smartcase                 " if there are case, go case sensitive
  set nowrap                    " No, I don't want wordwrap
  set tabstop=2                 "
  set shiftwidth=2              "
  set expandtab                 " We do not want tabs, do we?
" }

" KEYMAP {

  " Changing leader
  let mapleader   = ","
  let g:mapleader = ","

  nmap <silent> <C-F9> :set wrap!<CR>

  " Delete line filled of space
  nmap <silent> <C-F10> :%s/^\s\+$//g<CR>

  " expand tab and retab all the file
  nmap <silent> <C-S-F10> :set et|retab<CR>

  " page down with <Space>
  nmap <Space> <PageDown>

  " Minibufexplorer
  noremap <leader>q  :Bclose<CR>
  noremap <leader>q! :Bclose!<CR>

  " NERDTree {
    nmap    <silent> <C-F7> :NERDTreeToggle<CR>
  " }

  noremap <leader>n :NERDTreeToggle<CR>
  noremap <leader>t :TlistToggle<CR>

  " PHPDoc keymaps {
    nnoremap <leader>d :call PhpDocSingle()<CR>
    vnoremap <leader>d :call PhpDocRange()<CR>
  " }

  " Align {
    vnoremap <leader>aa :Align =><CR>
  " }
" }

" Folding {
  set foldenable                                   " enable folding
  set foldmarker={,}                               " Fold C Style code
  set foldmethod=marker                            " Fold on the marker
  set foldlevel=100                                " Do not autofold anything (but i can still fold manually)
  set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds

  if exists("SimpleFoldText") " {
    function SimpleFoldText()
      return getline(v:foldstart).' '
    endfunction
  endif

  set foldtext=SimpleFoldText()                    " Custom fold function (cleaner than default)
" }

"Plugin settings and keymaps {
  " Keymaps
    inoremap jj <Esc>

  " CamelCase move
    map <silent> W <Plug>CamelCaseMotion_w
    map <silent> B <Plug>CamelCaseMotion_b
    map <silent> E <Plug>CamelCaseMotion_e
    sunmap W
    sunmap B
    sunmap E

  " Ack {
    let g:ackprg="ack-grep -H --nocolor --nogroup --column --ignore-dir=build"
    noremap <leader>s     :Ack 
    noremap <leader>st    :Ack --ignore-dir=symfony --ignore-dir=Symfony2 todo<CR>
  " }
  "
    nmap <silent> <leader>f :CommandT<CR>

  " Align {
    let g:loaded_AlignMapsPlugin = "v41"
  " }

  " NERDTree settings {
    let g:NERDTreeWinPos = "right"
  " }

  " TagList settings {
    let Tlist_Auto_Open=0
    let Tlist_Use_Right_Window=0
    let Tlist_Sort_Type = "name" " order by
    "
      " language specific {
      let tlist_php_settings = 'php;c:class;d:constant;f:function' " don't show variables in php
      " }
  " }

  " MiniBufXplorer settings {
    let g:miniBufExplMaxSize            = 2
    let g:miniBufExplMapWindowNavVim    = 1
    let g:miniBufExplMapWindowNavArrows = 1
    let g:miniBufExplMapCTabSwitchBufs  = 1
    let g:miniBufExplModSelTarget       = 1
  " }

  " PDV {
    let g:pdv_cfg_Author = ""
    let g:pdv_cfg_Version = "$Id$"
  " }

  " local vimrc {
    let g:localvimrc_ask = 0
  " }

  " debugger {
    let g:debuggerMiniBufExpl = 1
  " }
" }

" markdown specific {
  augroup mkd
    autocmd BufRead *.mkd set ai formatoptions=tcroqn2 comments=n:&gt;
    autocmd BufRead *.markdown set ai formatoptions=tcroqn2 comments=n:&gt;
  augroup END
" }

" yaml specific
  autocmd insertLeave *.yml set nocursorcolumn
  autocmd insertEnter *.yml set cursorcolumn

  autocmd BufRead *.twig set filetype=htmltwig

" I want english!
set langmenu=en_US.UTF-8
" Here because otherwise there is some problem on windows?!
set listchars=trail:¤,tab:>-
set guifont="Monospace 12"
