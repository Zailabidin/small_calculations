import 'package:flutter/material.dart';

abstract class Button extends StatelessWidget {
  final String title;
  final Function() callBack;

  Button({
    required this.title,
    required this.callBack,
  });
}

class AndroidButton extends Button {
  AndroidButton({
    required String title,
    required Function() callBack,
  }) : super(title: title, callBack: callBack);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.red,
      ),
      child: Text(super.title),
      onPressed: super.callBack,
    );
  }
}

class IOSButton extends Button {
  IOSButton({
    required String title,
    required Function() callBack,
  }) : super(title: title, callBack: callBack);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
      ),
      child: Text(super.title),
      onPressed: super.callBack,
    );
  }
}
