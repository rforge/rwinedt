"installWinEdt" <-
function(InstallRoot, ApplData, force = FALSE){
    if(is.null(force)){
        force <- "YES" == winDialog(type = "yesno", 
            paste("User customized settings of R-WinEdt might be lost after resetting!\nReset?"))
    }
    rwloc <- normalizePath(file.path(system.file(package="RWinEdt"), "PlugIn"))
    
    dirCreated <- dir.create(paste(InstallRoot, "\\macros\\R", sep = ""))
    if(!(dirCreated || force))
        stop(paste("You need Administrator privileges the first time you run RWinEdt.",
                   "On Windows versions later than XP, please restart R by right click",
                   "and select 'Run as administrator'.", sep="\n"))
    for(i in dir(rwloc, "\\.edt$"))
        file.copy(file.path(rwloc, i, fsep = "\\"), 
            file.path(InstallRoot, "macros", "R", i, fsep = "\\"), overwrite = force)
    for(i in dir(rwloc, "^R\\."))
        file.copy(file.path(rwloc, i, fsep = "\\"), 
            file.path(InstallRoot, i, fsep = "\\"), overwrite = force)
    file.copy(file.path(rwloc, "send2R.edt", fsep = "\\"), 
        file.path(InstallRoot, "send2R.edt", fsep = "\\"), overwrite = force)
    for(i in dir(rwloc, "\\.bmp$"))
        file.copy(file.path(rwloc, i, fsep = "\\"), 
            file.path(InstallRoot, "bitmaps", "buttons", i, fsep = "\\"), overwrite = force)
    for(i in dir(rwloc, "^R_"))
        file.copy(file.path(rwloc, i, fsep = "\\"), 
            file.path(InstallRoot, "bitmaps", "images", i, fsep = "\\"), overwrite = force)

    if(!missing(ApplData)){
        for(i in dir(rwloc, "^R\\."))
            file.copy(file.path(rwloc, i, fsep = "\\"), 
                file.path(ApplData, i, fsep = "\\"), overwrite = force)
        file.copy(file.path(rwloc, "send2R.edt", fsep = "\\"), 
            file.path(ApplData, "send2R.edt", fsep = "\\"), overwrite = force)
    }

    ## some helper function for constructing links:
        createIcon <- function(InstallRoot, ApplData, Location){
            tmpfile <- paste(tempfile(), "vbs", sep=".")
            ico <- normalizePath(file.path(system.file(package="RWinEdt"), "PlugIn", "R-WinEdt.ico"))
        
            ## constructing temporary VB script to add a link:
            write(c('set WshShell = WScript.CreateObject("WScript.Shell")',
                    paste('where = WshShell.SpecialFolders(', shQuote(Location), ')', sep = ""),
                    'set oShellLink = WshShell.CreateShortcut(where & "\\RWinEdt.lnk")',
                    paste('oShellLink.TargetPath =', shQuote(normalizePath(file.path(InstallRoot, "WinEdt.exe")))),
                    paste('oShellLink.IconLocation =', shQuote(paste(ico, ", 0", sep = ""))),
                    'oShellLink.Description = "RWinEdt"',
                    paste('oShellLink.WorkingDirectory =', shQuote(normalizePath(getwd()))),
                    paste('oShellLink.Arguments = "-E="&chr(34)&', shQuote(normalizePath(file.path(ApplData, "R.ini"))), 
                        '&chr(34)&" "&"-C="&chr(34)&"R-WinEdt"&chr(34)', sep=""),
                    'oShellLink.Save'), 
                file = tmpfile)
            shell.exec(tmpfile)
        }

    icon <- character(0)
    ## Statmenu icon?
    icon <- if("YES" == winDialog(type = "yesno", "Create a StartMenu icon?"))
                "StartMenu"
    ## Desktop icon?
    icon <- if("YES" == winDialog(type = "yesno", "Create a Desktop icon?"))
                c(icon, "Desktop")
    for(i in icon){
        createIcon(InstallRoot, ApplData, i)
    }
}
