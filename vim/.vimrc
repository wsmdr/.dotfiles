" vim 配置

set nocompatible               " be iMproved 

" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

set nu "设置行号
set autoindent "自动缩进
set ts=4 "这个是设置tap的大小为4个空格
set nobackup	

set encoding=utf8 "文件编码
syntax on " 语法高亮
autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul
" 用浅色高亮当前行
set showmatch
" 高亮显示对应的括号
set whichwrap=b,s,<,>,[,]
" 开启Normal或Visual模式下Backspace键，空格键，左方向键，右方向键，Insert或replace模式下左方向键，右方向键跳行的功能。

colorscheme molokai
"colorscheme SolarizedDark
" 设置颜色主题
"set guifont=Menlo:h12 " 设置字体为  字体：大小
set guifont=Source\ Code\ Pro\ for\ Powerline:h12 " 设置字体为  字体：大小

"设置默认打开窗口大小  
set lines=70 columns=200 
" Highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler

" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable
set autochdir

" 显示中文帮助
if version >= 603
set helplang=cn
set encoding=utf-8
endif
let mapleader = ","
let g:mapleader = ","


filetype off                   " required!  
  
" 插件配置
set rtp+=~/.vim/bundle/vundle/  
call vundle#rc()  
  
" let Vundle manage Vundle  
" required!   
"这是vundle本身的设置  
Bundle 'gmarik/vundle'    
   
 " My Bundles here:  
 "这里是设置你自己自定义的插件的设置vundle设置，注意：下载的插件git为：https://github.com/godlygeek/tabular.git，则设置为Bundle 'godlygeek/tabular';https://github.com/gmarik/vundle.git设置则为 Bundle 'gmarik/vundle'    
 " original repos on github  
 Bundle 'godlygeek/tabular'  
  
 " vim-scripts repos，vim-scripts的访问地址，格式则如下：  
 Bundle 'L9'  
 Bundle 'FuzzyFinder'  
 " non github repos ，非git的访问地址的，格式如下：  
 Bundle 'git://git.wincent.com/command-t.git'  
 " ...  
 Bundle 'Valloric/YouCompleteMe'
 " NERDTree
 Bundle 'scrooloose/nerdtree'
 Bundle 'Xuyuanp/nerdtree-git-plugin'
 Bundle 'airblade/vim-gitgutter'
 " Powerline
 Bundle 'Lokaltog/vim-powerline'
 " ctrlp
 Bundle 'ctrlp.vim'
 Bundle 'nathanaelkane/vim-indent-guides'
 Bundle 'mattn/emmet-vim'
 Bundle 'majutsushi/tagbar'
 Bundle 'fholgado/minibufexpl.vim'
 Bundle 'easymotion/vim-easymotion'
 Bundle 'terryma/vim-multiple-cursors'
 Bundle 'scrooloose/nerdcommenter'
 Bundle 'mbbill/undotree'

 filetype plugin indent on     " required!  
 "  
 " Brief help  
 " :BundleList          - list configured bundles  
 " :BundleInstall(!)    - install(update) bundles  
 " :BundleSearch(!) foo - search(or refresh cache first) for foo  
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles  
 "  
 " see :h vundle for more details or wiki for FAQ  
 " NOTE: comments after Bundle command are not allowed..  

" 树配置
let NERDTreeWinPos='left'
let NERDTreeWinSize=30
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
map <D-1> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif

 " 自动补全配置
set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif    "离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    "回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1    " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2    " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0    " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>    "force recomile with syntastic
"nnoremap <leader>lo :lopen<CR>    "open locationlist
"nnoremap <leader>lc :lclose<CR>    "close locationlist
inoremap <leader><leader> <C-x><C-o>
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0

nnoremap <D-b> :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处

" Powerline
" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'
let g:Powerline_symbols = 'fancy'

"vim-indent-guides
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

" tagbar
nmap <D-7> :TagbarToggle<CR>
""设置tagbar使用的ctags的插件,必须要设置对    
let g:tagbar_ctags_bin='/usr/local/Cellar/ctags/5.8_1/bin/ctags'

" 显示/隐藏 MiniBufExplorer 窗口
map <Leader>bl :MBEToggle<cr>
" buffer 切换快捷键
map <C-Tab> :MBEbn<cr>
map <C-S-Tab> :MBEbp<cr>

