part of 'note_bloc.dart';

abstract class NoteEvent {}

class UpdateListNoteEvent extends NoteEvent {
  final List<Note> listNote;
  final List<Note> listSearch;
  UpdateListNoteEvent({required this.listNote, required this.listSearch});
}

// class SearchNote extends NoteEvent {}

// class AddNote extends NoteEvent {
//   final Note note;
//   const AddNote({required this.note});

//   @override
//   List<Object> get props => [note];
// }

// class UpdateNote extends NoteEvent {
//   final Note note;
//   const UpdateNote({required this.note});
//   @override
//   List<Object> get props => [note];
// }

// class DeleteNote extends NoteEvent {
//   final Note note;
//   const DeleteNote({required this.note});
//   @override
//   List<Object> get props => [note];
// }

// class SearchNote extends NoteEvent {}
