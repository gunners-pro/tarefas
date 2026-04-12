import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarefas/blocs/group/group_blocs.dart';
import 'package:tarefas/blocs/group/group_events.dart';
import 'package:tarefas/repositories/group_repository.dart';
import 'package:tarefas/screens/group/group_screen.dart';
import 'package:tarefas/screens/navigation/mainnavigation_screen.dart';
import 'package:tarefas/services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.init();

  runApp(
    BlocProvider(
      create: (_) => GroupBloc(GroupRepository())..add(LoadGroups()),
      child: const MainApp(),
    ),
  );
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
          primary: Color(0xFF4997CF),
          secondary: Color(0xFF95C1E4),
          outline: Color(0xFFE7ECEF),
          seedColor: Color(0xFF4997CF),
        ),
        splashColor: Color(0xFF4997CF),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const MainNavigationScreen(),
        "/group": (context) => GroupScreen(),
      },
    );
  }
}
