import 'package:flutter/material.dart';
import 'package:noti/features/add_note/presentation/widget/add_note_page.dart';

class NotesFloatingActionButton extends StatelessWidget {
  const NotesFloatingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        backgroundColor: Colors.yellow.shade900,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddNotePage()));
        },
        label: const Text('Add note'),
        icon: const Icon(Icons.add_rounded));
  }
}
