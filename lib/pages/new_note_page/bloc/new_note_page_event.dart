part of 'new_note_page_bloc.dart';

abstract class NewNotePageEvent {
  const NewNotePageEvent();
}

class AddNoteEvent extends NewNotePageEvent {}
