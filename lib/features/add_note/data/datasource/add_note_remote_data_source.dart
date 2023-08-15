import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../core/constants.dart';
import '../../../../core/exceptions.dart';
import '../../../notes/domain/entity/note.dart';

abstract class AddNoteRemoteDataSource{
  Future<String>  addNote(Note note);
}

class AddNoteRemoteDataSourceImpl implements AddNoteRemoteDataSource{
  @override
  Future<String> addNote(Note note) async {
    FirebaseFirestore ff = FirebaseFirestore.instance;
    FirebaseStorage fs = FirebaseStorage.instance;

    String noteId = "";
    try {
      DocumentReference<Map<String,dynamic>> doc = await ff.collection(pathNotes).add(note.toJson());
      noteId = doc.id;

      if(note.image!=null){
        String originalFilePath = note.image!.path;
        _processAddingImageToStorage(fs, originalFilePath, noteId);
      }
    } catch(e){
      throw AddException();
    }

    return noteId;
  }

  void _processAddingImageToStorage(FirebaseStorage fs, String originalFilePath, String noteId) async {
    String fileExtension = originalFilePath.split('.').last;
    String uploadFileName = '$noteId.$fileExtension';

    String documentsPath = (await getApplicationDocumentsDirectory()).path;
    String localPath = '$documentsPath/$uploadFileName';
    File newFile = await File(originalFilePath).copy(localPath);

    String storagePath = '$pathNotes/$uploadFileName';
    await fs.ref(storagePath).putFile(newFile);
  }

}