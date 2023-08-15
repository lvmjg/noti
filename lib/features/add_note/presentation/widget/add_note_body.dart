import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cross_file_image/cross_file_image.dart';

import '../../../notes/domain/entity/note.dart';
import '../bloc/add_note_bloc.dart';

class AddNoteBody extends StatefulWidget {
  AddNoteBody({
    Key? key,
  }) : super(key: key);

  @override
  State<AddNoteBody> createState() => _AddNoteBodyState();
}

class _AddNoteBodyState extends State<AddNoteBody> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  XFile? pickedFile;

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
          TextField(controller: titleController),
          SizedBox(
            height: 16,
          ),
          Text('Content'),
          SizedBox(
            height: 16,
          ),
          TextField(controller: contentController),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('Pick image'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow.shade900),
              ),
              ElevatedButton(
                onPressed: () {
                  Note newNote = Note(
                    title: titleController.text,
                    content: contentController.text,
                    hasImage: pickedFile!=null
                  );
                  newNote.image = pickedFile;

                  context.read<AddNoteBloc>().add(NoteSaveAttempt(note: newNote));
                },
                child: Text('Save note'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow.shade900),
              )
            ],

          ),
          SizedBox(
            height: 16,
          ),
          _showImage()
        ],
      ),
    );
  }

  void _pickImage() async {
      pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      setState(() {});
  }

  Widget _showImage() {
    if(pickedFile!=null){
      return Image(image: XFileImage(pickedFile!));
    }
    else{
      return Container();
    }
  }
}