import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/constants.dart';
import '../../../../core/exceptions.dart';
import '../../domain/entity/note.dart';

abstract class NotesRemoteDataSource{
  Future<List<Note>> fetchNotes();
}

class NotesRemoteDataSourceImpl implements NotesRemoteDataSource{
  @override
  Future<List<Note>> fetchNotes() async {
    FirebaseFirestore ff = FirebaseFirestore.instance;
    FirebaseStorage fs = FirebaseStorage.instance;

    try {
      QuerySnapshot<Map<String,dynamic>> qs = await ff
          .collection(pathNotes)
          .get();

      return await _processQuery(fs, qs);
    } catch(e){
      throw FetchException();
    }
  }

  Future<List<Note>> _processQuery(FirebaseStorage fs, QuerySnapshot<Map<String,dynamic>> qs) async {
    List<Note> newNotes = qs.docs.map((value) => Note.fromJson(value.id, value.data())).toList();

    for(Note note in newNotes){
      if(note.hasImage){
        await _processReadingImageFromStorage(fs, note);
      }
    }

    return newNotes;
  }

  Future<void> _processReadingImageFromStorage(FirebaseStorage fs, Note note) async {
    const maxDataToDownload = 2 * 1024 * 1024;

    final Uint8List? imageData = await fs.ref(
        '$pathNotes/${note.id}.jpg').getData(maxDataToDownload);

    if (imageData != null) {
      _processImageData(imageData, note);
    }
  }

  void _processImageData(Uint8List imageData, Note note) {
    XFile xFile = XFile.fromData(imageData);
    note.image = xFile;
  }
}