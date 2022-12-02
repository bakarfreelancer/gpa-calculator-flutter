import 'package:flutter/material.dart';
import './models/marks.dart';
import 'widgets/add_marks.dart';
import 'widgets/marks_list.dart';
import 'widgets/result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GPA Calculator',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange)
              .copyWith(secondary: Colors.cyan),
          textTheme: ThemeData.light().textTheme.copyWith(
                  bodyLarge: const TextStyle(
                fontSize: 18,
                color: Colors.orange,
              ))),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Marks> marksList = [];
  double totalGPA = -333;
  void _addMarksFun(String sub, String marks, String crh) {
    if (sub.isEmpty || marks.isEmpty || crh.isEmpty) return;

    setState(() {
      marksList.add(Marks(
          subName: sub, marks: int.parse(marks), creditHrs: int.parse(crh)));
    });
  }

  // Calculate Result

  void _calcResult() {
    double grade, subTime, totalcredit = 0, totaltimecal = 0;
    for (Marks e in marksList) {
      if (e.marks > 84) {
        grade = 4.00;
      } else if (e.marks > 79 && e.marks < 85) {
        grade = 3.67;
      } else if (e.marks > 74 && e.marks < 80) {
        grade = 3.33;
      } else if (e.marks > 70 && e.marks < 75) {
        grade = 3.00;
      } else if (e.marks > 67 && e.marks < 71) {
        grade = 2.67;
      } else if (e.marks > 63 && e.marks < 68) {
        grade = 2.33;
      } else if (e.marks > 60 && e.marks < 64) {
        grade = 2.00;
      } else if (e.marks > 57 && e.marks < 61) {
        grade = 1.66;
      } else if (e.marks > 49 && e.marks < 58) {
        grade = 1.00;
      } else {
        grade = 0.00;
      }
      subTime = grade * e.creditHrs;
      totalcredit += e.creditHrs;
      totaltimecal += subTime;
    }

    if ((totaltimecal / totalcredit).isNaN) return;
    setState(() {
      totalGPA = totaltimecal / totalcredit;
    });
  }

  void _restart() {
    setState(() {
      marksList.clear();
      totalGPA = -333;
    });
  }

  void _removeItem(i) {
    setState(() {
      marksList.removeAt(i);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GPA Calculator')),
      body: SingleChildScrollView(
          child: Column(
        children: [
          AddMarks(
            addMarks: _addMarksFun,
          ),
          Result(_calcResult, totalGPA),
          MarksList(marksList, _removeItem)
        ],
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _restart,
        child: const Icon(Icons.restart_alt),
      ),
    );
  }
}
