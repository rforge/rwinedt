startWinEdt <- function(InstallRoot, ApplData){
    system(paste('"', InstallRoot, '\\WinEdt.exe" -C="R-WinEdt" -E=', 
                 dQuote(normalizePath(file.path(ApplData, "R.ini"))), sep = ""), 
           wait = FALSE)
}
