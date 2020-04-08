"leaderf
let g:Lf_GtagsAutoGenerate = 1
let g:Lf_Gtagslabel = 'native-pygments'
nmap <leader>t :Leaderf file<CR>
nmap <leader>g :Leaderf gtags<CR>
nmap <leader>l :LeaderfLine<CR>

nmap <m-f> :LeaderfFunction<CR>
nmap gd :Leaderf gtags --auto-jump -d <C-r><C-w><CR>
nmap gr :Leaderf gtags -r <C-r><C-w><CR>
nmap gs :Leaderf gtags -s <C-r><C-w><CR>
nmap <m-l> :Leaderf self<CR>
