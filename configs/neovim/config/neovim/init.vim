" Sources vim config files from ~/.config/nvim/
runtime! config/pluggins.vim
runtime! config/settings.vim
runtime! config/pluggin-settings.vim
" NOTE: The bellow check may be causing issues
" Check if coc is installed before configuring coc
if has_key(plugs, 'coc.nvim')
  runtime! config/coc-pluggins.vim
  runtime! config/coc-mappings.vim
  runtime! config/coc-autocommands.vim
endif
runtime! config/functions.vim
runtime! config/commands.vim
runtime! config/aliases.vim
runtime! config/mappings.vim
runtime! config/autocommands.vim
