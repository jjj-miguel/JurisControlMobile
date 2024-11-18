import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:teste1/timeLine/timeline.dart';
import 'package:timeline_tile/timeline_tile.dart';
class About extends StatelessWidget {
  const About({super.key});

=======
import 'package:teste1/About/About2.dart';
import 'package:teste1/About/about_scrolling.dart';
import 'package:teste1/Start/Start.dart';

class About extends StatelessWidget{
  const About ({super.key});
>>>>>>> a7e47482ceb5cbd10bbc4ad227b5dde3c8bd38c0
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
<<<<<<< HEAD
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
=======
        body: Center(
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               const Padding(
            padding: EdgeInsets.all(45),
            child: Text("Acompanhe todos os processos de forma simples e transparente!",
>>>>>>> a7e47482ceb5cbd10bbc4ad227b5dde3c8bd38c0
                  style: TextStyle(
                    color: Color(0xFF030430),
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.none,
                  ),
<<<<<<< HEAD
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
=======
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
>>>>>>> a7e47482ceb5cbd10bbc4ad227b5dde3c8bd38c0
