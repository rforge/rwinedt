==========================================================================================
Using WinEdt as an editor for R         *** R-WinEdt 1.7-6 ***                  13.09.2007
==========================================================================================

Overview:
---------

  Using WinEdt as an editor for R (only Rgui in sdi mode under Windows).



Features:
---------

  - Syntax-Highlighting  (and highlighted printing)
    (function index of all "base" and "recommended" packages, including:
        base  boot  class  cluster  datasets  foreign  graphics  grDevices  grid  KernSmooth  lattice
        MASS  methods  mgcv  nlme  nnet  rpart  spatial  splines  stats  stats4  survival
        tcltk  tools  utils
     last update: 15.04.2005, R-2.1.0).

  - Many R functions at the same time in the same editor.

  - Buttons / Shortcuts for simple access (one click) to:

    - Save document and source(.) into R.

    - Submit script to R (WinEdt as scripting window)

    - Paste selected code from WinEdt directly to R (e.g. from history)
      or just evaluate the current line

    - Open (and update) .Rhistory (so you can reuse your last commands).

  - Templates, e.g.: for(_ in _){_}

  - Faster starting than with standard configuration (of WinEdt).

  - Features of WinEdt (e.g. Delimiter Check, advanced searching, bookmarks, 
    macros, blockwise indents and comments (#), ...).

  - Independent of another WinEdt running with "LaTeX-configuration".

  - Works with RGui *in SDI mode* and also with S-PLUS (not supported!).
    R's MDI mode is *not* supported for non-english translations of RGui.



Installation:
-------------

  - Install R (R-2.4.0 or later)

  - Install WinEdt 5 (V. 5.2, Build: 20001213 or later)
    Note: WinEdt is Shareware (http://www.winedt.com).

  - Now, there are two ways, the first one (a) is recommended: 

  a) Installation as an R package:

    - Simply use install.packages("RWinEdt") with your favourite CRAN mirror.

    - RGui in MDI mode is *not* supported for non-english translations of RGui.
      It is recommended to use R in SDI mode which can be set in the command line 
      or by clicking in the Menu: Edit - GUI Preferences: SDI, then Save and restart R.

    - All further steps will be done automatically by typing 
          > library(RWinEdt) 
      in the R Console.
      (R-WinEdt will be started, and an additional menu "R-WinEdt" will be created.)

    - After upgrading from an old R-WinEdt installation, the user will be asked
      whether the upgrade should be performed, because user-customized changes will 
      be lost when replacing the old R.ini file with a new one.

    - The code of the Omegahat package 'SWinRegistry', version 0.3-3,
      has been included completely in RWinEdt as a matter of convenience.
      MANY thanks to the Omegahat developers, in particlular Duncan Temple Lang!



    Examples:

    ###### Recommended procedure:
    ## Load the package:
	library(RWinEdt)	# within R!
    ## Then create a new document and write an R function.
    ## Click on the symbol "R source" or press ALT+S.
    ## You will be asked to specify a filename (e.g. "R-prog1.R").
    ## If RGui is running, it will be focussed and source(.) will be called.

    ######
    ## The following way to edit function is possible, but *not* recommended:
     my.legend <- legend
     fix(my.legend)



  b) Alternative: Manual installation procedure

    - Unzip the archive and copy the sub-directory PlugIn into directory 
      ....\winedt\plugins
      (e.g. "c:\program files\winedt team\winedt\plugins\PlugIn")

    - In your Windows-Explorer double-click on "install.bat".

    - If you have a personal profile for WinEdt, you might need to copy R.* into this
      personal profile folder, as well as send2R.edt.

    - If you are running RGui in single windows style (SDI), the default mode should be 
      unchanged. For RGui in multiple window style (MDI) or if you want to use R-WinEdt with 
      S-PLUS, you can change the R-WinEdt mode permanently(!) using the Menu, e.g.:  
      R -> Set R --mdi mode
      Note that MDI mode is ONLY supported for english versions of RGui!

    - To invoke R-WinEdt from startmenu or desktop create a shortcut to WinEdt as follows:
      "c:\program files\winedt team\winedt\winedt" -C="R-WinEdt" -e=r.ini
      There is also an icon "R-WinEdt.ico", designed by Erich Neuwirth, available in 
      the archive to prettify the shortcut.

    - In R use something like (for example in your .Rprofile):
       options(editor="\"c:/program files/winedt team/winedt/winedt\" -c=\"R-WinEdt-edit\" -e=r.ini -V") 
       options(pager="\"c:/program files/winedt team/winedt/winedt\" -C=\"R-WinEdt\" -e=r.ini -V")


    Used WinEdt parameters (Remark: There is a difference between -c and -C !):
        -c="name": New instance of WinEdt called "name" will be started.
        -C="name": If an instance "name" of WinEdt is already running, it will be used.
                   So you can run WinEdt as LaTeX and R editor at the same time.
        -e="name": Using "name" as initialization-file.
        -V       : Running in "virgin"-mode

    Examples:

    ###### Recommended procedure:
    ## Open WinEdt with something like:
     "c:\program files\winedt team\winedt\winedt" -C="R-WinEdt" -e=r.ini
    ## i.e. ideally the shortcut you have already created.
    ##
    ## Then create a new document and write an R function.
    ## Click on the symbol "R source" or press ALT+S.
    ## You will be asked to specify a filename (e.g. "R-prog1.R").
    ## If RGui is running, it will be focussed and source(.) will be called.

    ###### 
     options(pager="\"c:/program files/winedt team/winedt/winedt\" -C=\"R-WinEdt\" -e=r.ini -V")
     file.show(".Rhistory")
    ## Mark some lines, click the "R paste" button or use Alt+P as shortcut:
    ## Marked lines will be executed in RGui.

    ######
    ## The following way to edit function is possible, but *not* recommended:
     options(editor="\"c:/program files/winedt team/winedt/winedt\" -c=\"R-WinEdt-edit\" -e=r.ini -V")
     my.legend <- legend
     fix(my.legend)




Known bugs:
-----------

- If RGui is minimized, it is impossible to send commands from WinEdt to RGui.
  Workaround: Don't minimize RGui! ;-)

- Works in S-PLUS mode only, if the command window is opened as "window 1".

- Doesn't work with all versions of S-PLUS (tested with version 4.5).


--------------------------------
Uwe Ligges
ligges@statistik.tu-dortmund.de
