" read through his file and change what you need to change

let g:python_host_prog='/usr/local/bin/python2'
let g:python3_host_prog='/usr/local/bin/python3'
let g:ruby_host_prog='/usr/bin/ruby'

" let g:mkdp_browser = 'chromium'
function! g:Open_browser(url)
    silent exe 'silent !open -a "Google Chrome" ' . a:url
endfunction
let g:mkdp_browserfunc = 'g:Open_browser'
