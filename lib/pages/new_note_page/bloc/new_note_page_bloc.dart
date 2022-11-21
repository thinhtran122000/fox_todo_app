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
      if (state is NewNotePageSuccess) {
        if (titleNoteController.text.isEmpty ||
            detailsNoteController.text.isEmpty ||
            datetimeNoteController.text.isEmpty) {
          emit(NewNotePageSuccess(listNote: (state as NewNotePageSuccess).listNote));
        } else {
          var note = Note(
            titleNote: titleNoteController.text,
            detailsNote: detailsNoteController.text,
            color: color ?? Colors.white,
            dateTime: datetimeNoteController.text,
          );
          log('$note');
          List<Note> listResult = List.from((state as NewNotePageSuccess).listNote..add(note));
          log('sss${(state as NewNotePageSuccess).listNote}');
          emit(NewNotePageSuccess(listNote: listResult));
        }
      }
    } catch (e) {
      emit(NewNotePageError(errorMessage: e.toString()));
    }
  }

  @override
  void onEvent(NewNotePageEvent event) {
    log('onEvent-${event.runtimeType}');
    super.onEvent(event);
  }
}
