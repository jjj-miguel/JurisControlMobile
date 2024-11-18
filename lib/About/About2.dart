import 'package:flutter/material.dart';
import 'package:teste1/About/About.dart';
import 'package:teste1/About/about_scrolling.dart';
import 'package:teste1/Start/Start.dart';

class About2 extends StatelessWidget{
  const About2 ({super.key});
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
                child: Text("Tenha suporte em tempo real e envie suas sugestões sem sair do app!",
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
                child: Image.asset("images/suport.png",
                  width: 300,
                  height: 300,
                ),
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
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => scroll_1()),
                  );              },
                icon: const Icon(Icons.circle_outlined,color: Color(0xFF030430),size: 25,),
              ),
              IconButton(
                onPressed: (){},
                icon: const Icon(Icons.circle, color: Color(0xFF030430), size:25),
              )
            ],
          ),
        ),
      ),
    );
  }
}