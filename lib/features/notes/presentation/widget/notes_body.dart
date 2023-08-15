import 'package:cross_file_image/cross_file_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:noti/features/notes/domain/entity/note.dart';

import '../bloc/notes_bloc.dart';

class NotesBody extends StatefulWidget {
  const NotesBody({Key? key}) : super(key: key);

  @override
  State<NotesBody> createState() => _NotesBodyState();
}

class _NotesBodyState extends State<NotesBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<NotesBloc, NotesState>(
        builder: (context, state) {
          if (state is NotesFetchSuccess) {
            return _createGridView(state.notes);
          } else if (state is NotesFetchFailure) {
            return Center(
                child: ElevatedButton(
              onPressed: () {
                context.read<NotesBloc>().add(NotesInitiated());
              },
              child: Text('Try again'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow.shade900),
            ));
          }

          return Center(
              child: CircularProgressIndicator(
            color: Colors.yellow.shade900,
          ));
        },
      ),
    );
  }

  _createGridView(List<Note> notes) {
    if (notes.isNotEmpty) {
      return RefreshIndicator(
        onRefresh: () async {
          context.read<NotesBloc>().add(NotesInitiated());
        },
        child: GridView.count(
          crossAxisCount: 2,
          children: _createGridviewChildren(notes),
        ),
      );
    } else {
      return Container();
    }
  }

  List<Widget> _createGridviewChildren(List<Note> notes) {
    return notes.map((note) {
      return Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${note.title}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16,
                ),
                Text('${note.content}'),
                _showImage(note.image)
              ],
            ),
          ));
    }).toList();
  }

  Widget _showImage(XFile? xFile) {
    if (xFile != null) {
      return Expanded(child: Image(image: XFileImage(xFile)));
    } else {
      return Container();
    }
  }
}
