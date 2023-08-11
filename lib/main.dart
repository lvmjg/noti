import 'package:flutter/material.dart';

import 'notes_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Noti',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.yellow.shade50,
        appBarTheme: AppBarTheme(
          color: Colors.yellow.shade700
        )
      ),

    );
  }
}
