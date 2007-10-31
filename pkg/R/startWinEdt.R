startWinEdt <- function(InstallRoot, ApplData){
    shell(paste('""', InstallRoot, '\\WinEdt.exe" -C="R-WinEdt" -E=', 
                 shQuote(normalizePath(file.path(ApplData, "R.ini"))), '"', sep = ""), 
           wait = FALSE)
}
