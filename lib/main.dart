import 'package:flutter/material.dart';
import 'package:mapy2/pages/home_page.dart';

void main() {
  runApp(const MapyApp());
}

class MapyApp extends StatelessWidget {
  const MapyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mapy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'Pretendard',
      ),
      home: const HomePage(),
    );
  }
}
