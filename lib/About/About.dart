import 'package:flutter/material.dart';
import 'package:teste1/About/About2.dart';
import 'package:teste1/About/about_scrolling.dart';
import 'package:teste1/Start/Start.dart';

class About extends StatelessWidget{
  const About ({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               const Padding(
            padding: EdgeInsets.all(45),
            child: Text("Acompanhe todos os processos de forma simples e transparente!",
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
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.circle, color: Color(0xFF030430), size:25),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => scroll_2()),
                );              },
              icon: const Icon(Icons.circle_outlined,color: Color(0xFF030430),size: 25,),

            )
          ],
        ),
        ),
      ),
    );
  }
}