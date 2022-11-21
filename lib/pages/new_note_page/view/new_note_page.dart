import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:todo_app/bloc/note_bloc.dart';
import 'package:todo_app/pages/new_note_page/bloc/new_note_page_bloc.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  Color? result;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewNotePageBloc()..add(AddNoteEvent()),
      child: BlocBuilder<NoteBloc, NoteState>(
        builder: (context, state) {
          var bloc = BlocProvider.of<NoteBloc>(context);
          return BlocListener<NewNotePageBloc, NewNotePageState>(
            listener: (context, state) {
              if (state is NewNotePageSuccess) {
                BlocProvider.of<NoteBloc>(context).add(
                  UpdateListNoteEvent(listNote: state.listNote, listSearch: bloc.state.listSearch),
                );
              }
            },
            child: GestureDetector(
              onTapDown: (_) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Scaffold(
                appBar: AppBar(
                  actions: [
                    IconButton(
                      onPressed: () {
                        // if (state is NewNotePageSuccess) {
                        context.read<NewNotePageBloc>().add(AddNoteEvent());
                        // log('sss${bloc.state.listNote}');
                        Navigator.of(context).popUntil((route) => route.isFirst);
                        // }
                      },
                      icon: const SizedBox(
                        // width:0,
                        height: 16.97,
                        child: Icon(
                          Icons.check_circle_sharp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                  leadingWidth: 50,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const SizedBox(
                      // width:0,
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
                body: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextField(
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
                        controller: context.read<NewNotePageBloc>().titleNoteController,
                        cursorHeight: 40,
                        cursorColor: Colors.grey,
                        autofocus: false,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
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
                      TextField(
                        // datetime
                        onTap: () {},
                        keyboardType: TextInputType.multiline,
                        maxLength: null,
                        maxLines: null,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.02,
                        ),
                        textAlignVertical: TextAlignVertical.center,
                        controller: context.read<NewNotePageBloc>().datetimeNoteController,
                        cursorHeight: 20,
                        cursorColor: Colors.grey,
                        autofocus: false,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
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
                      TextField(
                        keyboardType: TextInputType.multiline,
                        maxLength: null,
                        maxLines: null,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.02,
                        ),
                        textAlignVertical: TextAlignVertical.center,
                        controller: context.read<NewNotePageBloc>().detailsNoteController,
                        cursorHeight: 20,
                        cursorColor: Colors.grey,
                        autofocus: false,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 5, top: 20, bottom: 20),
                            child: Text(
                              'Choose your color',
                              maxLines: null,
                              style: TextStyle(
                                color: Color.fromARGB(126, 158, 158, 158),
                                fontSize: 16,
                                fontFamily: 'Roboto',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.02,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: GestureDetector(
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  color: result ?? context.read<NewNotePageBloc>().color,
                                ),
                              ),
                              onTap: () async {
                                try {
                                  Color pickerColor =
                                      context.read<NewNotePageBloc>().color ?? Colors.red;
                                  result = await showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text('Pick a color'),
                                        content: SingleChildScrollView(
                                          child: ColorPicker(
                                            pickerColor: pickerColor,
                                            onColorChanged: (value) {
                                              setState(() {
                                                pickerColor = value;
                                                result = pickerColor;
                                              });
                                            },
                                          ),
                                        ),
                                        actions: [
                                          ElevatedButton(
                                            child: const Text('Got it'),
                                            onPressed: () {
                                              result = pickerColor;
                                              Navigator.pop(context, result);
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } catch (e) {
                                  // debugPri(e.toString());
                                }
                              },
                            ),
                          ),
                        ],
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
