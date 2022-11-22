import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/note_bloc.dart';

import '../bloc/home_page_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return HomePageBloc()..add(ShowListNoteEvent());
      },
      child: BlocBuilder<NoteBloc, NoteState>(
        builder: (context, state) {
          var noteBloc = BlocProvider.of<NoteBloc>(context);
          return BlocListener<HomePageBloc, HomePageState>(
            listener: (context, state) {
              if (state is HomePageSucess) {
                BlocProvider.of<NoteBloc>(context).add(
                  UpdateListNoteEvent(
                    listNote: state.listNote,
                    listSearch: state.listSearch,
                  ),
                );
              }
            },
            child: GestureDetector(
              onTapDown: (_) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 1,
                  centerTitle: true,
                  toolbarHeight: 50,
                  title: const Text(
                    'Notes',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontStyle: FontStyle.normal,
                      fontSize: 18,
                      color: Colors.black,
                      letterSpacing: 0.02,
                    ),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: double.infinity,
                          height: 20,
                        ),
                        SizedBox(
                          width: 366,
                          height: 48,
                          child: TextField(
                            keyboardType: TextInputType.multiline,
                            maxLength: null,
                            maxLines: null,
                            style: const TextStyle(
                              height: 1.5,
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.02,
                            ),
                            textAlignVertical: TextAlignVertical.center,
                            controller: context.read<HomePageBloc>().searchController,
                            onChanged: (value) =>
                                context.read<HomePageBloc>().add(SearchNoteEvent()),
                            cursorHeight: 26,
                            cursorColor: Colors.grey,
                            autofocus: false,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              hintText: 'Search your notes',
                              hintStyle: const TextStyle(
                                color: Color.fromARGB(126, 158, 158, 158),
                                fontSize: 16,
                                fontFamily: 'Roboto',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.02,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                  style: BorderStyle.solid,
                                  width: 0.7,
                                  color: Colors.grey,
                                  strokeAlign: StrokeAlign.outside,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                  style: BorderStyle.solid,
                                  width: 0.7,
                                  color: Colors.grey,
                                  strokeAlign: StrokeAlign.outside,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: double.infinity,
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          height: 614,
                          color: Colors.white,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: itemBuilder,
                            itemCount: noteBloc.state.listSearch.isEmpty
                                ? noteBloc.state.listNote.length
                                : noteBloc.state.listSearch.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                bottomNavigationBar: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.white, blurRadius: 1),
                      BoxShadow(color: Colors.grey, blurRadius: 2),
                      BoxShadow(color: Colors.grey, blurRadius: 3),
                    ],
                  ),
                  width: double.infinity,
                  height: 47,
                  child: Center(
                    child: BlocBuilder<NoteBloc, NoteState>(
                      builder: (context, state) {
                        if (state is NoteInitial) {
                          return Text(
                            state.listNote.isNotEmpty
                                ? (state.listNote.length <= 1
                                    ? '${state.listNote.length} Note'
                                    : '${state.listNote.length} Notes')
                                : '',
                            style: const TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              letterSpacing: 0.02,
                            ),
                          );
                        }
                        return const Text('');
                      },
                    ),
                  ),
                ),
                floatingActionButton: SizedBox(
                  width: 62,
                  height: 62,
                  child: Align(
                    alignment: const Alignment(0, -7),
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/addNotePage');
                      },
                      backgroundColor: Colors.black,
                      child: const Icon(Icons.add),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    var bloc = BlocProvider.of<NoteBloc>(context);
    var listSearch = bloc.state.listSearch;
    var item = listSearch.isEmpty ? bloc.state.listNote[index] : bloc.state.listSearch[index];
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 14,
      ),
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
          Navigator.of(context).pushNamed(
            '/detailsPage',
            arguments: item,
          );
        },
        child: Container(
          width: 366,
          height: 150,
          // padding: ,
          decoration: BoxDecoration(
            color: item.color,
            borderRadius: BorderRadius.circular(5),
            border: const Border(
              left: BorderSide(color: Colors.grey, strokeAlign: StrokeAlign.outside, width: 0.7),
              right: BorderSide(color: Colors.grey, strokeAlign: StrokeAlign.outside, width: 0.7),
              bottom: BorderSide(color: Colors.grey, strokeAlign: StrokeAlign.outside, width: 0.7),
              top: BorderSide(color: Colors.grey, strokeAlign: StrokeAlign.outside, width: 0.7),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: double.infinity,
                height: 19.5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 0.0,
                  horizontal: 32,
                ),
                child: Text(
                  item.titleNote,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    letterSpacing: 0.02,
                  ),
                ),
              ),
              const SizedBox(
                width: double.infinity,
                height: 3,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 0.0,
                  horizontal: 32,
                ),
                child: Text(
                  item.detailsNote,
                  maxLines: 3,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.02,
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    // return const SizedBox();
  }
}
