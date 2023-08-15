import 'package:either_dart/either.dart';

import '../../../../core/constants.dart';
import '../../../../core/exceptions.dart';
import '../../../../core/failures.dart';
import '../../domain/entity/note.dart';
import '../datasource/notes_remote_data_source.dart';

abstract class NotesRepository {
  Future<Either<Failure,List<Note>>> fetchNotes();
}

class NotesRepositoryImpl implements NotesRepository {
  final NotesRemoteDataSource remote;

  NotesRepositoryImpl(this.remote);

  @override
  Future<Either<Failure,List<Note>>> fetchNotes() async {
    List<Note> notes;
    try {
      notes = await remote.fetchNotes();
      return Right(notes);
    } on FetchException {
      return Left(FetchFailure());
    }
  }
}