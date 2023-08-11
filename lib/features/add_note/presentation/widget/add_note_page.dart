import 'dart:ffi';

import 'package:flutter/material.dart';


import 'add_note_app_bar.dart';
import 'add_note_body.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({Key? key}) : super(key: key);

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: AddNoteAppBar(),
        body: AddNoteBody());
  }
}



