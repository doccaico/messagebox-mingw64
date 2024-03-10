#define WIN32_LEAN_AND_MEAN

#include <windows.h>

void DBG(LPCWSTR msg) {
  MessageBox(NULL, msg, TEXT("MsgBox"), MB_OK);
}

int WINAPI WinMain(HINSTANCE ins, HINSTANCE previns, LPSTR cmdline, int cmd) {

  int msgboxID = MessageBox(
      NULL,
      TEXT("ハローワールド"),
      TEXT("メッセージボックス"),
      MB_ICONWARNING | MB_CANCELTRYCONTINUE | MB_DEFBUTTON2);

  switch (msgboxID) {
    case IDCANCEL:
      DBG(TEXT("[プレス] IDCANCEL"));
      break;
    case IDTRYAGAIN:
      DBG(TEXT("[プレス] IDTRYAGAIN"));
      break;
    case IDCONTINUE:
      DBG(TEXT("[プレス] IDCONTINUE"));
      break;
  }

  return 0;
}
