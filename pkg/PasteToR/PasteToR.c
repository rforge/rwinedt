// PasteToR.c: Paste clipboard's contents to R.
// Daniel Enache, 09-Feb-2006

#include <windows.h>
void pasteToR()
{
    HWND hRWin, hRWinMdi, hRWinConsole;

    if ( (hRWinConsole = FindWindowEx(NULL, NULL, "Rgui", "R Console")) == NULL )
    {
        if ( (hRWin = FindWindow("Rgui Workspace", "RGui")) == NULL ) return;
        if ( (hRWinMdi = FindWindowEx(hRWin, NULL, "MDIClient", "")) == NULL ) return;
        if ( (hRWinConsole = FindWindowEx(hRWinMdi, NULL, "Rgui Document", "R Console")) == NULL ) return;
    }
    else
    {
        hRWin = hRWinConsole;
        hRWinMdi = hRWinConsole;
    }

    if ( IsIconic(hRWin) ) OpenIcon(hRWin);
    if ( SetForegroundWindow(hRWin) ) 
    {
        if ( IsIconic(hRWinConsole) ) OpenIcon(hRWinConsole);
        if ( SetForegroundWindow(hRWinConsole) ) 
        {
            keybd_event(VK_CONTROL, 0, 0, 0); 
            keybd_event('V', 0, 0, 0); 
            keybd_event('V', 0, KEYEVENTF_KEYUP, 0); 
            keybd_event(VK_CONTROL, 0, KEYEVENTF_KEYUP, 0); 
        }
    }
}



int APIENTRY WinMain(HINSTANCE hInstance,
                     HINSTANCE hPrevInstance,
                     LPSTR     lpCmdLine,
                     int       nCmdShow )
{
    pasteToR();

    return 0;
}

