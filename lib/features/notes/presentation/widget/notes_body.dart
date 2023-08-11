import 'package:flutter/material.dart';

class NotesBody extends StatelessWidget {
  const NotesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        children: _createTestChildren(),
      ),
    );
  }

  _createTestChildren() {
    return List.generate(20, (index) => index).map((index) {
      return Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          elevation: 4,
          child: Center(child: Text('$index')));
    }).toList();
  }
}
