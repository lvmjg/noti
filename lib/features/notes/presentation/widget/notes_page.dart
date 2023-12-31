import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../bloc/notes_bloc.dart';
import 'notes_app_bar.dart';
import 'notes_body.dart';
import 'notes_floating_action_button.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: NotesAppBar(),
        floatingActionButton: NotesFloatingActionButton(),
        body: NotesBody()
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<NotesBloc>().add(NotesInitiated());
  }
}



