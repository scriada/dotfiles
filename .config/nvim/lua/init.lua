require'lspconfig'.matlab_ls.setup{
    cmd = { 'matlab-language-server', '--stdio' },
    filetypes = {'matlab'},
    settings = {
        matlab = {
            indexWorkspace = false,
            installPath = '/usr/local/MATLAB/R2024a',
            matlabConnectionTiming = 'onStart',
            telemetry = true,
        },
    },
}
