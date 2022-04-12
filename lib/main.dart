import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const List<int> _listOfNumbers = [1, 2, 3, 4, 5];

  int? _resultNum;
  int? _selectedValue;
  int _cubeNum(int number) {
    return number * number * number;
  }

  void _setResult(int number) => setState(() {
        _resultNum = number;
      });
  void _setSelectedValue(int number) => setState(() {
        _selectedValue = number;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('test'),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'result is ${_resultNum ?? 'none'}',
                textAlign: TextAlign.center,
              ),
              DropdownButton(
                  onChanged: (int? newVal) {
                    _setSelectedValue(newVal!);
                    final _cubeNumResult = _cubeNum(newVal);
                    _setResult(_cubeNumResult);
                  },
                  value: _selectedValue,
                  items: _listOfNumbers.map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList())
            ]));
  }
}
