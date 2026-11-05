
import 'package:flutter/material.dart';
import 'views/home/home_page.dart';

void main() {
  runApp(const FlutterLearnApp());
}

class FlutterLearnApp extends StatelessWidget {
  const FlutterLearnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlutterLearn',

      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor:
            const Color(0xFFF5F8F7),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF16866A),
        ),
      ),

      home: const HomePage(),
    );
  }
}
