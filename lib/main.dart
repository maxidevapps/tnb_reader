import 'package:flutter/material.dart';

import 'features/reader/reader_screen.dart';

void main() {
  runApp(const TNBReaderApp());
}

class TNBReaderApp extends StatelessWidget {
  const TNBReaderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TNB Reader',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.red,
      ),
      home: const ReaderScreen(),
    );
  }
}