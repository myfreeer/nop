#include <windows.h>

int __cdecl WinMainCRTStartup() {
  MSG msg;
  GetMessage(&msg, NULL, 0, 0);
  ExitProcess(0);
  return 0;
}
