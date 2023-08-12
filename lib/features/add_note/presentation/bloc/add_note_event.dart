part of 'add_note_bloc.dart';

@immutable
abstract class AddNoteEvent {}

class NoteSaveAttempt extends AddNoteEvent{
  final Note note;

  NoteSaveAttempt({required this.note});
}
