// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:todo_app/bloc/note_bloc.dart';
// import 'package:todo_app/models/note.dart';

// class ViewPage extends StatefulWidget {
//   final Note note;
//   const ViewPage({super.key, required this.note});
//   @override
//   State<ViewPage> createState() => _ViewPageState();
// }

// class _ViewPageState extends State<ViewPage> {
//   bool isReadOnly = true;
//   IconData iconEdit = Icons.edit;
//   TextEditingController textEditingControllerTitle = TextEditingController();
//   TextEditingController textEditingControllerDatetime = TextEditingController();
//   TextEditingController textEditingControllerDetails = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leadingWidth: 50,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const SizedBox(
//             // width:0,
//             height: 16.97,
//             child: Icon(
//               Icons.arrow_back_ios_new,
//               color: Colors.black,
//             ),
//           ),
//         ),
//         backgroundColor: Colors.white,
//         elevation: 1,
//         centerTitle: true,
//         toolbarHeight: 50,
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(
//               top: 10,
//               // bottom: 10,
//               left: 30,
//               right: 30,
//             ),
//             child: TextField(
//               readOnly: isReadOnly,
//               keyboardType: TextInputType.multiline,
//               maxLength: null,
//               maxLines: null,
//               style: const TextStyle(
//                 height: 1.55,
//                 color: Colors.black,
//                 fontSize: 24,
//                 fontFamily: 'Roboto',
//                 fontStyle: FontStyle.normal,
//                 fontWeight: FontWeight.w700,
//                 letterSpacing: 0.02,
//               ),
//               textAlignVertical: TextAlignVertical.center,
//               controller: textEditingControllerTitle..text = widget.note.titleNote,
//               cursorHeight: 40,
//               cursorColor: Colors.grey,
//               autofocus: false,
//               decoration: const InputDecoration(
//                 contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
//                 hintText: 'Note\'s title',
//                 hintStyle: TextStyle(
//                   color: Color.fromARGB(126, 158, 158, 158),
//                   fontSize: 24,
//                   fontFamily: 'Roboto',
//                   fontStyle: FontStyle.normal,
//                   fontWeight: FontWeight.w700,
//                   letterSpacing: 0.02,
//                 ),
//                 border: InputBorder.none,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(
//               left: 33,
//               right: 33,
//             ),
//             child: TextField(
//               // datetime
//               readOnly: isReadOnly,
//               keyboardType: TextInputType.multiline,
//               maxLength: null,
//               maxLines: null,
//               style: const TextStyle(
//                 color: Colors.black,
//                 fontSize: 18,
//                 fontFamily: 'Roboto',
//                 fontStyle: FontStyle.normal,
//                 fontWeight: FontWeight.w400,
//                 letterSpacing: 0.02,
//               ),
//               // textAlignVertical: TextAlignVertical.center,
//               controller: textEditingControllerDatetime..text = widget.note.dateTime,
//               cursorHeight: 20,
//               cursorColor: Colors.grey,
//               autofocus: false,
//               decoration: const InputDecoration(
//                 contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
//                 hintText: 'Date time',
//                 hintStyle: TextStyle(
//                   color: Color.fromARGB(126, 158, 158, 158),
//                   fontSize: 16,
//                   fontFamily: 'Roboto',
//                   fontStyle: FontStyle.normal,
//                   fontWeight: FontWeight.w400,
//                   letterSpacing: 0.02,
//                 ),
//                 border: InputBorder.none,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(
//               left: 33,
//               right: 33,
//             ),
//             child: TextField(
//               readOnly: isReadOnly,
//               keyboardType: TextInputType.multiline,
//               maxLength: null,
//               maxLines: null,
//               style: const TextStyle(
//                 color: Colors.black,
//                 fontSize: 18,
//                 fontFamily: 'Roboto',
//                 fontStyle: FontStyle.normal,
//                 fontWeight: FontWeight.w400,
//                 letterSpacing: 0.02,
//               ),
//               textAlignVertical: TextAlignVertical.center,
//               controller: textEditingControllerDetails..text = widget.note.detailsNote,
//               cursorHeight: 20,
//               cursorColor: Colors.grey,
//               autofocus: false,
//               decoration: const InputDecoration(
//                 contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
//                 hintText: 'Note\'s details',
//                 hintStyle: TextStyle(
//                   color: Color.fromARGB(126, 158, 158, 158),
//                   fontSize: 16,
//                   fontFamily: 'Roboto',
//                   fontStyle: FontStyle.normal,
//                   fontWeight: FontWeight.w400,
//                   letterSpacing: 0.02,
//                 ),
//                 border: InputBorder.none,
//               ),
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BlocListener<NoteBloc, NoteState>(
//         listener: listener,
//         child: Container(
//           decoration: const BoxDecoration(
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(color: Colors.white, blurRadius: 1),
//               BoxShadow(color: Colors.grey, blurRadius: 2),
//               BoxShadow(color: Colors.grey, blurRadius: 3),
//             ],
//           ),
//           width: double.infinity,
//           height: 47,
//           child: Center(
//             child: BlocBuilder<NoteBloc, NoteState>(
//               builder: (context, state) {
//                 if (state is SuccessLoadedNotes) {
//                   return Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Material(
//                         child: IconButton(
//                           icon: const ImageIcon(
//                             AssetImage('lib/assets/images/delete.png'),
//                             color: Colors.red,
//                             size: 35,
//                           ),
//                           onPressed: () {
//                             context.read<NoteBloc>().add(DeleteNote(note: widget.note));
//                             Navigator.pop(context);
//                           },
//                         ),
//                       ),
//                       Material(
//                         child: IconButton(
//                           icon: const Icon(
//                             Icons.add_circle,
//                             size: 35,
//                           ),
//                           onPressed: () {
//                             Navigator.pushNamed(context, '/addNotePage');
//                           },
//                         ),
//                       ),
//                       Material(
//                         child: IconButton(
//                             icon: Icon(
//                               iconEdit,
//                               size: 35,
//                             ),
//                             onPressed: () {
//                               // setState(() {
//                               //   isReadOnly = false;
//                               //   textEditingControllerTitle.text = '';
//                               //   textEditingControllerDatetime.text = '';
//                               //   textEditingControllerDetails.text = '';
//                               // });
//                               // // if (textEditingControllerTitle.text != widget.note.titleNote ||
//                               // //     textEditingControllerDatetime.text != widget.note.dateTime ||
//                               // //     textEditingControllerDetails.text != widget.note.detailsNote) {
//                               // //   // isReadOnly = false;

//                               // context.read<NoteBloc>().add(
//                               //       UpdateNote(
//                               //         note: widget.note.copyWith(
//                               //           titleNote: textEditingControllerTitle.text,
//                               //           dateTime: textEditingControllerDatetime.text,
//                               //           details: textEditingControllerDetails.text,
//                               //         ),
//                               //       ),
//                               //     ); //note
//                               debugPrint('==${widget.note.copyWith()}');
//                             }),
//                       )
//                     ],
//                   );
//                 }
//                 // if (state is SuccessAddingNote) {
//                 //   return Row(
//                 //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 //     children: [
//                 //       Material(
//                 //         child: IconButton(
//                 //           icon: const ImageIcon(
//                 //             AssetImage('lib/assets/images/delete.png'),
//                 //             color: Colors.red,
//                 //             size: 35,
//                 //           ),
//                 //           onPressed: () {
//                 //             context.read<NoteBloc>().add(DeleteNote(note: widget.note));
//                 //             Navigator.pop(context);
//                 //           },
//                 //         ),
//                 //       ),
//                 //       Material(
//                 //         child: IconButton(
//                 //           icon: const Icon(
//                 //             Icons.add_circle,
//                 //             size: 35,
//                 //           ),
//                 //           onPressed: () {
//                 //             Navigator.pushNamed(context, '/addNotePage');
//                 //           },
//                 //         ),
//                 //       ),
//                 //       Material(
//                 //         child: IconButton(
//                 //           icon: Icon(
//                 //             iconEdit,
//                 //             size: 35,
//                 //           ),
//                 //           onPressed: () {
//                 //             setState(() {
//                 //               isReadOnly = false;
//                 //               // debugPrint('sss${textEditingControllerTitle.text}');
//                 //               // debugPrint('sss${textEditingControllerDatetime.text}');
//                 //               // debugPrint('sss${textEditingControllerDetails.text}');
//                 //             });
//                 //             debugPrint('sss${textEditingControllerTitle.text}');
//                 //             debugPrint('sss${textEditingControllerDatetime.text}');
//                 //             debugPrint('sss${textEditingControllerDetails.text}');
//                 //             if (textEditingControllerTitle.text != widget.note.titleNote ||
//                 //                 textEditingControllerDatetime.text != widget.note.dateTime ||
//                 //                 textEditingControllerDetails.text != widget.note.detailsNote) {
//                 //               // isReadOnly = false;
//                 //               widget.note.titleNote == textEditingControllerTitle.text;
//                 //               widget.note.titleNote == textEditingControllerDatetime.text;
//                 //               widget.note.titleNote == widget.note.detailsNote;
//                 //               context.read<NoteBloc>().add(UpdateNote(note: widget.note));
//                 //             }
//                 //             // iconEdit = Icons.check_circle;
//                 //             // if (textEditingControllerTitle.text.isEmpty) {
//                 //             //   iconEdit = Icons.edit;
//                 //             // }
//                 //           },
//                 //         ),
//                 //       )
//                 //     ],
//                 //   );
//                 // }
//                 return const Text('No data');
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// listener(BuildContext context, NoteState state) {
//   switch (state.runtimeType) {
//     case SuccessLoadedNotes:
//       ScaffoldMessenger.of(context).showSnackBar(snackBar('Successfully deleting note'));
//       break;
//     default:
//       ScaffoldMessenger.of(context).showSnackBar(snackBar('Successfully deleting note'));
//   }
// }

// SnackBar snackBar(String message) {
//   return SnackBar(
//     behavior: SnackBarBehavior.fixed,
//     backgroundColor: Colors.transparent,
//     elevation: 0,
//     content: Container(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 20,
//         vertical: 10,
//       ),
//       decoration: BoxDecoration(
//         color: Colors.black,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Row(
//         children: [
//           const Icon(Icons.check_circle_rounded, color: Colors.white),
//           const SizedBox(width: 10),
//           Text(
//             message,
//             style: const TextStyle(
//               color: Colors.white,
//               fontFamily: 'Roboto',
//               fontStyle: FontStyle.normal,
//               fontSize: 16,
//               letterSpacing: 0.02,
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
