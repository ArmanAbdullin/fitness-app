import 'package:flutter/material.dart';
import 'screens/auth.dart';

void main() => runApp(MaxFitApp());

class MaxFitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manss fitness',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(50, 65, 85, 1),
        textTheme: TextTheme(
          titleLarge: TextStyle(color: Colors.white),
        ),
      ),
      home: AuthorizationPage(),
    );
  }
}
