" Para init.vim
" Usar 256 colores
if &term =~ 'screen-256color'
  set t_Co=256
endif

" Detectar si estamos dentro de tmux
if exists('$TMUX')
  set background=dark
endif
