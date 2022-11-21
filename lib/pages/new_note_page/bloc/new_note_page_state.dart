part of 'new_note_page_bloc.dart';

abstract class NewNotePageState {
  const NewNotePageState();
}

class NewNotePageInitial extends NewNotePageState {}

class NewNotePageSuccess extends NewNotePageState {
  final List<Note> listNote;
  NewNotePageSuccess({required this.listNote});
}

class NewNotePageError extends NewNotePageState {
  final String errorMessage;
  NewNotePageError({required this.errorMessage});
}
