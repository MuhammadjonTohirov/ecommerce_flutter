import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb, kDebugMode;

bool isAndroid() => Platform.isAndroid;
bool isiOS() => Platform.isIOS;
bool isWeb() => kIsWeb;
bool isLinux() => Platform.isLinux;
bool isWindows() => Platform.isWindows;
bool isMacOS() => Platform.isMacOS;
bool isDebuggin() => kDebugMode;

void appLog(text) {
  if (isDebuggin()) {
    print("log: $text");
  }
}
