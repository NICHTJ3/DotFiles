" TODO: Execute commands silently just encase they fail
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                              Neovim AutoCommands                             "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
if has("autocmd")
  augroup SourceVimrcOnSave
    autocmd!
    autocmd BufWritepost *.vim source $MYVIMRC
  augroup END

  augroup CustomSyntax
    autocmd!
    autocmd BufWinEnter *.kotlin set filetype=kotlin
    autocmd BufWinEnter *.vue set syntax=vue
    autocmd BufWinEnter *.qrc set filetype=xml
    autocmd BufWinEnter config set syntax=i3config
    autocmd BufWinEnter *.pug set syntax=pug
    autocmd BufWinEnter *.cisco set syntax=cisco
    autocmd BufWinEnter *.css set filetype=css
    autocmd Filetype vimwiki set foldlevel=2
  augroup END

  augroup Folding
    autocmd!
    autocmd FileType cs setlocal foldmethod=indent
    autocmd FileType vim setlocal foldmethod=marker
  augroup end

  augroup Terminal
    autocmd!
    autocmd TermOpen * startinsert
    " Turn off line numbers etc
    autocmd TermOpen * setlocal listchars= nonumber norelativenumber
  augroup end

  augroup FileTypeBindings
    autocmd!
    autocmd FileType fzf tnoremap <buffer> <c-h> <c-x> " Open in vertical split
    autocmd FileType fzf tnoremap <buffer> <esc> <c-c> " Close fzf with escape
    autocmd Filetype ipynb nmap <silent><Leader>b :VimpyterInsertPythonBlock<CR>
    autocmd Filetype ipynb nmap <silent><Leader>j :VimpyterStartJupyter<CR>
  augroup end

  augroup Firenvim
    au BufEnter github.com_*.txt set filetype=markdown
  augroup end

  " Color all columns past 81
  autocmd! Filetype * let &l:colorcolumn='+' . join(range(1, 254), ',+')

  " Open FZF instead of explor
  autocmd! StdinReadPre * let s:std_in=1
  autocmd! VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") |exe 'ene'| exe 'Files' argv()[0] | endif

  " Relative linenums only in normal mode
  autocmd! InsertEnter * set norelativenumber
  autocmd! InsertLeave * set relativenumber

  " VIM wiki template
  autocmd! BufNewFile */diary/[0-9]*.md :silent 0r !echo "\
        \# `date +'\%d-\%m-\%Y'`\
        \n\#\#: <Task>\
        \n\#\#\# What I am doing\
        \n\#\#\# What I need to do\
        \n[TODO](../index)\
        \n\#\#\# What did I do"

  " Install New Plugins if not installed
  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC | q
  endif

  " Coc highlight on cursorhold
  autocmd! CursorHold * silent call CocActionAsync('highlight')
  " Close coc-explorer if it's the last open window
  autocmd! BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

endif
