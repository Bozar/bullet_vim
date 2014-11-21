" bullet.vim "{{{1

" Last Update: Nov 21, Fri | 21:53:44 | 2014

" summary "{{{2

" License: GPL v2
" Author: Bozar

" Vim global plugin

" substitute characters with bullet points
" format paragraph/fold block/whole text

 "}}}2
" load & cpoptions "{{{2

if !exists('g:Loaded_Bullet')

    let g:Loaded_Bullet = 0

endif

if g:Loaded_Bullet > 0

    finish

endif

let g:Loaded_Bullet = 1

let s:Save_cpo = &cpoptions
set cpoptions&vim

 "}}}2
" variables "{{{2

" list character "{{{3

if !exists('g:StrListBefore_Bullet')

    let g:StrListBefore_Bullet = ''

endif

if !exists('g:StrListAfter_Bullet')

    let g:StrListAfter_Bullet = ''

endif

if !exists('g:StrParaBefore_Bullet')

    let g:StrParaBefore_Bullet = ''

endif

 "}}}3
" sublist character "{{{3

if !exists('g:StrSubListBefore_Bullet')

    let g:StrSubListBefore_Bullet = ''

endif

if !exists('g:StrSubListAfter_Bullet')

    let g:StrSubListAfter_Bullet = ''

endif

if !exists('g:StrSubParaBefore_Bullet')

    let g:StrSubParaBefore_Bullet = ''

endif

 "}}}3
" list pattern "{{{3

if !exists('g:PatListBefore_Bullet')

    let g:PatListBefore_Bullet = ''

endif

if !exists('g:PatListAfter_Bullet')

    let g:PatListAfter_Bullet = ''

endif

if !exists('g:PatParaBefore_Bullet')

    let g:PatParaBefore_Bullet = ''

endif

if !exists('g:PatParaAfter_Bullet')

    let g:PatParaAfter_Bullet = ''

endif

 "}}}3
" sublist pattern "{{{3

if !exists('g:PatSubListBefore_Bullet')

    let g:PatSubListBefore_Bullet = ''

endif

if !exists('g:PatSubListAfter_Bullet')

    let g:PatSubListAfter_Bullet = ''

endif

if !exists('g:PatSubParaBefore_Bullet')

    let g:PatSubParaBefore_Bullet = ''

endif

if !exists('g:PatSubParaAfter_Bullet')

    let g:PatSubParaAfter_Bullet = ''

endif

 "}}}3
" text width "{{{3

if !exists('g:TextWidth_Bullet')

    let g:TextWidth_Bullet = ''

endif

 "}}}3
" format options "{{{3

if !exists('g:FormatOptionsOverwrite_Bullet')

    let g:FormatOptionsOverwrite_Bullet = ''

endif

if !exists('g:SwitchFormatOptionsPut_Bullet')

    let g:SwitchFormatOptionsPut_Bullet = ''

endif

 "}}}3
" comments "{{{3

if !exists('g:CommentsOverwrite_Bullet')

    let g:CommentsOverwrite_Bullet = ''

endif

if !exists('g:CommentsAdd_Bullet')

    let g:CommentsAdd_Bullet = ''

endif

if !exists('g:StrComEnd_Bullet')

    let g:StrComEnd_Bullet = ''

endif

if !exists('g:PatComEnd_Bullet')

    let g:PatComEnd_Bullet = ''

endif

 "}}}3
" protect lines "{{{3

if !exists('g:PatProtectOverwrite_Bullet')

    let g:PatProtectOverwrite_Bullet = ''

endif

if !exists('g:PatProtectAdd_Bullet')

    let g:PatProtectAdd_Bullet = ''

endif

if !exists('g:StrProtect_Bullet')

    let g:StrProtect_Bullet = ''

endif

 "}}}3
" autocommands "{{{3

if !exists('g:SwitchAuto_Bullet')

    let g:SwitchAuto_Bullet = ''

endif

if !exists('g:PatFile_Bullet')

    let g:PatFile_Bullet = ''

endif

 "}}}3
" load delete-space functions "{{{3

" load space#DelSpaceTrail()

if !exists('g:SwitchDelSpaceTrail_Bullet')

    let g:SwitchDelSpaceTrail_Bullet = ''

endif

" load space#DelSpaceCJK()

if !exists('g:SwitchDelSpaceCJK_Bullet')

    let g:SwitchDelSpaceCJK_Bullet = ''

endif

 "}}}3
" placeholder "{{{3

if !exists('g:StrMark_Bullet')

    let g:StrMark_Bullet = ''

endif

 "}}}3
 "}}}2
" function "{{{2

" parts "{{{3

function s:LoadBullets() "{{{4

    " list character, before

    if g:StrListBefore_Bullet != ''

        let s:StrListBefore =
        \ g:StrListBefore_Bullet

    else

        let s:StrListBefore = '='

    endif

    " list character, after

    if g:StrListAfter_Bullet != ''

        let s:StrListAfter =
        \ g:StrListAfter_Bullet

    else

        let s:StrListAfter = '*'

    endif

    " para character, before

    if g:StrParaBefore_Bullet != ''

        let s:StrParaBefore =
        \ g:StrParaBefore_Bullet

    else

        let s:StrParaBefore = '-'

    endif

    " sub-list character, before

    if g:StrSubListBefore_Bullet != ''

        let s:StrSubListBefore =
        \ g:StrSubListBefore_Bullet

    else

        let s:StrSubListBefore = '=='

    endif

    " sub-list character, after

    if g:StrSubListAfter_Bullet != ''

        let s:StrSubListAfter =
        \ g:StrSubListAfter_Bullet

    else

        let s:StrSubListAfter = '+'

    endif

    " sub-para character, before

    if g:StrSubParaBefore_Bullet != ''

        let s:StrSubParaBefore =
        \ g:StrSubParaBefore_Bullet

    else

        let s:StrSubParaBefore = '--'

    endif

    " list pattern, before

    if g:PatListBefore_Bullet != ''

        let s:PatListBefore =
        \ g:PatListBefore_Bullet

    else

        let s:PatListBefore = '^\s*=\(=\)\@!\s*'

    endif

    " list pattern, after

    if g:PatListAfter_Bullet != ''

        let s:PatListAfter =
        \ g:PatListAfter_Bullet

    else

        let s:PatListAfter = '    *   '

    endif

    " para pattern, before

    if g:PatParaBefore_Bullet != ''

        let s:PatParaBefore =
        \ g:PatParaBefore_Bullet

    else

        let s:PatParaBefore = '^\s*-\(-\)\@!\s*'

    endif

    " para pattern, after

    if g:PatParaAfter_Bullet != ''

        let s:PatParaAfter =
        \ g:PatParaAfter_Bullet

    else

        let s:PatParaAfter = '        '

    endif

    " sub-list pattern, before

    if g:PatSubListBefore_Bullet != ''

        let s:PatSubListBefore =
        \ g:PatSubListBefore_Bullet

    else

        let s:PatSubListBefore =
        \ '^\s*==\(=\)\@!\s*'

    endif

    " sub-list pattern, after

    if g:PatSubListAfter_Bullet != ''

        let s:PatSubListAfter =
        \ g:PatSubListAfter_Bullet

    else

        let s:PatSubListAfter = '        +   '

    endif

    " sub-para pattern, before

    if g:PatSubParaBefore_Bullet != ''

        let s:PatSubParaBefore =
        \ g:PatSubParaBefore_Bullet

    else

        let s:PatSubParaBefore =
        \ '^\s*--\(-\)\@!\s*'

    endif

    " sub-para pattern, after

    if g:PatSubParaAfter_Bullet != ''

        let s:PatSubParaAfter =
        \ g:PatSubParaAfter_Bullet

    else

        let s:PatSubParaAfter = '            '

    endif

    let s:PatSearch =
    \ s:PatListBefore . '\|' .
    \ s:PatParaBefore . '\|' .
    \ s:PatSubListBefore . '\|' .
    \ s:PatSubParaBefore

endfunction "}}}4

function s:LoadStrings() "{{{4

    " put &formatoptions into register

    if g:SwitchFormatOptionsPut_Bullet > 0

        let s:SwitchFormatOptionsPut = 1

    else

        let s:SwitchFormatOptionsPut = 0

    endif

    " comment end character

    if g:StrComEnd_Bullet != ''

        let s:StrComEnd = g:StrComEnd_Bullet

    else

        let s:StrComEnd = '/'

    endif

    " comment end pattern

    if g:PatComEnd_Bullet != ''

        let s:PatComEnd = g:PatComEnd_Bullet

    else

        let s:PatComEnd = '\s*\/\s*'

    endif

    " protection characters
    " such strings will appear in comments
    " as well

    if g:StrProtect_Bullet != ''

        let s:StrProtect =
        \ g:StrProtect_Bullet

    else

        let s:StrProtect = '@'

    endif

    " protection patterns

    if g:PatProtectOverwrite_Bullet != ''

        let s:PatProtectFinal =
        \ g:PatProtectOverwrite_Bullet .
        \ g:PatProtectAdd_Bullet

    else

        let s:PatProtectOrigin = '\(\({\{3}'
        let s:PatProtectOrigin .=  '\|}\{3}\)'
        let s:PatProtectOrigin .= '\d\{0,2}$\)'

        let s:PatProtectFinal =
        \ s:PatProtectOrigin .
        \ g:PatProtectAdd_Bullet

    endif

    " load space#DelSpaceTrail()

    if g:SwitchDelSpaceTrail_Bullet < 0

        let s:SwitchDelSpaceTrail = 0

    else

        let s:SwitchDelSpaceTrail = 1

    endif

    " load space#DelSpaceCJK()

    if g:SwitchDelSpaceCJK_Bullet < 0

        let s:SwitchDelSpaceCJK = 0

    else

        let s:SwitchDelSpaceCJK = 1

    endif

    " place holder mark

    if g:StrMark_Bullet != ''

        let s:StrMark = g:StrMark_Bullet

    else

        let s:StrMark =
        \ '###LONG_PLACEHOLDER_FOR_BULLET###'

    endif

endfunction "}}}4

function s:LoadSettings(when) "{{{4

    " load settings

    if a:when == 0

        let s:SaveTextWidth = &textwidth
        let s:SaveFormatOptions = &formatoptions
        let s:SaveComments = &comments

        " textwidth

        if g:TextWidth_Bullet > 0

            let &l:textwidth = g:TextWidth_Bullet

        endif

        " formatoptions, overwrite

        if g:FormatOptionsOverwrite_Bullet != ''

            let &l:formatoptions =
            \ g:FormatOptionsOverwrite_Bullet

        else

            let &l:formatoptions = 'tcqro2mB1j'

        endif

        " put &formatoptions into register

        if s:SwitchFormatOptionsPut == 1

            let @" = &l:formatoptions

        endif

        " comments

        " overwrite comment setting

        if g:CommentsOverwrite_Bullet != ''

            let &l:comments =
            \ g:CommentsOverwrite_Bullet

        else

            setl comments=

            " sublist characters, before

            let &l:comments .=
            \ 's:' . s:StrSubListBefore .
            \ ',m:' . s:StrSubParaBefore.
            \ ',ex:' . s:StrComEnd

            " list characters, before

            let &l:comments .=
            \ ',s:' . s:StrListBefore .
            \ ',m:' . s:StrParaBefore .
            \ ',ex:' . s:StrComEnd

            " sublist characters, after

            let &l:comments .=
            \ ',f:' . s:StrSubListAfter

            " list characters, after

            let &l:comments .=
            \ ',f:' . s:StrListAfter

            " protect characters

            let &l:comments .=
            \ ',s:' . s:StrProtect .
            \ ',m:' . s:StrProtect .
            \ ',ex:' . s:StrProtect

        endif

        " add new comments

        let &l:comments .= ',' .
        \ g:CommentsAdd_Bullet

    endif

    " unload settings

    if a:when == 1

        " textwidth

        let &l:textwidth = s:SaveTextWidth

        " formatoptions

        let &l:formatoptions =
        \ s:SaveFormatOptions

        " comments

        let &l:comments = s:SaveComments

    endif

endfunction "}}}4

function s:LoadAll(when) "{{{4

    call <sid>LoadBullets()
    call <sid>LoadStrings()
    call <sid>LoadSettings(a:when)

endfunction "}}}4

function s:DelSpaceTrail() "{{{4

    " delete trailing blank characters: tabs,
    " half-width spaces and full-width spaces
    " NOTE: cursor position must be set first!

    call space#DelSpaceTrail()
    call moveCursor#KeepPos(1)

endfunction "}}}4

function s:DelBullet(when) "{{{4

    " suppose '=' will be replaced with bullet '*'

    " delete lines containing only such characters
    " '^\s*=\s*$' or '^\s*\/\s*$'

    " '/' appears in a three-piece comment
    " which is defined in s:LoadStrings()

    " :help format-comments

    if a:when == 0

        " only bullet

        execute "'j,'ks/\\(" .
        \ s:PatSearch . '\)\(' .
        \ s:PatComEnd . '\|\s*\)$/' .
        \ s:StrMark . '/e'

        " only s:PatComEnd

        execute "'j,'ks/^" . s:PatComEnd . '$/'
        \ s:StrMark . '/e'

        " s:PatComEnd at the end of line

        let l:pattern = '\(' . s:PatSearch .
        \ '\).*' . s:PatComEnd . '$'

        call moveCursor#GotoColumn1("'j",'str')

        if search(l:pattern,'c',line("'k")) != 0

            execute "'j,'kg/" . s:PatSearch .
            \ '/s/' . s:PatComEnd . '$//'

        endif

    endif

    " delete marked lines after substitution
    " in case line 'j/'k contains mark

    if a:when == 1

        call moveCursor#GotoColumn1("'j",'str')

        if search(s:StrMark,'c',line("'k")) != 0

            execute "'j,'kg/" . s:StrMark .
            \ '/delete'

        endif

    endif

endfunction "}}}4

function s:SubsBulletCore() "{{{4

    " list
    " substitute '=' with '*' and indent 1 tab
    " substitute '-' with '' and indent 1 tab

    execute "'j,'ks/" .
    \ s:PatListBefore .  '/' .
    \ s:PatListAfter . '/e'

    execute "'j,'ks/" .
    \ s:PatParaBefore . '/' .
    \ s:PatParaAfter . '/e'

    " sub list
    " substitute '==' with '+' and indent 2 tabs
    " substitute '--' with '' and indent 2 tabs

    execute "'j,'ks/" .
    \ s:PatSubListBefore . '/' .
    \ s:PatSubListAfter . '/e'

    execute "'j,'ks/" .
    \ s:PatSubParaBefore . '/' .
    \ s:PatSubParaAfter . '/e'

endfunction "}}}4

function s:AutoCommand() "{{{4

    if g:SwitchAuto_Bullet <= 0 ||
    \ g:PatFile_Bullet == ''

        return

    else

        execute 'autocmd BufRead,BufNewFile ' .
        \ g:PatFile_Bullet .
        \ " call <sid>LoadAll(0)"

    endif

endfunction "}}}4

function s:EchoVars(name) "{{{4

    echo a:name . " == '" . eval(a:name) . "'"

endfunction "}}}4

 "}}}3
" main "{{{3

function s:SubsBulletNoTW(range) "{{{4

    call moveCursor#KeepPos(0)
    call <sid>LoadAll(0)
    call <sid>LoadAll(1)

    " delete trailing spaces

    if s:SwitchDelSpaceTrail == 1

        call <sid>DelSpaceTrail()

    endif

    " set mark j & k

    " paragraph

    if a:range == 0

        call moveCursor#SetMarkJKPara()

    " whole text

    elseif a:range == 1

        call moveCursor#SetMarkJKWhole()

    endif

    " mark lines to be deleted

    call <sid>DelBullet(0)

    " substitute bullets

    call <sid>SubsBulletCore()

    " delete marked lines

    call <sid>DelBullet(1)

    " delete spaces between two CJK characters
    " delete spaces between CJK punctuation mark
    " and Western character

    if s:SwitchDelSpaceCJK == 1

        call space#DelSpaceCJK()

    endif

    call moveCursor#KeepPos(1)

endfunction "}}}4

function s:SubsBulletTW(range) "{{{4

    call moveCursor#KeepPos(0)
    call <sid>LoadAll(0)

    " delete trailing spaces

    if s:SwitchDelSpaceTrail == 1

        call <sid>DelSpaceTrail()

    endif

    let l:i = 0

    while 1

        " set mark j & k
        " paragraph

        if a:range == 0

            call moveCursor#SetMarkJKPara()

        " whole text

        elseif a:range == 1

            call moveCursor#SetMarkJKWhole()

        endif

        " substitute bullets once
        " set marks twice (before and after
        " substitution), in case marked lines 'j
        " and 'k are deleted

        if l:i > 0

            break

        endif

        " mark lines to be deleted

        call <sid>DelBullet(0)

        " substitute bullets

        call <sid>SubsBulletCore()

        " delete marked lines

        call <sid>DelBullet(1)

        let l:i = l:i +1

    endwhile

    " protect lines

    call moveCursor#GotoColumn1("'j",'str')

    if search(s:PatProtectFinal,'c',line("'k"))

        execute "'j,'kg/" . s:PatProtectFinal .
        \ '/s/^/' . s:StrProtect . '/'

    endif

    let l:j = 0

    while 1

        " delete spaces between two CJK characters
        " delete spaces between CJK punctuation
        " mark and Western character

        if s:SwitchDelSpaceCJK == 1

            call space#DelSpaceCJK()

        endif

        if l:j > 0

            break

        endif

        " format

        if a:range == 0

            execute "normal 'jgqip"

        elseif a:range == 1

            execute "normal gggqG"

        endif

        " unprotect lines

        if a:range == 0

            call moveCursor#SetMarkJKPara()

        elseif a:range == 1

            call moveCursor#SetMarkJKWhole()

        endif

        execute "'j,'ks/^" . s:StrProtect . '//e'

        let l:j = l:j +1

    endwhile

    " unload settings

    call <sid>LoadAll(1)

    " reset cursor position

    call moveCursor#KeepPos(1)

endfunction "}}}4

function s:EchoSettings() "{{{4

    call <sid>LoadAll(0)

    let l:format = "&formatoptions == '"
    let l:options = &formatoptions

    let l:text = "&textwidth == '"
    let l:width = &textwidth

    let l:com = "&comments == '"
    let l:ments = &comments

    " NOTE: Reload default settings before echoing
    " lines.

    " If the number of lines to be echohed are
    " greater than the screen height, and user
    " break the 'echo function' half-way,

    " Vim will not process the unechoed part.

    " Such as lines to be echoed and functions to
    " be called.

    call <sid>LoadAll(1)

    let l:put = 'Put &formatoptions into'
    let l:put .= ' register @": '

    if s:SwitchFormatOptionsPut == 1

        let l:register = 'YES'

    elseif s:SwitchFormatOptionsPut == 0

        let l:register = 'NO'

    endif

    let l:auto =  'Auto load bullet settings: '

    if g:SwitchAuto_Bullet > 0
    \ && g:PatFile_Bullet != ''

        let l:command = 'YES'

    else

        let l:command = 'NO'

    endif

    let l:del = 'Delete trailing spaces: '

    if s:SwitchDelSpaceTrail == 1

        let l:space = 'YES'

    elseif s:SwitchDelSpaceTrail == 0

        let l:space = 'NO'

    endif

    let l:cjk = 'Delete spaces between two CJK'
    let l:cjk .= ' characters: '

    let l:punc = 'Delete spaces between CJK'
    let l:punc .= ' punctuation mark'

    let l:tuation = 'and western character: '

    if s:SwitchDelSpaceCJK == 1

        let l:western = 'YES'

    elseif s:SwitchDelSpaceCJK == 0

        let l:western = 'NO'

    endif

    echo '=============================='

    echo l:format . l:options . "'"
    echo l:put . l:register

    echo '------------------------------'

    call <sid>EchoVars(
    \'g:FormatOptionsOverwrite_Bullet')

    call <sid>EchoVars(
    \'g:SwitchFormatOptionsPut_Bullet')

    echo '=============================='

    echo l:text . l:width . "'"

    echo '------------------------------'

    call <sid>EchoVars('g:TextWidth_Bullet')

    echo '=============================='

    echo l:com . l:ments . "'"

    echo '------------------------------'

    call <sid>EchoVars(
    \'g:CommentsOverwrite_Bullet')

    call <sid>EchoVars('g:CommentsAdd_Bullet')

    echo '=============================='

    call <sid>EchoVars('&tabstop')

    call <sid>EchoVars('&softtabstop')

    call <sid>EchoVars('&shiftwidth')

    call <sid>EchoVars('&expandtab')

    echo '=============================='

    call <sid>EchoVars('s:PatSearch')

    echo '=============================='

    call <sid>EchoVars('s:StrComEnd')

    echo '------------------------------'

    call <sid>EchoVars('g:StrComEnd_Bullet')

    echo '=============================='

    call <sid>EchoVars('s:PatComEnd')

    echo '------------------------------'

    call <sid>EchoVars('g:PatComEnd_Bullet')

    echo '=============================='

    call <sid>EchoVars('s:StrMark')

    echo '------------------------------'

    call <sid>EchoVars('g:StrMark_Bullet')

    echo '=============================='

    call <sid>EchoVars('s:StrProtect')

    echo '------------------------------'

    call <sid>EchoVars('g:StrProtect_Bullet')

    echo '=============================='

    call <sid>EchoVars('s:PatProtectFinal')

    echo '------------------------------'

    call <sid>EchoVars(
    \'g:PatProtectOverwrite_Bullet')

    call <sid>EchoVars(
    \'g:PatProtectAdd_Bullet')

    echo '=============================='

    echo l:del . l:space

    echo '------------------------------'

    call <sid>EchoVars(
    \'g:SwitchDelSpaceTrail_Bullet')

    echo '=============================='

    echo l:cjk . l:western

    echo l:punc
    echo l:tuation . l:western

    echo '------------------------------'

    call <sid>EchoVars(
    \'g:SwitchDelSpaceCJK_Bullet')

    echo '=============================='

    echo l:auto . l:command

    echo '------------------------------'

    call <sid>EchoVars('g:SwitchAuto_Bullet')

    call <sid>EchoVars('g:PatFile_Bullet')

    echo '=============================='

endfunction "}}}4

function s:EchoBullets() "{{{4

    call <sid>LoadAll(0)
    call <sid>LoadAll(1)

    echo '=============================='

    call <sid>EchoVars('s:StrListBefore')

    call <sid>EchoVars('s:StrListAfter')

    call <sid>EchoVars('s:StrParaBefore')

    echo '------------------------------'

    call <sid>EchoVars('g:StrListBefore_Bullet')

    call <sid>EchoVars('g:StrListAfter_Bullet')

    call <sid>EchoVars('g:StrParaBefore_Bullet')

    echo '=============================='

    call <sid>EchoVars('s:PatListBefore')

    call <sid>EchoVars('s:PatListAfter')

    call <sid>EchoVars('s:PatParaBefore')

    call <sid>EchoVars('s:PatParaAfter')

    echo '------------------------------'

    call <sid>EchoVars('g:PatListBefore_Bullet')

    call <sid>EchoVars('g:PatListAfter_Bullet')

    call <sid>EchoVars('g:PatParaBefore_Bullet')

    call <sid>EchoVars('g:PatParaAfter_Bullet')

    echo '=============================='

    call <sid>EchoVars('s:StrSubListBefore')

    call <sid>EchoVars('s:StrSubListAfter')

    call <sid>EchoVars('s:StrSubParaBefore')

    echo '------------------------------'

    call <sid>EchoVars(
    \ 'g:StrSubListBefore_Bullet')

    call <sid>EchoVars(
    \'g:StrSubListAfter_Bullet')

    call <sid>EchoVars(
    \ 'g:StrSubParaBefore_Bullet')

    echo '=============================='

    call <sid>EchoVars('s:PatSubListBefore')

    call <sid>EchoVars('s:PatSubListAfter')

    call <sid>EchoVars('s:PatSubParaBefore')

    call <sid>EchoVars('s:PatSubParaAfter')

    echo '------------------------------'

    call <sid>EchoVars(
    \ 'g:PatSubListBefore_Bullet')

    call <sid>EchoVars(
    \'g:PatSubListAfter_Bullet')

    call <sid>EchoVars(
    \ 'g:PatSubParaBefore_Bullet')

    call <sid>EchoVars(
    \'g:PatSubParaAfter_Bullet')

    echo '=============================='

endfunction "}}}4

 "}}}3
 "}}}2
" commands "{{{2

autocmd VimEnter * call <sid>AutoCommand()

if !exists(':BuPara0TW')

    command BuPara0TW call <sid>SubsBulletTW(0)

endif

if !exists(':BuPara1NoTW')

    command BuPara1NoTW
    \ call <sid>SubsBulletNoTW(0)

endif

if !exists(':BuWhole0TW')

    command BuWhole0TW call <sid>SubsBulletTW(1)

endif

if !exists(':BuWhole1NoTW')

    command BuWhole1NoTW
    \ call <sid>SubsBulletNoTW(1)

endif

if !exists(':BuEcho0Set')

    command BuEcho0Set call <sid>EchoSettings()

endif

if !exists(':BuEcho1Bullet')

    command BuEcho1Bullet call <sid>EchoBullets()

endif

 "}}}2
" cpotions "{{{2

let &cpoptions = s:Save_cpo
unlet s:Save_cpo

 "}}}2
" vim: set fdm=marker fdl=20 tw=50: "}}}1
