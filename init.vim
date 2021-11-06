set nocompatible

call plug#begin('~/.vim/plugged')

  " A visual Git plugin to see what has changed in each file.
  Plug 'airblade/vim-gitgutter'

  " Visual plugin to show things such as the Vim mode.
  Plug 'vim-airline/vim-airline'

  " Prettier formatter.
  Plug 'prettier/vim-prettier', {'do': 'yarn install' }

  " Colorful rainbow bracket matching.
  Plug 'luochen1990/rainbow'

  " A color scheme based on monokai.
  Plug 'tomasr/molokai'

  " Markdown plugin.
"  Plug 'godlygeek/tabular'
"  Plug 'plasticboy/vim-markdown'

  " tmux plugin.
"  Plug 'tmux-plugins/vim-tmux'

  " Fuzzy file finder.
  Plug 'junegunn/fzf', { 'do': { ->fzf#install() } }

  " Code completion.
"  Plug 'ycm-core/youcompleteme'

  " Syntax checking through external syntax checkers.
  Plug 'vim-syntastic/syntastic'

  " Kitty syntax highlighting
  Plug 'fladson/vim-kitty'

  Plug 'yous/vim-open-color'

  " Language server support
"  Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install --frozen-lockfile'}

  " Go language server
"  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

  " Groovy language server
"  Plug 'GroovyLanguageServer/groovy-language-server'

  Plug 'connorholyday/vim-snazzy'

  Plug 'wadackel/vim-dogrun'

  Plug 'NLKNguyen/papercolor-theme'

  Plug 'sainnhe/sonokai'

  Plug 'sheerun/vim-polyglot'

  Plug 'panozzaj/vim-autocorrect'

  Plug 'itchyny/lightline.vim'
call plug#end()

filetype plugin indent on

" Enable syntax highlighting.
syntax on

" Set up the open-color theme.
" Use 24-bit (true-color) mode in Vim/Neovim when outside tmux or screen.
" If you're using tmux version 2.2 or later, you can remove the outermost $TMUX
" check and use tmux's 24-bit color support
" (http://sunaku.github.io/tmux-24bit-color.html#usage for more information.)
if empty($TMUX) && empty($STY)
  " See https://gist.github.com/XVilka/8346728.
  if $COLORTERM =~# 'truecolor' || $COLORTERM =~# '24bit'
    if has('termguicolors')
      " See :help xterm-true-color
      if $TERM =~# '^screen'
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
      endif
      set termguicolors
    endif
  endif
endif

"if executable('terraform-ls')
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'terraform-ls',
"        \ 'cmd': {server_info->['terraform-ls', 'serve']},
"        \ 'whitelist': ['terraform'],
"        \ })
"endif

if has('termguicolors')
  set termguicolors
endif

let g:sonokai_style = 'shusia'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1

" Set color scheme to monokai
colorscheme sonokai
set t_Co=256

let g:airline_theme = 'sonokai'
let g:sonokai_transparent_background = 1
let g:sonokai_diagnostic_text_highlight = 1
let g:sonokai_diagnostic_line_highlight = 1
let g:sonokai_diagnostic_virtual_text = 'colored'

" Turn on line numbers.
set number

" Enable intelligent indentation.
set autoindent
set smartindent

" Set backspace for certain characters.
set backspace=indent,eol,start

" Set textwidth to be 72 and visual ruler to be +1 from that.
set textwidth=72
set cc=+1
"set colorcolumn=72

" Use spaces instead of tabs.
set tabstop=2
set shiftwidth=2
set expandtab
set breakindent

set list
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" Turn off automatic comment formatting.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o formatoptions+=t

" Disable Background Color Erase (BCE) indefinitely, so that color
" schemes work properly when Vim is used inside tmux or GNU.
set t_ut=

"""
""" vim-markdown settings.
"""

" Disable folding.
let g:vim_markdown_folding_disabled = 1
" Disable concealing.
let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1
let g:vim_markdown_conceal_code_blocks = 0
" Fix indentation.
let g:vim_markdown_new_list_item_indent = 0
" Follow anchors.
let g:vim_markdown_follow_anchor = 1
" Do not automatically insert bullet points.
let g:vim_markdown_auto_insert_bullets = 0
" Fenced code block languages
let g:vim_markdown_fenced_languages = ['sh=sh']
" Syntax extensions
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1


"""
""" vim-gitgutter settings
"""

function GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}

"""
""" vim-go settings
"""

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

"""
""" vim-prettier settings
"""

" Allow auto formatting for files without @format or @prettier tag
let g:prettier#autoformat_require_pragma = 0

" Run vim-prettier also after changing text or leaving insert mode
let g:prettier#quickfix_enabled = 0
autocmd TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html PrettierAsync

" Turn of spell checking
"set spell spelllang=en_us

"""
""" vim-syntastic settings
"""

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_markdown_checkers = ['proselint']

"""
""" spellcheck
"""
"augroup markdownSpell
"  autocmd!
"  autocmd FileType markdown setlocal spell spelllang=en_us
"  autocmd BufRead,BufNewFile *.md setlocal spell
"augroup END
