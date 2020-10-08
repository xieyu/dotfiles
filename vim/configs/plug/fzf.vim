"let $FZF_DEFAULT_COMMAND = 'ag --hidden -l -g ""'
" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden  --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" --ignore-file tags'.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif


"'^\W*def\W+.*pl.*:\w*$'
function! RgPattern(pattern, type, query, fullscreen)
  "let pattern = '^\W*def\W+.*%s.*:\w*$'
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case --type %s %s || true'
  let command_fmt = printf(command_fmt, shellescape(a:type), shellescape(a:pattern))
  let initial_command = printf(command_fmt, a:query)
  echo 'the init command is ' .initial_command
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

function! Rgf()
  let word = expand('<cword>')
  let _filetype = &filetype
  echo 'Rgf worker under cursor is'.word.'file type is '_filetype
  if _filetype == 'cpp' 
      call RgPattern('%s\(', 'cpp', word, 0)
  elseif _filetype == 'python'
      call RgPattern('^\W*def\W+%s\(.*):\w*$', 'py', word, 0)
  endif
endfunction

function! Rgc()
  let word = expand('<cword>')
  let _filetype = &filetype
  if _filetype == 'cpp' 
      call RgPattern('(struct|class|enum|using)\W+%s\b', 'cpp', word, 0)
  endif
endfunction

nmap <leader>rf :call Rgf()<CR>
nmap <leader>rc :call Rgc()<CR>

command! -nargs=* -bang Rpd call RgPattern('^\W*def\W+.*%s.*:\w*$', 'py', <q-args>, <bang>0)
command! -nargs=* -bang Rcf call RgPattern('%s\(', 'cpp', <q-args>, <bang>0)

"riggrep search function define

function! RgClassInhiert()
    "let cmd="!rg '(class|struct).*:.*(public|private|protected).*\bIStorage\b' -t cpp --no-filename|cut -d ' ' -f 2 >/tmp/test"
    let word = expand("<cword>")
    let cmd="!rg '(class|struct).*:.*(public|private|protected).*IStorage' -t cpp --no-filename|cut -d ' ' -f 2 >/tmp/test"
    execute cmd
endfunction

" Files + devicons
function! Fzf_dev()
  let l:fzf_files_options = '--preview "bat {2..-1} | head -'.&lines.'"'

  function! s:files()
    let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
    return s:prepend_icon(l:files)
  endfunction

  function! s:prepend_icon(candidates)
    let l:result = []
    for l:candidate in a:candidates
      let l:filename = fnamemodify(l:candidate, ':p:t')
      let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
      call add(l:result, printf('%s %s', l:icon, l:candidate))
    endfor

    return l:result
  endfunction

  function! s:edit_file(item)
    let l:pos = stridx(a:item, ' ')
    let l:file_path = a:item[pos+1:-1]
    execute 'silent e' l:file_path
  endfunction

  call fzf#run({
        \ 'source': <sid>files(),
        \ 'sink':   function('s:edit_file'),
        \ 'options': '-m ' . l:fzf_files_options,
        \ 'down':    '40%' })
endfunction

function! FzfRustDoc() 
  function! s:open_rust_doc(item)
    echo a:item
    let action = s:word_action_map[a:item]
    echo "the action file is ". action
    call rust_doc#open_denite(action)
  endfunction

  call fzf#run({
    \ 'source': <sid>rust_docs(),
    \ 'sink': function('s:open_rust_doc'),
    \ 'down': '40%'})
  })
endfunction

function! s:tag_of(identifier) abort
    let html = fnamemodify(a:identifier.path, ':t')
    if html ==# 'index.html'
        return ''
    endif
    return matchstr(html, '^[^.]\+\ze.\+\.html$')
endfunction

function! s:word_of(identifier) abort
    let tag = s:tag_of(a:identifier)
    if tag !=# ''
        return printf('%s [%s]', a:identifier.name, tag)
    else
        return a:identifier.name
    endif
endfunction

let s:word_action_map = {}

function! s:rust_docs() abort
    let hint_dir = expand('%:p:h')
    let docs = rust_doc#get_doc_dirs(hint_dir !=# '' ? hint_dir : getcwd())
    "if index(a:args, 'modules') >= 0
    "    let list = rust_doc#get_modules(docs)
    "else
    let list = rust_doc#get_all_module_identifiers(docs)
    "endif

    "if index(a:args, 'cursor') >= 0
    "    let list = s:filter_by(expand('<cword>'), list)
    "elseif index(a:args, 'visual') >= 0
    "    let s = getpos("'<")[1:2]
    "    let e = getpos("'>")[1:2]
    "    if s == [0, 0] || e == [0, 0]
    "        echohl ErrorMsg | echomsg 'Nothing was visually selected' | echohl None
    "        return []
    "    endif
    "    if s[0] !=# e[0]
    "        echohl ErrorMsg | echomsg 'multi-lines were selected' | echohl None
    "    endif
    "    let list = s:filter_by(getline(s[0])[s[1]-1 : e[1]-1], list)
    "endif
    "let list = map(list, 'v:val["name"]')
    "return list

    "echo list[0]

    "let list = map(list, '{
    "    \ "word" : s:word_of(v:val),
    "    \ "action__path" : v:val["path"],
    "    \ }')
    "echo list[0]
    let s:word_action_map = {}
    for val in list
      let name = s:word_of(val)
      let path = val["path"]
      let s:word_action_map[name] = path
    endfor
    "let words = deepcopy(list)
    let words = map(list, 's:word_of(v:val)')
    echo words[0]
    echo list[0]
    return words
endfunction
