import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Start(),
    );
  }
}

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [
          Align(
            alignment:
            Alignment.topRight,
            child: const ImageTop(),
          ),
          Align(
            alignment: Alignment
                .bottomLeft,
            child: const ImageDown(),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Image.asset("images/logo.png"),
                ),

                const SizedBox(height: 50),

                Container(

                  alignment: Alignment.center ,
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Text(
                    "Bem-Vindo",
                    style: TextStyle(
                      color: Color(0xFF030430),
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ),
                const SizedBox(height: 170),
                Container(
                  alignment: Alignment.center,
                  child: ContainerButton(),
                ),
              ],
            ),
          )


        ],
      ),
    );
  }
}

class ImageTop extends StatelessWidget {
  const ImageTop({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: Image.asset("images/up.png"), // Caminho correto da imagem
    );
  }
}

class ImageDown extends StatelessWidget {
  const ImageDown({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: Image.asset("images/down.png"),
    );
  }
}

class ContainerButton extends StatelessWidget{
  const ContainerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return
      ElevatedButton(
        onPressed: () {
        },
        style: ElevatedButton.styleFrom(
          backgroundColor:Color(0xFF030430),
          fixedSize: Size(200, 50),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
      ),

        child: Text("Bem Vindo", style:TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 20)),
      );
  }
}