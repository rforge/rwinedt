.onLoad <- function(lib, pkg) require(methods)

.onAttach <- function(lib, pkg) {
    ## we have a NAMESPACE now: .First.lib <- function(lib, pkg) {
    if(.Platform$GUI != "Rgui" || .Platform$OS.type != "windows")
        stop("\nR-WinEdt is designed only for *RGui* on Windows!")
    ## we have a NAMESPACE now: library.dynam("RWinEdt", pkg, lib)
    .gW <- getWinEdt()
    if(!.gW$RWinEdtInstalled) installWinEdt(.gW$InstallRoot, .gW$ApplData)
    .gW <<- .gW <- getWinEdt()
    .rwloc <- file.path(system.file(package="RWinEdt"), "PlugIn")
    if(.gW$RWinEdtVersion != scan(file.path(.rwloc, "R.ver", fsep = "\\"), quiet = TRUE)){
        if("YES" ==
            winDialog(type = "yesno", paste("Looks like you have installed a new Version of R-WinEdt.",
                "\nUser customized settings of R-WinEdt might be lost after upgrade!",
                "\nUpgrade?")))
            installWinEdt(.gW$InstallRoot, .gW$ApplData, force = TRUE)
    }

   if(ismdi()){
        message("    You are running R in MDI mode which is *not*\n",
            "    supported for non-english translations of RGui.\n",
            "    It is recommended to use R in SDI mode which can be\n",
            "    set in the command line or by clicking in the Menu:\n",
            "    Edit - GUI Preferences: SDI, then Save and restart R.")
        file.copy(file.path(.rwloc, "send2R--mdi.edt"), 
            file.path(.gW$ApplData, "send2R.edt", fsep = "\\"), overwrite = TRUE)
    } else
        file.copy(file.path(.rwloc, "send2R--sdi.edt"), 
            file.path(.gW$ApplData, "send2R.edt", fsep = "\\"), overwrite = TRUE)
   
    winMenuAdd("R-WinEdt")
    winMenuAddItem("R-WinEdt", "Set and start R-WinEdt", "startWinEdt(.gW$InstallRoot, .gW$ApplData)")
    ## internal pager seems to be better:
    ## winMenuAddItem("R-WinEdt", "Set WinEdt as pager", "options(pager = options('editor')[[1]])")
    winMenuAddItem("R-WinEdt", "Reset R-WinEdt settings", "installWinEdt(.gW$InstallRoot, .gW$ApplData, force = NULL)")
    options(editor = paste("\"", .gW$InstallRoot, 
        "\\WinEdt.exe\" -c=\"R-Editor\" -e=R.ini -V", sep = ""))
    shell(paste('""', .gW$InstallRoot, '\\WinEdt.exe" -C="R-WinEdt" -E=', 
        shQuote(normalizePath(file.path(.gW$ApplData, "R.ini"))), '"', sep = ""), wait = FALSE)
}
