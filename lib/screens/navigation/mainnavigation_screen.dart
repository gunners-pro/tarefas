import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:tarefas/screens/home/home_screen.dart';
import 'package:tarefas/screens/tasks/addtask_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _index = 0;

  final List<Widget> _screens = [HomeScreen(), AddTaskScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_index],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _index,
        onTap: (value) {
          setState(() => _index = value);
        },
        unselectedItemColor: Colors.grey,
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home_filled),
            title: Text("Home"),
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.add_box),
            title: Text("Nova tarefa"),
          ),
        ],
      ),
    );
  }
}
