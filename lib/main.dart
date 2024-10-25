import 'package:flutter/material.dart';
import 'package:teste1/Start/Start.dart';

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
        //'/profile': (context) => const Profile(),
        //'/minhaConta': (context) => const MinhaConta()
      },
    );
  }
}