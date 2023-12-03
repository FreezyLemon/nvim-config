function! utils#Get_titlestr() abort
  let l:title_str = hostname() . '  '
  let l:buf_path = expand('%:p:~')
  let l:title_str = l:title_str . l:buf_path . '  '
  if &buflisted && l:buf_path != ""
    let l:title_str = l:title_str . strftime('%Y-%m-%d %H:%M:%S%z', getftime(expand('%')))
  endif

  return l:title_str
endfunction
