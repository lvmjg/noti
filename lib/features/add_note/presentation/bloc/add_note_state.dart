part of 'add_note_bloc.dart';

@immutable
abstract class AddNoteState {}

class AddNoteFailure extends AddNoteState {
  final String errorMessage;

  AddNoteFailure({required this.errorMessage});
}

class AddNoteInProgress extends AddNoteState {
  AddNoteInProgress();
}

class AddNoteSuccess extends AddNoteState {
  AddNoteSuccess();
}