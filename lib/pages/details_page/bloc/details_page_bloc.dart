import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/note.dart';

part 'details_page_event.dart';
part 'details_page_state.dart';

class DetailsPageBloc extends Bloc<DetailsPageEvent, DetailsPageState> {
  TextEditingController titleNoteController = TextEditingController();
  TextEditingController dateTimeNoteController = TextEditingController();
  TextEditingController detailsNoteController = TextEditingController();
  bool isEnabled = false;
  DetailsPageBloc() : super(DetailsPageInitial()) {
    on<LoadNoteEvent>(_loadNoteEvent);
    on<DeleteNoteEvent>(_deleteNoteEvent);
    on<EnableEditEvent>(_enableEditEvent);
    on<SubmitEditEvent>(_submitEditEvent);
  }

  FutureOr<void> _loadNoteEvent(LoadNoteEvent event, Emitter<DetailsPageState> emit) {
    titleNoteController.text = event.note.titleNote;
    dateTimeNoteController.text = event.note.dateTime;
    detailsNoteController.text = event.note.detailsNote;

    emit(DetailsLoadSuccess(note: event.note));
  }

  FutureOr<void> _deleteNoteEvent(DeleteNoteEvent event, Emitter<DetailsPageState> emit) {
    emit(DeleteNoteSuccess(note: event.note));
  }

  FutureOr<void> _enableEditEvent(EnableEditEvent event, Emitter<DetailsPageState> emit) {
    if (state is DetailsLoadSuccess) {
      isEnabled = !isEnabled;
      emit(DetailsLoadSuccess(note: (state as DetailsLoadSuccess).note));
    }
  }

  FutureOr<void> _submitEditEvent(SubmitEditEvent event, Emitter<DetailsPageState> emit) {
    if (state is DetailsLoadSuccess) {
      isEnabled = false;
      var currentNote = (state as DetailsLoadSuccess).note;
      var newNote = Note(
        titleNote: titleNoteController.text,
        dateTime: dateTimeNoteController.text,
        detailsNote: detailsNoteController.text,
        color: currentNote.color,
      );
      newNote.id = currentNote.id;
      emit(UpdateNoteSuccess(note: newNote));
    }
  }

  @override
  void onEvent(DetailsPageEvent event) {
    log('on-EventLocalBlocDetails ${event.runtimeType}');
    super.onEvent(event);
  }
}
