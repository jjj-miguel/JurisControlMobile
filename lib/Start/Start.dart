
import 'package:flutter/material.dart';
import 'package:teste1/About/About.dart';
import 'package:teste1/Start/cadastro.dart';
import 'package:teste1/Start/login.dart';
import 'package:teste1/timeLine/timeline.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [
          const Align(
            alignment:
            Alignment.topRight,
              child: ImageTop(),
          ),
          const Align(
            alignment: Alignment
                .bottomLeft,
            child: ImageDown(),
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
                  child: const Text(
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
                  child: const ContainerButton(),
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
        onPressed: (

            ) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  LoginScreen()),);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor:const Color(0xFF030430),
          fixedSize: const Size(180, 40),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),

        child: const Text("Entrar", style:TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 20)),
      );
  }
}