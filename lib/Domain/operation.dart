abstract class Operation {
  String shortName();
  String longName();
  double? operation(double? num1, double num2);
}

class Sammary implements Operation {
  @override
  String longName() => "Сложение";

  @override
  double? operation(double? num1, double num2) {
    return (num1 ?? 0) + (num2 ?? 0);
  }

  @override
  String shortName() => "+";
  @override
  bool operator ==(Object object) =>
      object is Operation && object.shortName() == shortName();
  int get hashCode => shortName().hashCode;
}

class Substract implements Operation {
  @override
  String longName() => "Вычитание";

  @override
  double? operation(double? num1, double num2) {
    return (num1 ?? 0) - (num2 ?? 0);
  }

  @override
  String shortName() => "-";
  @override
  bool operator ==(Object object) =>
      object is Operation && object.shortName() == shortName();
  int get hashCode => shortName().hashCode;
}

class Multiply implements Operation {
  @override
  String longName() => "Умножение";

  @override
  double? operation(double? num1, double num2) {
    return (num1 ?? 1) * (num2 ?? 1);
  }

  @override
  String shortName() => "*";
  @override
  bool operator ==(Object object) =>
      object is Operation && object.shortName() == shortName();
  int get hashCode => shortName().hashCode;
}

class Division implements Operation {
  @override
  String longName() => "Деление";

  @override
  double? operation(double? num1, double num2) {
    if (num2 == 0 || num2 == 0) {
      return null;
    } else if (num1 == null) {
      return 0;
    } else {
      return num1 / num2;
    }
  }

  @override
  String shortName() => "/";
  @override
  bool operator ==(Object object) =>
      object is Operation && object.shortName() == shortName();
  int get hashCode => shortName().hashCode;
}
