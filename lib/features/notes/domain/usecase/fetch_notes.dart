import 'package:either_dart/either.dart';

import '../../../../core/failures.dart';
import '../../data/repository/notes_repository.dart';
import '../entity/note.dart';

class FetchPlaces{
  final NotesRepository notesRepository;

  List<Note> notes = [];

  FetchPlaces(this.notesRepository);

  @override
  Future<Either<Failure, List<Note>>> call() async {
    Either<Failure, List<Note>> notesEither =
    await notesRepository.fetchNotes();

    if (notesEither.isRight) {
      notes = notesEither.right;
    }

    return notesEither;
  }
}