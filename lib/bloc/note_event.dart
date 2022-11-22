part of 'note_bloc.dart';

abstract class NoteEvent {}

class UpdateListNoteEvent extends NoteEvent {
  final List<Note> listNote;
  final List<Note> listSearch;
  UpdateListNoteEvent({required this.listNote, required this.listSearch});
}

class GlobalAddNote extends NoteEvent {
  final Note note;
  GlobalAddNote({required this.note});
}

class GlobalDeleteNote extends NoteEvent {
  final Note note;
  GlobalDeleteNote({required this.note});
}

class GlobalUpdateNote extends NoteEvent{
  final Note note;
  GlobalUpdateNote({required this.note});
}
