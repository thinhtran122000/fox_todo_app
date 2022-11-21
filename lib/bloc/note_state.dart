part of 'note_bloc.dart';

abstract class NoteState {
  final List<Note> listNote;
  final List<Note> listSearch;
  const NoteState({
    required this.listNote,
    required this.listSearch,
  });
}

class NoteInitial extends NoteState {
  const NoteInitial({
    required super.listNote,
    required super.listSearch,
  });
}

