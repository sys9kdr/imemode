#include <stdio.h>
#include <windows.h>

#define IME_CONTROL 0x283
#define IMC_GETCONVERSIONMODE 0x1
#define IMC_SETCONVERSIONMODE 0x2

int main(int argc, char** argv) {

  HWND fg = GetForegroundWindow();
  if(!fg) return 0;

  HWND ime = ImmGetDefaultIMEWnd(fg);
  if(!ime) return 0;

  LRESULT status;
  if(argc < 2) {
    status = SendMessage(ime, WM_IME_CONTROL, IMC_GETCONVERSIONMODE, 0);
  } else {
    char *ptr;
    long conv_mode = strtol(argv[1], &ptr, 10);
    if (*ptr) {
        fprintf(stderr, "Error: Argument is not an integer\n");
        return 1;
    }
    status = conv_mode;
    SendMessage(ime, IME_CONTROL, IMC_SETCONVERSIONMODE, (LPARAM)status);
  }

  printf("%lld\n", status);
  
  return 0;
}
