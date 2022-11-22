import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_app/mock_data/fake_data.dart';
import 'package:todo_app/models/note.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageInitial()) {
    on<ShowListNoteEvent>(_showListNoteEvent);
    on<SearchNoteEvent>(_searchNoteEvent);
  }
  final TextEditingController searchController = TextEditingController();
  FutureOr<void> _showListNoteEvent(ShowListNoteEvent event, Emitter<HomePageState> emit) {
    try {
      var listNoteResult = listNote;
      emit(HomePageSucess(listNote: listNoteResult));
    } catch (e) {
      emit(HomePageError(errorMessage: e.toString()));
    }
  }

  FutureOr<void> _searchNoteEvent(SearchNoteEvent event, Emitter<HomePageState> emit) {
    try {
      if (state is HomePageSucess) {
        List<Note> listResult = [];
        var listNote = (state as HomePageSucess).listNote;
        listResult = listNote
            .where(
              (note) =>
                  note.titleNote.toLowerCase().contains(searchController.text.trim().toLowerCase()),
            )
            .toList();
        // debugPrint('sss$listResult');
        emit(HomePageSucess(listNote: (state as HomePageSucess).listNote, listSearch: listResult));
      }
    } catch (e) {
      emit(HomePageError(errorMessage: e.toString()));
    }
  }

  @override
  void onEvent(HomePageEvent event) {
    log('on-EventLocalBlocHome${event.runtimeType}');
    super.onEvent(event);
  }
}
