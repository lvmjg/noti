import 'dart:ffi';

import 'package:flutter/material.dart';


import 'notes_app_bar.dart';
import 'notes_body.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NotesAppBar(),
        floatingActionButton: NotesBody(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            children: _createTestChildren(),
          ),
        ));
  }

  _createTestChildren() {
    return List.generate(20, (index) => index).map((index) {
      return Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))
          ),
          elevation: 4,
          child: Center(
              child: Text('$index')
          )
      );
    }).toList();
  }
}



