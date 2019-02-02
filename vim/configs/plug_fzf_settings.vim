let g:fzf_buffers_jump = 1
nmap <c-l><c-a> :Ag<CR>
nmap <c-l><c-l> :Lines<CR>

" FZF
let g:fzf_tags_command = 'ctags -R'
set rtp+=/usr/local/opt/fzf

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \   <bang>0)


" Lookup dictionary with translate
inoremap <expr> <c-x><c-d> fzf#complete({
            \ 'source': 'cat ~/.vim/spell/en.utf-8.add /usr/share/dict/words 2>/dev/null',
            \ 'options': '--preview="ydcv --color=always {}" --preview-window=down',
            \ 'left': 50})
autocmd Filetype gitcommit inoremap <expr> <c-x><c-x> fzf#complete({
            \ 'source': 'git log --pretty=format:"%s"',
            \ 'options': '--preview="ydcv --color=always {}" --preview-window=down',
            \ 'left': 50})
" Override default command
command! -bang Colors call fzf#vim#colors({'left': '15%', 'options': '--reverse'}, <bang>0)
" FZF with devicons
function! s:file_action(item, action)
    if expand('$FZF_PATH_LOC') == ''
        lt l:file = a:item
    else
        let l:file = a:item[stridx(a:item, ' ', 1)+1 : -1]
    endif
    execute a:action l:file
endfunction

function! s:file_edit(items)
    for file in a:items
        call s:file_action(file, 'edit')
    endfor
endfunction
function! s:file_tab(items)
    for file in a:items
        call s:file_action(file, 'tabnew')
    endfor
endfunction
function! s:file_split(items)
    for file in a:items
        call s:file_action(file, 'split')
    endfor
endfunction
function! s:file_vsplit(items)
    for file in a:items
        call s:file_action(file, 'vsplit')
    endfor
endfunction

"let g:fzf_action = {
"            \ 'alt-v':  'vsplit',
"            \ 'alt-t':  'nabnew',
"            \ 'alt-x':  'split',
"            \ 'ctrl-m': function('s:file_edit'),
"            \ 'ctrl-x': function('s:file_split'),
"            \ 'ctrl-v': function('s:file_vsplit') }

function! s:fzf_devicons()
    let l:fzf_files_options = '
                \ --multi
                \ --preview-window right
                \ --preview "$FZF_FILE_HIGHLIGHTER {$FZF_PATH_LOC} 2>/dev/null | head -'.&lines.'"
                \ '

    call fzf#run(fzf#wrap('fzf_devicons', {
                \ 'source':  expand('$FZF_CTRL_T_COMMAND'),
                \ 'options': l:fzf_files_options,
                \ 'down':    '50%',
                \ }))
endfunction
command! FilesWithIcon :call s:fzf_devicons()

nmap <a-f> :FilesWithIcon<CR>
nmap <a-b> :Buffers<CR>
nmap <leader>t :FZF<CR>
nmap <leader>l :Lines <CR>
nmap <leader>h :History <CR>
nmap <leader>r :BTags<CR>
nmap <leader>f :execute "Ag "."<C-r><C-w>"<CR>
nmap <leader>\ :Tagbar<CR>
