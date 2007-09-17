createIcon <- function(InstallRoot, ApplData, Location){
    tmpfile <- paste(tempfile(), "vbs", sep=".")
    ico <- normalizePath(file.path(system.file(package="RWinEdt"), "PlugIn", "R-WinEdt.ico"))

    ## constructing temporary VB script to add a link:
    write(c('set WshShell = WScript.CreateObject("WScript.Shell")',
            paste('where = WshShell.SpecialFolders(', dQuote(Location), ')', sep = ""),
            'set oShellLink = WshShell.CreateShortcut(where & "\\RWinEdt.lnk")',
            paste('oShellLink.TargetPath =', dQuote(normalizePath(file.path(InstallRoot, "WinEdt.exe")))),
            paste('oShellLink.IconLocation =', dQuote(paste(ico, ", 0", sep = ""))),
            'oShellLink.Description = "RWinEdt"',
            paste('oShellLink.WorkingDirectory =', dQuote(normalizePath(getwd()))),
            paste('oShellLink.Arguments = "-E="&chr(34)&', dQuote(normalizePath(file.path(ApplData, "R.ini"))), 
                '&chr(34)&" "&"-C="&chr(34)&"R-WinEdt"&chr(34)', sep=""),
            'oShellLink.Save'), 
        file = tmpfile)
    shell(tmpfile)
}
