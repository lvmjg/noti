import 'dart:async';

import 'package:either_dart/either.dart';

import '../../../../core/failures.dart';
import '../../data/repository/notes_repository.dart';
import '../entity/note.dart';

class FetchNotes{
  final NotesRepository notesRepository;

  FetchNotes(this.notesRepository);

  @override
  Future<Either<Failure, List<Note>>> call() async {
    return notesRepository.fetchNotes();
  }
}