import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../models/note.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  TextEditingController textEditingControllerSearchNote = TextEditingController();
  NoteBloc()
      : super(const NoteInitial(
          listNote: [],
          listSearch: [],
        )) {
    on<UpdateListNoteEvent>(_showNote);
  }

  FutureOr<void> _showNote(UpdateListNoteEvent event, Emitter<NoteState> emit) {
    emit(NoteInitial(listNote: event.listNote, listSearch: event.listSearch));
  }

  @override
  void onEvent(NoteEvent event) {
    log('onEvent-${event.runtimeType}');
    super.onEvent(event);
  }
}




  // FutureOr<void> _showNote(ShowNotes event, Emitter<NoteState> emit) {
  //   var currentState = state;
  //   if (currentState is LoadingNotes) {
  //     List<Note> newListNote = event.notes;
  //     emit(SuccessLoadedNotes(notes: newListNote));
  //   }
  // }

  // FutureOr<void> _addNote(AddNote event, Emitter<NoteState> emit) {
  //   var currentState = state;
  //   if (currentState is SuccessLoadedNotes) {
  //     List<Note> newListNote = List.from(currentState.notes)..add(event.note);
  //     emit(SuccessLoadedNotes(notes: newListNote));
  //   }
  // }

  // FutureOr<void> _updateNote(UpdateNote event, Emitter<NoteState> emit) {
  //   var currentState = state;
  //   if (currentState is SuccessLoadedNotes) {
  //     List<Note> newListNote = currentState.notes.map((note) => note.id == event.note.id ? event.note : note).toList();
  //     emit(SuccessLoadedNotes(notes: newListNote));
  //   }
  // }

  // FutureOr<void> _deleteNote(DeleteNote event, Emitter<NoteState> emit) {
  //   var currentState = state;
  //   if (currentState is SuccessLoadedNotes) {
  //     List<Note> newListNote = currentState.notes.where((note) {
  //       return note.id != event.note.id;
  //     }).toList();
  //     emit(SuccessLoadedNotes(notes: newListNote));
  //   }
  // }

  // FutureOr<void> _searchNote(SearchNote event, Emitter<NoteState> emit) {
  //   try {
  //     var currentState = state;
  //     if (currentState is SuccessLoadedNotes) {
  //       if (textEditingControllerSearchNote.text.isNotEmpty) {
  //         // debugPrint(textEditingControllerSearchNote.text);
  //         List<Note> listResult = [];
  //         listResult.addAll(currentState.notes
  //             .where((note) => note.titleNote.toLowerCase().contains(textEditingControllerSearchNote.text.trim().toLowerCase()))
  //             .toList());

  //         print('');
  //         // if (listResult.isEmpty) {
  //         //   emit(SuccessLoadedNotes(notes: currentState.notes));
  //         // } else {
  //         //   emit(SuccessLoadedNotes(notes: currentState.notes,listResults: listResult));
  //         // }
  //         emit(SuccessLoadedNotes(notes: currentState.notes, listResults: listResult));
  //       } else {
  //         debugPrint('Go go ${currentState.notes.length}');
  //         emit(SuccessLoadedNotes(notes: currentState.notes));
  //       }
  //     }
  //   } catch (e) {
  //     debugPrint('Error: $e');
  //   }
  // }