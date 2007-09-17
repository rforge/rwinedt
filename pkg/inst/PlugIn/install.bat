@ECHO OFF
echo *--------------------------------------------*
echo * ATTENTION: IF YOU INVOKED THIS FILE NOT IN *
echo * ...\winedt\plugins\r-winedt                *
echo * YOU SHOULD CANCEL NOW (CTRL+C) !           *
echo *--------------------------------------------*
pause
mkdir ..\..\macros\R
xcopy *.edt ..\..\macros\R
xcopy R.* ..\..
xcopy R-WinEdt.ico ..\..
xcopy send2R.edt ..\..
xcopy R-*.bmp ..\..\bitmaps\buttons
xcopy R_*.bmp ..\..\bitmaps\images
echo *--------------------------------------------------------*
echo * Only in case of errors:                                *
echo *                                                        *
echo * Copy all files *.edt into .....\winedt\macros\R        *
echo * Copy files R-*.bmp   into .....\winedt\bitmaps\buttons *
echo * Copy files R_*.bmp   into .....\winedt\bitmaps\images  *
echo * Copy all other files into .....\winedt                 *
echo *--------------------------------------------------------*
pause
