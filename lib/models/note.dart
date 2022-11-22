import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
// import 'package:uuid/uuid.dart';

class Note {
  String id = const Uuid().v1();
  final Color color;
  final String titleNote;
  final String dateTime;
  final String detailsNote;
  Note(
      {required this.titleNote,
      required this.detailsNote,
      required this.color,
      required this.dateTime});
  @override
  String toString() {
    return '$id $titleNote $detailsNote $dateTime $color';
  }

  Note copyWith({
    String? titleNote,
    String? dateTime,
    String? details,
    Color? color,
  }) {
    return Note(
      titleNote: titleNote ?? this.titleNote,
      color: color ?? this.color,
      dateTime: dateTime ?? this.dateTime,
      detailsNote: details ?? detailsNote,
    );
  }
}
