vim.g.dashboard_default_executive = "telescope"
vim.g.dashboard_footer_icon = "🤖 "
vim.cmd [[
  let g:dashboard_custom_header=[
    \'',
    \'    ████▌█████▌█ ████████▐▀██▀    ',
    \'  ▄█████ █████▌ █ ▀██████▌█▄▄▀▄   ',
    \'  ▌███▌█ ▐███▌▌  ▄▄ ▌█▌███▐███ ▀  ',
    \' ▐ ▐██  ▄▄▐▀█   ▐▄█▀▌█▐███▐█      ',
    \'   ███ ▌▄█▌  ▀  ▀██  ▀██████▌     ',
    \'    ▀█▌▀██▀ ▄         ███▐███     ',
    \'     ██▌             ▐███████▌    ',
    \'     ███     ▀█▀     ▐██▐███▀▌    ',
    \'     ▌█▌█▄         ▄▄████▀ ▀      ',
    \'       █▀██▄▄▄ ▄▄▀▀▒█▀█           ',
    \'',
    \]
]]
vim.g.indentLine_fileTypeExclude = "dashboard"
-- autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2
