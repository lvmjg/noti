import 'package:either_dart/either.dart';

import '../../../../core/exceptions.dart';
import '../../../../core/failures.dart';
import '../../../notes/domain/entity/note.dart';
import '../datasource/add_note_remote_data_source.dart';

abstract class AddNoteRepository {
  Future<Either<Failure, String>> addNote(Note note);
}

class AddNoteRepositoryImpl implements AddNoteRepository {
  final AddNoteRemoteDataSource remote;

  AddNoteRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, String>> addNote(Note note) async {
    String noteId;
    try {
      noteId = await remote.addNote(note);
      return Right(noteId);
    } on FetchException {
      return Left(AddFailure());
    }
  }
}