" -------------------------- Settings -----------------------

" Syntax highlighting
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

" Editing support
nnoremap <leader>jd :TernDef <CR>
nnoremap <leader>td :TernDoc <CR>
nnoremap <leader>tt :TernType <CR>
nnoremap <leader>ju :TernRefs <CR>
nnoremap <leader>jr :TernRename <CR>

" Autoformatting
let g:prettier#autoformat = 0
let g:prettier#exec_cmd_async = 1
set shiftwidth=2
set tabstop=2
