"getWinEdt" <-
function(){
    if(registryKeyExists(c("SOFTWARE", "WinEdt"), top = 3)){
        WinEdtReg <- getRegistry(c("SOFTWARE", "WinEdt"), top = 3)
        InstallRoot <- WinEdtReg@values$"Install Root"
        ApplData <- WinEdtReg@values$"ApplData"
    } else{
        if(registryKeyExists(c("SOFTWARE", "WinEdt"), top = 4))
            stop("\n", "Before the first usage, you have to start WinEdt manually one time")
        else
            stop("\n", "WinEdt is not installed properly.", "\n",
                "Either reinstall WinEdt or install R-WinEdt manually as described in the ReadMe")
    }
    if(!is.null(ApplData)){
        ApplData <- file.path(ApplData, "WinEdt", fsep="\\")
    } else
        ApplData <- InstallRoot
    RWinEdtInstalled <- file.exists(file.path(ApplData, "R.ini", fsep = "\\"))
    RWinEdtVersion <- file.exists(file.path(ApplData, "R.ver", fsep = "\\"))
    if(RWinEdtVersion) 
        RWinEdtVersion <- scan(file.path(InstallRoot, "R.ver", fsep = "\\"), quiet = TRUE)
    return(list(InstallRoot = InstallRoot, RWinEdtInstalled = RWinEdtInstalled, 
        RWinEdtVersion = RWinEdtVersion, ApplData = ApplData))
}
