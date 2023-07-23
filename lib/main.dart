import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Run Planner',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueGrey,
        scaffoldBackgroundColor: const Color.fromARGB(255, 20, 3, 3),
        colorScheme: ColorScheme.dark(
          secondary: Colors.blue,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _goalTime = 0;
  double _distance = 0.0;
  String _effort = 'Easy Run';
  List<String> _effortValues = ['Easy Run', 'Break A Sweat', 'Race Pace'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 50.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                // Padding widget here
                padding: EdgeInsets.only(top: 30.0),
              ),
              Text(
                'Start Your Run 🏃‍♂️💨',
                style: TextStyle(
                  color: Color.fromRGBO(172, 237, 81, 1.0),
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                // Padding widget here
                padding: EdgeInsets.only(top: 30.0),
              ),
              pickerCardInt('What is your goal time in minutes?', _goalTime, 61,
                  (int newValue) {
                setState(() {
                  _goalTime = newValue;
                });
              }),
              pickerCardDouble('How far would you like to run?', _distance, 30,
                  (double newValue) {
                setState(() {
                  _distance = newValue;
                });
              }),
              pickerCardString('At what pace?', _effort, _effortValues,
                  (String newValue) {
                setState(() {
                  _effort = newValue;
                });
              }),
              SizedBox(height: 10), // create some space before the "GO" button
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // action
        },
        label: const Text('GO'),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Card pickerCardInt(String title, int currentValue, int itemCount,
      ValueChanged<int> onChanged) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                color: Color.fromRGBO(172, 237, 81, 1.0),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: 96.0, // triple the itemExtent
              child: CupertinoPicker(
                itemExtent: 32.0,
                onSelectedItemChanged: onChanged,
                children: List<Widget>.generate(itemCount, (index) {
                  return Text(index.toString());
                }),
              ),
            ),
            Padding(
              // Padding widget here
              padding: EdgeInsets.only(top: 20.0),
            ),
            Text(
              currentValue.toString() +
                  (currentValue == 1 ? " Minute" : " Minutes"),
              style: TextStyle(
                color: Color.fromRGBO(172, 237, 81, 1.0),
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Card pickerCardDouble(String title, double currentValue, int itemCount,
      ValueChanged<double> onChanged) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                color: Color.fromRGBO(172, 237, 81, 1.0),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: 100.0, // triple the itemExtent
              child: CupertinoPicker(
                itemExtent: 32.0,
                onSelectedItemChanged: (index) {
                  onChanged(index / 10);
                },
                children: List<Widget>.generate(itemCount, (index) {
                  return Text((index / 10).toStringAsFixed(1));
                }),
              ),
            ),
            Padding(
              // Padding widget here
              padding: EdgeInsets.only(top: 20.0),
            ),
            Text(
              currentValue.toStringAsFixed(1) +
                  (currentValue == 1 ? " Mile" : " Miles"),
              style: TextStyle(
                color: Color.fromRGBO(172, 237, 81, 1.0),
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Card pickerCardString(String title, String currentValue, List<String> values,
      ValueChanged<String> onChanged) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                color: Color.fromRGBO(172, 237, 81, 1.0),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: 100.0, // triple the itemExtent
              child: CupertinoPicker(
                itemExtent: 32.0,
                onSelectedItemChanged: (index) {
                  onChanged(values[index]);
                },
                children: values.map((String value) {
                  return Text(value);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
