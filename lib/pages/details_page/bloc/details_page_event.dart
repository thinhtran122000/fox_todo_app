part of 'details_page_bloc.dart';

abstract class DetailsPageEvent {}

class LoadNoteEvent extends DetailsPageEvent {
  final Note note;
  LoadNoteEvent({required this.note});
}

class DeleteNoteEvent extends DetailsPageEvent {
  final Note note;
  DeleteNoteEvent({required this.note});
}


class EnableEditEvent extends DetailsPageEvent {}

class SubmitEditEvent extends DetailsPageEvent {}
