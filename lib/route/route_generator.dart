// ignore_for_file: prefer_const_constructors

import 'package:emloyee_book/screen/add_employee_screen.dart';
import 'package:emloyee_book/screen/home_screen.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/add_employee':
        return MaterialPageRoute(builder: (_) => AddEmployeeScreen());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: Text('NoRoute')),
        body: (const Center(
          child: Text('Sorry Route Has Not Found'),
        )),
      );
    });
  }
}
