import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:tarefas/screens/home/top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
          child: Column(
            children: [
              TopBar(),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFD2E1E9),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DatePicker(
                  DateTime.now(),
                  height: 88,
                  initialSelectedDate: DateTime.now(),
                  selectionColor: Theme.of(context).colorScheme.primary,
                  selectedTextColor: Colors.white,
                  locale: 'pt_br',
                  daysCount: 8,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
