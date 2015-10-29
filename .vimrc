if filereadable($HOME . '/.vim/vimrc.vim')
    source $HOME/.vim/vimrc.vim
elseif filereadable($HOME . '/vimfiles/vimrc.vim')
    source $HOME/vimfiles/vimrc.vim
endif
