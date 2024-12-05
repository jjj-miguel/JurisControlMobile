import 'package:flutter/material.dart';
import 'package:teste1/Process/ConsultPage.dart';
import 'package:teste1/Profile/profile.dart';
import 'package:teste1/SecoesdeProcessos/consultaPersonalizada.dart';
import 'package:teste1/Start/Start.dart';
import 'package:teste1/Start/login.dart';

void main() => runApp(const MainApp());

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Start(),
        '/login': (context) => LoginApp(),
        '/profile': (context) => ProfileScreen(),
        '/consult': (context) => const ConsultPage()
      },
    );
  }
}