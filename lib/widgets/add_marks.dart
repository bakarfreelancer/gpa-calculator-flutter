import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddMarks extends StatelessWidget {
  final addMarks;
  AddMarks({super.key, required this.addMarks});

  final subjectController = TextEditingController();
  final marksController = TextEditingController();
  final creditHrsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: subjectController,
              decoration: const InputDecoration(
                labelText: 'Subject',
              ),
              textInputAction: TextInputAction.next,
            ),
            Row(
              children: [
                Expanded(
                  // widthFactor: 0.5,
                  child: TextField(
                    controller: marksController,
                    decoration: const InputDecoration(labelText: 'Marks'),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Expanded(
                  // widthFactor: 0.3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextField(
                      controller: creditHrsController,
                      decoration:
                          const InputDecoration(labelText: 'Credit Hours'),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      textInputAction: TextInputAction.done,
                      onSubmitted: (value) {
                        addMarks(subjectController.text, marksController.text,
                            creditHrsController.text);
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    addMarks(subjectController.text, marksController.text,
                        creditHrsController.text);
                  },
                  child: const Text("Add")),
            )
          ],
        ),
      ),
    );
  }
}
