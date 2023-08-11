import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/constants.dart';
import '../../../../core/exceptions.dart';
import '../../domain/entity/note.dart';

abstract class NotesRemoteDataSource{
  Future<List<Note>> fetchPlaces();
}

class NotesRemoteDataSourceImpl implements NotesRemoteDataSource{
  @override
  Future<List<Note>> fetchPlaces() async {
    FirebaseFirestore ff = FirebaseFirestore.instance;

    List<Note> notes = [];
    try {
      QuerySnapshot<Map<String, dynamic>> notesSnapshot = await ff
          .collection(pathNotes).get();

      notes = notesSnapshot.docs.map((value) => Note.fromJson(value.data())).toList();
    } catch(e){
      throw FetchException();
    }

    return notes;
  }

}