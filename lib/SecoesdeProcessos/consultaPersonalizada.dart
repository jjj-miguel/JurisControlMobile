import 'package:flutter/material.dart';
import 'package:teste1/Process/ResultConsult2.dart'; // Certifique-se de ajustar o caminho corretamente
import 'package:teste1/timeLine/timeline.dart'; // Certifique-se de ajustar o caminho corretamente

class consultaPersonalizada extends StatelessWidget {
  final Map<String, dynamic> data;

  const consultaPersonalizada({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Seções do Processos',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        backgroundColor: Color(0xFF030430),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white), // Cor da seta para voltar
          onPressed: () {
            Navigator.pop(context); // Volta para a tela anterior
          },
        ),
      ),
      body: Column(
        children: [
          // Cabeçalho
          Container(
            color: Colors.green,
            width: double.infinity,
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Processo Nº: ${data['numero'] ?? 'Não disponível'}',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Reclamante: ${data['Reclamante'] ?? 'Não disponível'}',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 5),
                Text(
                  'Reclamado: ${data['Reclamado'] ?? 'Não disponível'}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Botão Linha do Tempo
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 60),
              backgroundColor: Colors.white,
              side: const BorderSide(color: Color(0xFF030430), width: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TimelineExample(processoId: data['id'])),
              );
            },
            child: const Text(
              'Linha do Tempo',
              style: TextStyle(color: Color(0xFF030430), fontSize: 16),
            ),
          ),
          const SizedBox(height: 20),
          // Botão Detalhes do Processo
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 50),
              backgroundColor: Colors.white,
              side: const BorderSide(color: Color(0xFF030430), width: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultConsult2(data: data),
                ),
              );
            },
            child: const Text(
              'Detalhes do Processo',
              style: TextStyle(color: Color(0xFF030430), fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class timeLine extends StatelessWidget {
  const timeLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Linha do Tempo',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        backgroundColor: Color(0xFF030430),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const Center(
        child: Text(
          'Linha do tempo',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

class detalhesProcesso extends StatelessWidget {
  const detalhesProcesso({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Processo',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        backgroundColor: Color(0xFF030430),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const Center(
        child: Text(
          'Tela de detalhes',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}