part of 'home_page_bloc.dart';

abstract class HomePageState {
  const HomePageState();
}

class HomePageInitial extends HomePageState {}

class HomePageSucess extends HomePageState {
  final List<Note> listNote;
  final List<Note> listSearch;
  HomePageSucess({required this.listNote, this.listSearch = const []});
}

class HomePageError extends HomePageState {
  final String errorMessage;
  HomePageError({required this.errorMessage});
}
