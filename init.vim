" Cargamos los plugins
call plug#begin()
Plug 'tpope/vim-fugitive' " git
 Plug 'scrooloose/nerdcommenter'
"" Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'bling/vim-airline' " improved statusbar
" Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-endwise'
" Plug 'rstacruz/vim-closer'
" Plug 'slim-template/vim-slim'
Plug 'digitaltoad/vim-pug'
" Plug 'Chiel92/vim-autoformat'
" Plug 'elixir-editors/vim-elixir'
Plug 'editorconfig/editorconfig-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'sainnhe/sonokai'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'sbdchd/neoformat'
call plug#end()

" Coc extensions
let g:coc_global_extensions = [
  \'coc-eslint',
  \'coc-explorer',
  \'coc-git',
  \'coc-json',
  \'coc-lists',
  \'coc-prettier',
  \'coc-snippets',
  \'coc-solargraph',
  \'coc-stylelintplus',
  \'coc-tsserver',
  \'@yaegassy/coc-volar',
  \'@yaegassy/coc-volar-tools'
  \]

" Para usar las opciones de vim en lugar de las de vi
" Esto tiene que ir al principio del fichero
set nocompatible

set autoindent " Para activar la auto-indentación
set backspace=indent,eol,start " Corrige el que no funcione la tecla de borrado
set clipboard=unnamedplus " Copia al clipboard del sistema
set colorcolumn=100 " Mostrar línea a los 100 caracteres
set cursorline " Activamos el marcado de la línea actual
set expandtab " Espacios en lugar de tabulaciones (dos espacios para indentar)
set guicursor= " Para deshabilitar el estilo del cursor
set hlsearch " Resalta los resultados de una búsqueda
set incsearch " Resalta los resultados de una búsqueda
set mouse=a " Activa el ratón
set noswapfile " Evita que se creen los archivos .swp
set number " Muestra el número de línea
set shiftwidth=2
set softtabstop=2
set shiftround
set synmaxcol=300 " Max line length syntax
set tabstop=2
set splitright " Abre el vsplit a la derecha

" COC
set cmdheight=2 " Give more space for displaying messages
set hidden " TextEdit might fail if hidden is not set
set nobackup " Some servers have issues with backup files, see #649
set nowritebackup " Some servers have issues with backup files, see #649

" Configurar el esquema de color
syntax on
set t_Co=256
color apprentice

" Slime extension
au BufReadPost *.slime set syntax=slim
au BufReadPost *.slimleex set syntax=slim

" Airline
let g:airline_section_b = ''
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = '%l/%L ☰ %c'
let g:airline_mode_map = {
    \ '__'     : '-',
    \ 'c'      : 'C',
    \ 'i'      : 'I',
    \ 'ic'     : 'I',
    \ 'ix'     : 'I',
    \ 'n'      : 'N',
    \ 'multi'  : 'M',
    \ 'ni'     : 'N',
    \ 'no'     : 'N',
    \ 'R'      : 'R',
    \ 'Rv'     : 'R',
    \ 's'      : 'S',
    \ 'S'      : 'S',
    \ ''     : 'S',
    \ 't'      : 'T',
    \ 'v'      : 'V',
    \ 'V'      : 'V',
    \ ''     : 'V',
    \ }

" Configura NERDCommenter para añadir un espacio después del comentario
let NERDSpaceDelims=1
let g:NERDDefaultAlign='left'

let mapleader="," " Cambia la tecla <Leader> de '\' a ','

let g:endwise_no_mappings = v:true

" Para que use la instalación local de prettier
let g:neoformat_try_node_exe = 1

nmap <F2> :CocCommand document.renameCurrentWord<CR>
nmap <F3> :CocCommand explorer<CR>
nmap <F4> :Gdiff<CR>
nmap <F5> :CocCommand volar.action.splitEditors<CR>
nmap <F6> :Autoformat<CR>
nmap <F9> :CocSearch

nmap <silent> <C-c> <Plug>(coc-cursors-position)
nmap <silent> <C-d> <Plug>(coc-cursors-word)
nmap <silent> <C-z> <Plug>(coc-refactor)

" GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gt :call CocActionAsync('jumpDefinition', 'tabe')<CR>
nmap <silent> gv :call CocActionAsync('jumpDefinition', 'vs')<CR>

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" Use K for show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Remap keys for applying codeAction to the current buffer.
nmap <leader>a  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>q  <Plug>(coc-fix-current)
" Organize imports
nmap <leader>o :call CocActionAsync('runCommand', 'editor.action.organizeImport')<CR>

" Keymapping for grep word under cursor with interactive mode
nnoremap <silent> <Leader>S :exe 'CocList -I --input='.expand('<cword>').' grep'<CR>

" Open search words bar
nnoremap <silent> <Leader>s :exe 'CocList grep'<CR>

" Delete word cursor
nnoremap <silent> <Leader>d ciw

" Rename word under cursor in all files (split view)
nnoremap <silent> <Leader>R :exe 'CocSearch -w '.expand('<cword>')<CR>

" Open find file bar
nnoremap <silent> <Leader>f :exe 'CocList files'<CR>

" Alias para cerrar la pestaña actual
cnoreabbrev qt tabclose

"" Swith between .pug and .js
" nnoremap <Leader>v :vs %:p:s,.js$,.X123X,:s,.pug$,.js,:s,.X123X$,.pug,<CR>
nnoremap <Leader>v :vs %:p:s,.ts$,.X123X,:s,.pug$,.ts,:s,.X123X$,.pug,<CR>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <c-l> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<c-l>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Grep word under cursor
command! -nargs=+ -complete=custom,s:GrepArgs Rg exe 'CocList grep '.<q-args>

function! s:GrepArgs(...)
  let list = ['-S', '-smartcase', '-i', '-ignorecase', '-w', '-word',
        \ '-e', '-regex', '-u', '-skip-vcs-ignores', '-t', '-extension']
  return join(list, "\n")
endfunction
