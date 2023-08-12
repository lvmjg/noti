import 'package:either_dart/either.dart';

import '../../../../core/failures.dart';
import '../../../notes/domain/entity/note.dart';
import '../../data/repository/add_note_repository.dart';

class AddNote{
  final AddNoteRepository addNoteRepository;

  AddNote(this.addNoteRepository);

  Future<Either<Failure, String>> call(Note note) async {
    return await addNoteRepository.addNote(note);
  }
}