import 'package:flutter/material.dart';

class NotesBody extends StatelessWidget {
  const NotesBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        backgroundColor: Colors.yellow.shade900,
        onPressed: (){}, label: const Text('Add note'), icon: const Icon(Icons.add_rounded));
  }
}