import 'package:flutter/material.dart';
import 'package:tarefas/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tarefas",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          primary: Color(0xFF95C1E4),
          seedColor: Color(0xFF4997CF),
        ),
        splashColor: Color(0xFF4997CF),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {"/": (context) => HomeScreen()},
    );
  }
}
