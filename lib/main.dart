import 'package:flutter/material.dart';
import 'package:small_calculations/Domain/calculations.dart';
import 'package:small_calculations/Domain/operation.dart';
import 'package:small_calculations/Presentor/UI/Factory/controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'Рассчеты'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double? num1;
  double? num2;
  double? result;
  Operation? dropdownvalue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 20,
                      ),
                      child: Row(
                        children: [
                          Flexible(
                            child: TextField(
                              autofocus: true,
                              decoration: InputDecoration(
                                hintText: "Первое число",
                              ),
                              keyboardType: TextInputType.numberWithOptions(
                                signed: false,
                                decimal: true,
                              ),
                              onChanged: (value) {
                                num1 = double.tryParse(value);
                              },
                            ),
                          ),
                          VerticalDivider(),
                          DropdownButton<Operation>(
                            value: dropdownvalue,
                            items: Calculations.getAllOperations()
                                .map((value) => DropdownMenuItem(
                                    child: Text(
                                      value.shortName(),
                                    ),
                                    value: value))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                dropdownvalue = value;
                              });
                            },
                          ),
                          VerticalDivider(),
                          Flexible(
                            child: TextField(
                              autofocus: true,
                              decoration: InputDecoration(
                                hintText: "Второе число",
                              ),
                              keyboardType: TextInputType.numberWithOptions(
                                signed: false,
                                decimal: true,
                              ),
                              onChanged: (value) {
                                num2 = double.tryParse(value);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Text("Результат:"),
                    Container(
                      margin: EdgeInsets.only(
                        top: 20,
                      ),
                      child: Text(
                        result != null ? result.toString() : "",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              UIController.getFabric()!.getButton(
                title: "Произвести операцию ",
                callBack: () {
                  setState(() {
                    if (dropdownvalue != null) {
                      result = dropdownvalue?.operation(num1, num2!);
                    }
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
