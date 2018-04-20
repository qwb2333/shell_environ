" 设置行数
set nu

" 开启高亮
syntax on
let python_highlight_all=1


" 开启文件检查
filetype on
filetype plugin on

" 当前行下加一条线
set cursorline

colorscheme torte

" 设置编码为utf-8
set encoding=utf-8

" insert模式时,退格不会出问题
set nocompatible
set backspace=indent,eol,start
set hlsearch "设置搜索加亮
set ignorecase

set autoindent " 自动缩进
set smartindent " 智能缩进
" set cindent " C系列缩进, 感觉不开效果会更好一些
set softtabstop=4 "缩进长度
set shiftwidth=4 "缩进长度
set tabstop=4 "tab键长度
set expandtab "tab设为空格

" 设置单词的间隙字符
set whichwrap=b,s,<,>,[,] "


" 首先,mkdir ~/.vim/bundle
" 然后git clone https://github.com/gmarik/Vundle.vim.git
" 再添加下面这部分,在vim中输入:PluginInstall安装插件
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator' " config_gen.py用于生成.ycmextra_conf.py文件
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim' " 用于python代码的自动缩进
Plugin 'scrooloose/nerdtree' " 增强侧栏
Plugin 'scrooloose/nerdcommenter' " leader+cc注释,leader+cu解除
Plugin 'SirVer/ultisnips'
Plugin 'vim-airline/vim-airline'
Plugin 'airblade/vim-gitgutter'
call vundle#end()


let g:gitgutter_terminal_reports_focus=0
let mapleader=";" "自定义前缀键


" 设置nerdTree快捷键
map <C-e> :NERDTreeToggle<CR>


set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    "回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"youcompleteme  默认tab  s-tab 和自动补全冲突
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2 " 从第2个键入字符就开始罗列匹配项
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
let g:ycm_semantic_triggers = { 
        \     'c' : ['->', '  ', '.', ' ', '(', '[', '&'],
        \     'cpp,objcpp' : ['->', '.', ' ', '(', '[', '&', '::'],
        \     'perl' : ['->', '::', ' '],
        \     'php' : ['->', '::', '.'],
        \     'cs,java,javascript,d,vim,python,perl6,scala,vb,elixir,go' : ['.'],
        \     'ruby' : ['.', '::'],
        \     'lua' : ['.', ':']
        \ }
let g:ycm_auto_trigger = 1
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
let g:ycm_autoclose_preview_window_after_completion = 1 
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_enable_diagnostic_signs = 0
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F4> :YcmDiags<CR>

" vim里,窗口之间的移动
map <C-j> <C-w>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <leader>" :sp<CR>
map <leader>% :vsp<CR>
map <leader>s :w<CR>
map <leader>q :q!<CR>
map <leader>e :e<CR>
map <leader>w :wq!<CR>

" 按leader+Q 调用astyle格式化代码
map <leader>format :call FormatCode()<CR>
func FormatCode()
    exec "w"
    if &filetype == 'c' || &filetype == 'h' || &filetype == 'cpp' || &filetype == 'cc'
        exec "%! astyle -A2 -p -N -Y -o -N -k3 -s4"
    endif
endfunc

let g:hlsearch_status = 1
map <leader>hl :call FuncHlsearchToggle()<CR>
func FuncHlsearchToggle()
    if g:hlsearch_status == 1
        :set nohlsearch
        let g:hlsearch_status = 0
    else
        :set hlsearch
        let g:hlsearch_status = 1
    endif
endfunc

let g:number_status = 1
map <leader>n :call NumberToggle()<CR>
func NumberToggle()
    if g:number_status == 1
        :set nonu
        :GitGutterDisable
        let g:number_status = 0
    else
        :set nu
        :GitGutterEnable
        let g:number_status = 1
    endif
endfunc

" 设置paste的快捷键
let g:paste_status = 0
map <leader>p :call PasteToggle()<CR>
func PasteToggle()
    if g:paste_status == 1
        :set nopaste
        let g:paste_status = 0
    else
        :set paste
        let g:paste_status = 1
    endif
endfunc

" 括号补全
inoremap ( ()<ESC>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { {}<ESC>i
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ []<ESC>i
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
inoremap <CR> <c-r>=CROption()<CR>
func! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunc

func CROption()
    if &filetype != 'c'&& &filetype != 'cpp' && &filetype != 'h' && &filetype != 'cc'
        return "\<CR>"
    endif

    let line = getline('.')
    let len = strlen(line)
    let pos = col('.')
    if pos - 2 < 0 || pos - 1 >= len
        return "\<CR>"
    elseif line[pos - 2] == '{' && line[pos - 1] == '}'
        return "\<CR>\<CR>\<BS>\<UP>\<ESC>A"
    else
        return "\<CR>"
    endif
return "\<CR>"
endfunc
