import 'package:flutter/material.dart';
import 'package:tarefas/screens/home/top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
          child: Column(children: [TopBar()]),
        ),
      ),
    );
  }
}
