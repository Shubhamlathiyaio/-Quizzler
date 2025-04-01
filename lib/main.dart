import 'package:flutter/material.dart';
import 'package:quizzler/pages/home_page.dart';
import 'package:quizzler/pages/result.dart';

void main() => runApp(MainApp());


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}