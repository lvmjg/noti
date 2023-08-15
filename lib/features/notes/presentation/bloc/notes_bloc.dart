import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:noti/core/constants.dart';
import 'package:noti/features/notes/data/datasource/notes_remote_data_source.dart';
import 'package:noti/features/notes/data/repository/notes_repository.dart';
import 'package:noti/features/notes/domain/usecase/fetch_notes.dart';

import '../../domain/entity/note.dart';

part 'notes_event.dart';

part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  NotesBloc() : super(NotesFetchSuccess(notes: const [])) {
    FetchNotes fetchNotes =
        FetchNotes(NotesRepositoryImpl(NotesRemoteDataSourceImpl()));

    on<NotesEvent>((event, emit) async {
      emit(NotesFetchInProgress());

      (await fetchNotes()).fold(
          (failure) => emit(NotesFetchFailure(errorMessage: errorFetchNotes)),
          (notes) => emit(NotesFetchSuccess(notes: notes)));
    });
  }
}
