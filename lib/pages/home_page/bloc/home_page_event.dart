part of 'home_page_bloc.dart';

abstract class HomePageEvent {
  const HomePageEvent();
}
class ShowListNoteEvent extends HomePageEvent{}

class SearchNoteEvent extends HomePageEvent{}