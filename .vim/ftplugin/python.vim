
" ------------------- Settings ----------------------------

" 80 symbols color column
set colorcolumn=89
highlight ColorColumn ctermbg=233
highlight OverLength ctermfg=244
match OverLength /\%89v.*/

" Enable advanced python syntax
let g:python_highlight_all = 1

" ------------------- Mappings ---------------------------
" Jedi
let g:jedi#goto_command = "<leader>jc"
let g:jedi#goto_assignments_command = "<leader>ja"
let g:jedi#goto_definitions_command = "<leader>jd"
let g:jedi#documentation_command = "jo"
let g:jedi#usages_command = "<leader>ju"
let g:jedi#completions_command = "<C-Spase>"
let g:jedi#rename_command = "<leader>jr"

" Ale
let g:ale_fixers = {'python': ['isort', 'black']}
let g:ale_linters = {'python': ['pylint', 'prospector']}
let g:ale_completion_enabled = 1
let g:ale_completion_delay = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_set_highlights = 1
let g:ale_lint_on_enter = 1


" Ale fix
nnoremap <leader>fx :ALEFix <CR>
" Ale go to definition
nnoremap <leader>gd :ALEGoToDefinition <CR>
