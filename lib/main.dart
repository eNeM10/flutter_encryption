import 'package:flutter/material.dart';
import 'package:flutter_encryption/screens/aes_demo_screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: AESDemo(),
      title: 'Flutter Encryption',
    );
  }
}
