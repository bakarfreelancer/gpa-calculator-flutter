import 'package:flutter/material.dart';
import 'package:gpacalculator/models/marks.dart';

class MarksList extends StatelessWidget {
  final ScrollController _listScrollController = ScrollController();
  final List<Marks> allMarks;
  final removeItem;
  MarksList(this.allMarks, this.removeItem, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: allMarks.isEmpty
          ? Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "No Record Found...",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            )
          : Scrollbar(
              thumbVisibility: true,
              controller: _listScrollController,
              child: ListView.builder(
                controller: _listScrollController,
                itemCount: allMarks.length,
                itemBuilder: (ctx, i) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              allMarks[i].subName,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('Marks: ${allMarks[i].marks.toString()}'),
                                Text(
                                    'Credit Hrs: ${allMarks[i].creditHrs.toString()}'),
                                IconButton(
                                    onPressed: () {
                                      removeItem(i);
                                    },
                                    icon: (const Icon(
                                      Icons.delete,
                                    )),
                                    color: Colors.red)
                              ],
                            )
                          ]),
                    ),
                  );
                },
                shrinkWrap: true,
              ),
            ),
      // : Text("Added"),
    );
  }
}
