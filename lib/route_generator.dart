import 'package:flutter/material.dart';
import 'package:todo_app/models/note.dart';
import 'package:todo_app/pages/details_page/view/details_page.dart';
import 'package:todo_app/pages/home_page/view/home_page.dart';
import 'package:todo_app/pages/new_note_page/view/new_note_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/homePage':
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );

      case '/detailsPage':
        if (args is Note) {
          return MaterialPageRoute(
            builder: (context) => ViewPage(
              note: args,
            ),
          );
        }
        return errorRoute();
      case '/addNotePage':
        return MaterialPageRoute(
          builder: (context) => const AddNotePage(),
        );
      default:
        return errorRoute();
    }
  }

  static Route<dynamic> errorRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Error',
          ),
        ),
        body: const Center(
          child: Text('Error'),
        ),
      ),
    );
  }
}
