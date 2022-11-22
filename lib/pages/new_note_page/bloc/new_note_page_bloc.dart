import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/note.dart';

part 'new_note_page_event.dart';
part 'new_note_page_state.dart';

class NewNotePageBloc extends Bloc<NewNotePageEvent, NewNotePageState> {
  NewNotePageBloc() : super(NewNotePageInitial()) {
    on<AddNoteEvent>(_addNoteEvent);
  }
  TextEditingController titleNoteController = TextEditingController();
  TextEditingController datetimeNoteController = TextEditingController();
  TextEditingController detailsNoteController = TextEditingController();
  Color? color;
  FutureOr<void> _addNoteEvent(AddNoteEvent event, Emitter<NewNotePageState> emit) {
    try {
      if (titleNoteController.text.isEmpty ||
          detailsNoteController.text.isEmpty ||
          datetimeNoteController.text.isEmpty) {
        emit(NewNotePageError(errorMessage: 'Field is not empty!'));
      } else {
        var newNote = Note(
          titleNote: titleNoteController.text,
          detailsNote: detailsNoteController.text,
          color: color ?? Colors.red,
          dateTime: datetimeNoteController.text,
        );
        emit(NewNotePageSuccess(note: newNote));
      }
    } catch (e) {
      emit(NewNotePageError(errorMessage: e.toString()));
    }
  }

  @override
  void onEvent(NewNotePageEvent event) {
    log('on-EventLocalBlocNewNote${event.runtimeType}');
    super.onEvent(event);
  }
}
