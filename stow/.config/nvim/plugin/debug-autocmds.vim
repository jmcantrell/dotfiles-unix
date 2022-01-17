if exists("g:loaded_debugautocmds")
    finish
endif

let g:loaded_debugautocmds = 1

function s:DebugAutocmd(name)
    let msg = join([
        \ 'Type: '.a:name,
        \ 'File: '.expand('<afile>'),
        \ 'Buf: '.expand('<abuf>'),
        \ 'Match: '.expand('<amatch>')
        \ ], ', ')
    exec 'au '.a:name.' * echomsg "'.msg.'"'
endfunction

function DebugAutocmdsOn()
    let types = [
        \ 'BufAdd', 'BufHidden', 'BufNew',
        \ 'BufDelete', 'BufWipeout', 'BufUnload',
        \ 'BufEnter', 'BufLeave',
        \ 'BufFilePre', 'BufFilePost',
        \ 'BufNewFile',
        \ 'BufReadPre', 'BufReadPost', 'BufReadCmd',
        \ 'BufWinEnter', 'BufWinLeave',
        \ 'BufWritePre', 'BufWritePost', 'BufWriteCmd',
        \ 'CmdwinEnter', 'CmdwinLeave',
        \ 'ColorScheme',
        \ 'CursorHold', 'CursorHoldI',
        \ 'CursorMoved', 'CursorMovedI',
        \ 'EncodingChanged',
        \ 'FileAppendPre', 'FileAppendPost', 'FileAppendCmd',
        \ 'FileChangedShell', 'FileChangedShellPost', 'FileChangedRO',
        \ 'FileReadPre', 'FileReadPost', 'FileReadCmd',
        \ 'FileType',
        \ 'FileWritePre', 'FileWritePost', 'FileWriteCmd',
        \ 'FilterReadPre', 'FilterReadPost',
        \ 'FilterWritePre', 'FilterWritePost',
        \ 'FocusGained', 'FocusLost',
        \ 'FuncUndefined',
        \ 'InsertEnter', 'InsertChange', 'InsertLeave',
        \ 'MenuPopup',
        \ 'QuickFixCmdPre', 'QuickFixCmdPost',
        \ 'RemoteReply',
        \ 'SessionLoadPost',
        \ 'ShellCmdPost', 'ShellFilterPost',
        \ 'SourcePre', 'SourceCmd',
        \ 'SpellFileMissing',
        \ 'StdinReadPre', 'StdinReadPost',
        \ 'SwapExists',
        \ 'Syntax',
        \ 'TabEnter', 'TabLeave',
        \ 'TermChanged', 'TermResponse',
        \ 'User',
        \ 'VimEnter', 'GUIEnter',
        \ 'VimLeavePre', 'VimLeave',
        \ 'VimResized',
        \ 'WinEnter', 'WinLeave',
        \ ]
    augroup DebugAutocmds
        au!
        for type in types
            call s:DebugAutocmd(type)
        endfor
    augroup END
endfunction

function DebugAutocmdsOff()
    augroup DebugAutocmds
        au!
    augroup END
endfunction

function DebugAutocmdsToggle()
    if exists("s:state") && s:state == 'on'
        call DebugAutocmdsOff
    else
        call DebugAutocmdsOn
    endif
endfunction

command -bar DebugAutocmdsOn call DebugAutocmdsOn()
command -bar DebugAutocmdsOff call DebugAutocmdsOff()
command -bar DebugAutocmdsToggle call DebugAutocmdsToggle()
