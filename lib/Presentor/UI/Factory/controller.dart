import 'dart:io';

import 'package:small_calculations/Presentor/UI/Factory/fabric.dart';

class UIController {
  static UIFabric? _fabric;

  static UIFabric? getFabric() {
    if (_fabric == null) {
      if (Platform.isAndroid) {
        _fabric = AndroidFabric();
      } else if (Platform.isIOS) {
        _fabric = IOSFabric();
      }
    }
    return _fabric;
  }
}
