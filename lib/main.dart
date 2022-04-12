import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_cases/config/firebase_options.dart';
import 'package:flutter_cases/routes/entry_page.dart';
import 'package:flutter/material.dart';

BuildContext? globalContext;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Cases',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        globalContext ??= context;
        return child!;
      },
      home: const EntryPage(),
    );
  }
}
