import 'package:small_calculations/Presentor/UI/Factory/button.dart';

abstract class UIFabric {
  Button getButton({required String title, required Function() callBack});
}

class AndroidFabric implements UIFabric {
  @override
  Button getButton({required String title, required Function() callBack}) {
    return AndroidButton(
      callBack: callBack,
      title: title,
    );
  }
}

class IOSFabric implements UIFabric {
  @override
  Button getButton({required String title, required Function() callBack}) {
    return IOSButton(
      callBack: callBack,
      title: title,
    );
  }
}
