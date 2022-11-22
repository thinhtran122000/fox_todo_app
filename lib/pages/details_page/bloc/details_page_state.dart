part of 'details_page_bloc.dart';

abstract class DetailsPageState {}

class DetailsPageInitial extends DetailsPageState {}

class DetailsLoadSuccess extends DetailsPageState {
  final Note note;
  DetailsLoadSuccess({required this.note});
}

class DeleteNoteSuccess extends DetailsPageState {
  final Note note;
  DeleteNoteSuccess({required this.note});
}

class UpdateNoteSuccess extends DetailsPageState {
  final Note note;
  UpdateNoteSuccess({required this.note});
}

class DetailsLoadError extends DetailsPageState {
  final String errorMessage;
  DetailsLoadError({required this.errorMessage});
}
