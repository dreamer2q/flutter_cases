import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets/dataloader.dart';
import 'widgets/layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Face Savior',
      theme: ThemeData(primarySwatch: Colors.brown),
      debugShowCheckedModeBanner: false,
      home: const LayoutWidget(
        child: DataLoader(),
      ),
    );
  }
}
