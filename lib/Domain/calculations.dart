import 'package:small_calculations/Domain/operation.dart';

class Calculations {
  static Operation startSum() {
    return Sammary();
  }

  static Operation startSub() {
    return Substract();
  }

  static Operation startMult() {
    return Multiply();
  }

  static Operation startDiv() {
    return Division();
  }

  static List<Operation> getAllOperations() {
    return [
      Sammary(),
      Substract(),
      Multiply(),
      Division(),
    ];
  }
}
