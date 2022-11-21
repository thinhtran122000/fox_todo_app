import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'view_page_event.dart';
part 'view_page_state.dart';

class ViewPageBloc extends Bloc<ViewPageEvent, ViewPageState> {
  ViewPageBloc() : super(ViewPageInitial()) {
    on<ViewPageEvent>((event, emit) {
    });
  }
}
