"getWinEdt" <-
function(){
    WinEdtRegistryKey <- file.path("SOFTWARE", "WinEdt", fsep="\\")
    WinEdtReg <- try(readRegistry(WinEdtRegistryKey, hive = "HCU", maxdepth = 1), silent = TRUE)
    if(!inherits(WinEdtReg, "try-error")){
        InstallRoot <- WinEdtReg[["Install Root"]]
        ApplData <- WinEdtReg[["ApplData"]]
    } else{
        temp <- try(readRegistry(WinEdtRegistryKey, hive = "HLM", maxdepth = 1), silent = TRUE)    
        temp2 <- try(readRegistry(file.path("SOFTWARE", "Team WinEdt", fsep="\\"), hive = "HLM", maxdepth = 1), silent = TRUE)    
        if(!(inherits(temp, "try-error") && inherits(temp2, "try-error")))
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
    RWinEdtVersion <- file.exists(file.path(InstallRoot, "R.ver", fsep = "\\"))
    if(RWinEdtVersion) 
        RWinEdtVersion <- scan(file.path(InstallRoot, "R.ver", fsep = "\\"), quiet = TRUE)
    return(list(InstallRoot = InstallRoot, RWinEdtInstalled = RWinEdtInstalled, 
        RWinEdtVersion = RWinEdtVersion, ApplData = ApplData))
}
