import 'package:flutter/material.dart';
import 'package:todolistapp/screens/start_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(
    home: StartScreen(),
  ));
}
