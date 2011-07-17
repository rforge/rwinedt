R-Sweave v1.3 by Gilbert Ritschard (gilbert.ritschard@unig.ch)

Support for R and Sweave

 - R-Sweave-6.zip   for WinEdt 6
 - R-Sweave-55.zip  for WinEdt 5.5

 - R-support is based on the RWinEdt stuff (menu, highlighting,
   tool bar buttons). The support is here made available
   in a standard WinEdt session
   instead of running it in a limited stand alone WinEdt instance.

 - support (sweave.edt, menu, buttons, ...) for sweave, the R program
   which transforms LaTeX .Rnw files with R chunks into a LaTeX files
   with the R chunks replaced by their R outcome.

Most of the credit of the R-support goes to Uwe Ligges, the author of
RWinEdt. Many thanks to him for allowing me to reuse his material.

The update for WinEdt 6 has been done by Karl Koeller. The much nicer
button images in the WinEdt 6 version of the support are also due to
Karl Koeller. Many thanks to him for his invaluable contribution.

The included RWinEdt stuff is under GPL-2 licence, thus we distribute
this R-Sweave support also under GPL licence.

Licence: GPL v2 or newer (http://www.gnu.org/copyleft/gpl.html)

=============================================================
v1.3 Changes since v1.2
  - There is now a distribution for WinEdt 6.
  - Possibility to control the 32bit/64bit choice with %!4
  - Uses now SetInfo(9,"Sweave")  (Compatible with WinEdt 6)
  - Uninstall macro (WinEdt 6 only)

=============================================================
v1.2 Changes since v1.1
  - adapted for R-2.12.0 which uses now
      ...\bin\i386    (for the 32bit version)
      ...\bin\x64     (for the 64bit version)
    the default installed setting is for bin\i386, you should change that
    manually if you want to use x64
    (see below how to pass registry to Sweave.edt and
    specially LetReg(7, ...))

=============================================================

v1.1 Changes since first version:
  - support and menu item for Stangle (for concatenating all chunks
    into a single .R file)

=============================================================

Installation Instructions:
=========================

The zip file contains two distributions, one for version WinEdt 6 and
one for older version, namely WinEdt 5.5. Just select the one which
is appropriate for you.

1. Create a sub-folder "R-Sweave" in "%B\Contrib"
   (where %B refers probably to "Program Files\WinEdt Team\WinEdt6")
   and put there the content of the R-Sweave.zip file.

2. Open WinEdt.

3. Make a backup of your present configuration (using
   options/maintenance/backup).

4. Launch the "R-Sweave_install.edt" macro
   (For instance by opening this .edt file in WinEdt and
   pressing Ctrl-Shift-F9).

 In WinEdt 6, you will have a default drop-down button. This can
 indeed be customized.
 In WinEdt 5.5, you may add R-Sweave related buttons to the Tool Bar
 through the "Enter Tool Bar Setup..." dialog (contextual menu
 from the tool bar). However, you should first restart WinEdt to have
 access to the R-Sweave buttons.

Now, you should be done.

Default installation is for the 64bit version of R 2.12.0 or higher.

If you have only access to the 32bit version: Before insatlling, open
the MainMenu.ini file (or R-Sweave.dat file for the 5.5 version)
provided with the support and substitute in it all occurrences of
LetReg(4,'\x64') with LetReg(4,'\i386') or LetReg(4,'') if you have
an older version than R 2.12.0.

===============================================================

Usage instructions:
==================

You can customize the menu items.

Here are the arguments (registry) that can be passed to the
Sweave.edt macro:

LetReg(6,"xxx"); where xxx can be pdf, dvi, Stop or Direct
                 the latter being an alias of pdf.

LetReg(7,"R installation path");
                 can be used to tell the macro where it can find
                 the R binaries. If empty, sweave.edt
                 uses the value given by the Windows registry.

LetReg(8,"cache"); for running cacheSweave instead of Sweave.

LetReg(8,"R"); for running Stangle instead of Sweave.
                 Stangle just concatenates all chuncks into
                 a single %n.R file. Indeed when choosing this
                 option, the %!6 register will be ignored.

LetReg(9,"open"); When set Sweave.edt just opens an R console.

LetReg(4,"yyy"); where "yyy" can be either "\i386" (32bit),
                 "\x64" (64bit) if you are running R version 2.12.0
                 or higher, or "" for R version < 2.12.0 .

================================================================

Good luck and enjoy.


Gilbert
