import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final calcResult;
  double totalGPA;
  Result(this.calcResult, this.totalGPA, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            totalGPA != -333
                ? Text(
                    totalGPA.toStringAsFixed(2),
                    style: Theme.of(context).textTheme.titleLarge,
                  )
                : const Text(""),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
              child: ElevatedButton(
                  onPressed: calcResult, child: const Text('Calculate')),
            )
          ],
        ),
      ),
    );
  }
}
