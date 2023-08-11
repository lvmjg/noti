import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'features/notes/presentation/widget/notes_page.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseFirestore ff = FirebaseFirestore.instance;
  ff.useFirestoreEmulator('127.0.0.1', 8080);

  FirebaseStorage fs = FirebaseStorage.instance;
  fs.useStorageEmulator('127.0.0.1', 9199);

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
      home: const NotesPage(),
    );
  }
}
