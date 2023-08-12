import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cross_file_image/cross_file_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:noti/features/add_note/data/datasource/add_note_remote_data_source.dart';
import 'package:noti/features/add_note/data/repository/add_note_repository.dart';
import 'package:noti/features/add_note/domain/usecase/add_note.dart';

import '../../../../core/constants.dart';
import '../../../notes/domain/entity/note.dart';

part 'add_note_event.dart';
part 'add_note_state.dart';

class AddNoteBloc extends Bloc<AddNoteEvent, AddNoteState> {
  AddNoteBloc() : super(AddNoteSuccess()) {
    AddNote addNote = AddNote(AddNoteRepositoryImpl(AddNoteRemoteDataSourceImpl()));

    on<NoteSaveAttempt>((event, emit) async {
      emit(AddNoteInProgress());

      (await addNote(event.note)).fold(
      (failure) => emit(AddNoteFailure(errorMessage: errorAddNote)),
      (notes) => emit(AddNoteSuccess()));
    });
  }
}
