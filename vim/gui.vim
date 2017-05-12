if has("gui_running")
    set guifont=Monaco:h13
    if has("gui_gtk2")   "GTK2
        set guifont=Monaco\ 13, Monospace\ 13
    endif
    set guioptions-=T
    set guioptions+=e
    set guioptions-=r
    set guioptions-=L
    set guitablabel=%M\ %t
    set showtabline=1
    set linespace=2
    set noimd
endif

" theme主题
set background=dark
set t_Co=256
colorscheme onedark

