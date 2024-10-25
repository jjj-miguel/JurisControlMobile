import 'package:flutter/material.dart';
import 'package:teste1/timeLine/timeline.dart';
import 'package:timeline_tile/timeline_tile.dart';
class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.close,
                color: Color(0xFF030430),
                size: 20,
              ),
              onPressed: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  HomeScreen()),
                  );

              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(45),
                child: Text(
                  "Acompanhe todos os processos de forma simples e transparente!",
                  style: TextStyle(
                    color: Color(0xFF030430),
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(45),
                child: Image.asset("images/Search.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
