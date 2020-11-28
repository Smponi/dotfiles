let g:neotex_delay = 500
function OpenPDFReader()
    let l:PDFFile = expand('%:p:r') . '.pdf'
    execute "NeoTexOn"
    execute "!" . "zathura --fork " . l:PDFFile
endfunction



