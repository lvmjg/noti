import 'package:flutter/material.dart';

class AddNoteBody extends StatelessWidget {
  const AddNoteBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text('Title'),
          SizedBox(
            height: 16,
          ),
          TextField(),
          SizedBox(
            height: 16,
          ),
          Text('Content'),
          SizedBox(
            height: 16,
          ),
          TextField(),
        ],
      ),
    );
  }
}
