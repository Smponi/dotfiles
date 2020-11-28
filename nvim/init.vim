nnoremap <leader>f :Files<cr>im-Plug automa:tic installation


"JK for Escape
inoremap jk <ESC>
let mapleader=","

call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'SirVer/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug '~/.fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Live-Server fuer HTML,CSS und JS
Plug 'turbio/bracey.vim'
"NeoTex
Plug 'donRaphaco/neotex', { 'for': 'tex' }
call plug#end()


set number
set relativenumber

"Use Mouse
set mouse=nv

"Load Settings
source /home/$USER/.config/nvim/plugins/neotex.vim	
source /home/$USER/.config/nvim/plugins/coc.vim


autocmd FileType tex nnoremap <buffer> <F5> :silent call OpenPDFReader() <CR>


"Systemwide clipboard
set clipboard=unnamedplus

"Python
let g:pymode_python = 'python3'
let g:pymode_rope = 1
let g:pymode_rope_completion = 1
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_completion_bind = '<C-Space>'
let g:pymode_rope_complete_on_dot = 1
"FZF
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
nnoremap <c-p> :FZF<cr>
augroup fzf
  autocmd!
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END
    " ripgrep
if executable('rg')
	let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
	set grepprg=rg\ --vimgrep
	command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
	command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
      " Rg
	nnoremap <silent> <Leader>fa :Find<CR> 
      " Rg current worda
	nnoremap <Leader>fw :Rg <C-R><C-W><space>
endif
" To use ripgrep instead of ag:

command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)

nnoremap <leader>f :Files<cr>
"Use Rg by , o 
nnoremap <leader>o :Rg<cr>
"Ultrasnippet
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %


"Ensure .tex is always latex File
let g:tex_flavor = "latex"

