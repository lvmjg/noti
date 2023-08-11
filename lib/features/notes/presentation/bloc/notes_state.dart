part of '../../../notes/presentation/bloc/notes_bloc.dart';

@immutable
abstract class NotesState {}

class NotesFetchFailure extends NotesState {
  final String errorMessage;

  NotesFetchFailure({required this.errorMessage});
}

class NotesFetchInProgress extends NotesState {
  NotesFetchInProgress();
}

class NotesFetchSuccess extends NotesState {
  final List<Note> notes;

  NotesFetchSuccess({required this.notes});
}
