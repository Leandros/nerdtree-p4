if exists("g:loaded_nerdtree_perforce")
    finish
endif
let g:loaded_nerdtree_perforce = 1


" NERDTree menu
call NERDTreeAddMenuSeparator()

call NERDTreeAddMenuItem({
            \ 'text': 'p4 (e)dit',
            \ 'shortcut': 'e',
            \ 'callback': 'NERDTree_p4edit' })

call NERDTreeAddMenuItem({
            \ 'text': 'p4 (r)evert',
            \ 'shortcut': 'r',
            \ 'callback': 'NERDTree_p4revert' })

call NERDTreeAddMenuItem({
            \ 'text': 'p4 (a)dd',
            \ 'shortcut': 'a',
            \ 'callback': 'NERDTree_p4add' })

call NERDTreeAddMenuItem({
            \ 'text': 'p4 (d)delete',
            \ 'shortcut': 'd',
            \ 'callback': 'NERDTree_p4delete' })


" Functions
function! NERDTree_p4edit()
    let currentNode = g:NERDTreeFileNode.GetSelected()
:   exec '!p4 edit '.shellescape(currentNode.path.str())
    call currentNode.refresh()
    call b:NERDTree.render()
endfunction

function! NERDTree_p4revert()
    let currentNode = g:NERDTreeFileNode.GetSelected()
:   exec '!p4 revert '.shellescape(currentNode.path.str())
    call currentNode.refresh()
    call b:NERDTree.render()
endfunction

function! NERDTree_p4add()
    let currentNode = g:NERDTreeFileNode.GetSelected()
:   exec '!p4 add '.shellescape(currentNode.path.str())
    call currentNode.refresh()
    call b:NERDTree.render()
endfunction

function! NERDTree_p4delete()
    let currentNode = g:NERDTreeFileNode.GetSelected()
:   exec '!p4 delete '.shellescape(currentNode.path.str())
    call currentNode.refresh()
    call b:NERDTree.render()
endfunction

