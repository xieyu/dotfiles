"leaderf
let g:Lf_GtagsAutoGenerate = 1
let g:Lf_Gtagslabel = 'native-pygments'
nmap <leader>t :Leaderf file<CR>
nmap <leader>g :Leaderf gtags<CR>
nmap <m-f> :LeaderfFunction<CR>
nmap <m-d> :Leaderf gtags --auto-jump -d <C-r><C-w><CR>
nmap <m-r> :Leaderf gtags -r <C-r><C-w><CR>
nmap <m-s> :Leaderf gtags -s <C-r><C-w><CR>
nmap <m-l> :Leaderf self<CR>
