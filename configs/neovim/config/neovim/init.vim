" Sources vim config files from ~/.config/nvim/
runtime! config/functions.vim
runtime! config/pluggins.vim
runtime! config/settings.vim
runtime! config/pluggin-settings.vim
" NOTE: The bellow check may be causing the coc-mappings etc not to be applied
if has_key(plugs, 'coc.nvim') " Check if coc is installed before configuring coc
  runtime! config/coc-pluggins.vim
  runtime! config/coc-mappings.vim
  runtime! config/coc-autocommands.vim
endif
runtime! config/commands.vim
runtime! config/aliases.vim
runtime! config/mappings.vim
runtime! config/autocommands.vim
