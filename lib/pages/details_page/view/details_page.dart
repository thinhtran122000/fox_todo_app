import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/note_bloc.dart';

import '../../../models/note.dart';
import '../bloc/details_page_bloc.dart';

class ViewPage extends StatefulWidget {
  final Note note;
  const ViewPage({super.key, required this.note});
  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsPageBloc()..add(LoadNoteEvent(note: widget.note)),
      child: BlocBuilder<DetailsPageBloc, DetailsPageState>(
        builder: (context, state) {
          var bloc = context.read<DetailsPageBloc>();
          return BlocListener<DetailsPageBloc, DetailsPageState>(
            listener: (context, state) {
              if (state is DeleteNoteSuccess) {
                BlocProvider.of<NoteBloc>(context).add(GlobalDeleteNote(note: state.note));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Delete success'),
                    duration: Duration(milliseconds: 2000),
                  ),
                );
              } else if (state is UpdateNoteSuccess) {
                BlocProvider.of<NoteBloc>(context).add(GlobalUpdateNote(note: state.note));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Update success'),
                    duration: Duration(milliseconds: 2000),
                  ),
                );
              }
            },
            child: Scaffold(
              appBar: AppBar(
                leadingWidth: 50,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const SizedBox(
                    height: 16.97,
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                    ),
                  ),
                ),
                backgroundColor: Colors.white,
                elevation: 1,
                centerTitle: true,
                toolbarHeight: 50,
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 30,
                      right: 30,
                    ),
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLength: null,
                      maxLines: null,
                      style: const TextStyle(
                        height: 1.55,
                        color: Colors.black,
                        fontSize: 24,
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.02,
                      ),
                      textAlignVertical: TextAlignVertical.center,
                      controller: bloc.titleNoteController,
                      enabled: bloc.isEnabled,
                      cursorHeight: 40,
                      cursorColor: Colors.grey,
                      autofocus: false,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                        hintText: 'Note\'s title',
                        hintStyle: TextStyle(
                          color: Color.fromARGB(126, 158, 158, 158),
                          fontSize: 24,
                          fontFamily: 'Roboto',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.02,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 33,
                      right: 33,
                    ),
                    child: TextField(
                      // datetime
                      // readOnly: isReadOnly,
                      keyboardType: TextInputType.multiline,
                      maxLength: null,
                      maxLines: null,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.02,
                      ),
                      // textAlignVertical: TextAlignVertical.center,
                      controller: bloc.dateTimeNoteController,
                      enabled: bloc.isEnabled,
                      cursorHeight: 20,
                      cursorColor: Colors.grey,
                      autofocus: false,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                        hintText: 'Date time',
                        hintStyle: TextStyle(
                          color: Color.fromARGB(126, 158, 158, 158),
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.02,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 33,
                      right: 33,
                    ),
                    child: TextField(
                      // readOnly: isReadOnly,
                      keyboardType: TextInputType.multiline,
                      maxLength: null,
                      maxLines: null,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.02,
                      ),
                      textAlignVertical: TextAlignVertical.center,
                      controller: bloc.detailsNoteController,
                      enabled: bloc.isEnabled,
                      cursorHeight: 20,
                      cursorColor: Colors.grey,
                      autofocus: false,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                        hintText: 'Note\'s details',
                        hintStyle: TextStyle(
                          color: Color.fromARGB(126, 158, 158, 158),
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.02,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Material(
                        child: IconButton(
                          icon: const ImageIcon(
                            AssetImage('lib/assets/images/delete.png'),
                            color: Colors.red,
                            size: 35,
                          ),
                          onPressed: () {
                            context.read<DetailsPageBloc>().add(DeleteNoteEvent(note: widget.note));
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Material(
                        child: IconButton(
                          icon: const Icon(
                            Icons.add_circle,
                            size: 35,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/addNotePage');
                          },
                        ),
                      ),
                      bloc.isEnabled
                          ? Material(
                              child: IconButton(
                                icon: const Icon(
                                  Icons.check_circle_outlined,
                                  size: 35,
                                ),
                                onPressed: () {
                                  context.read<DetailsPageBloc>().add(SubmitEditEvent());
                                },
                              ),
                            )
                          : Material(
                              child: IconButton(
                                icon: const Icon(
                                  Icons.edit,
                                  size: 35,
                                ),
                                onPressed: () {
                                  context.read<DetailsPageBloc>().add(EnableEditEvent());
                                },
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

SnackBar snackBar(String message) {
  return SnackBar(
    behavior: SnackBarBehavior.fixed,
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Icon(Icons.check_circle_rounded, color: Colors.white),
          const SizedBox(width: 10),
          Text(
            message,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Roboto',
              fontStyle: FontStyle.normal,
              fontSize: 16,
              letterSpacing: 0.02,
            ),
          ),
        ],
      ),
    ),
  );
}
