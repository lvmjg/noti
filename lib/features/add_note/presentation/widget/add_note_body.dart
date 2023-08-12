import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cross_file_image/cross_file_image.dart';

class AddNoteBody extends StatefulWidget {
  AddNoteBody({
    Key? key,
  }) : super(key: key);

  @override
  State<AddNoteBody> createState() => _AddNoteBodyState();
}

class _AddNoteBodyState extends State<AddNoteBody> {
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
          TextField(),
          SizedBox(
            height: 16,
          ),
          Text('Content'),
          SizedBox(
            height: 16,
          ),
          TextField(),
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