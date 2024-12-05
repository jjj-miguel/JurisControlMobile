import 'package:flutter/material.dart';

class ResultConsult2 extends StatefulWidget {
  final Map<String, dynamic> data;

  const ResultConsult2({super.key, required this.data});

  @override
  State<ResultConsult2> createState() => MyResultConsult();
}

class MyResultConsult extends State<ResultConsult2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xFF030430),
        title: const Text("Processos", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text("Detalhes do Processo", style: TextStyle(color: Color(0xFF030430), fontSize: 25, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 50),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: const Color(0xFF030430), width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SizedBox(
                    width: 300,
                    height: 420,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 25),
                        Secao(titulo: "Número do Processo", conteudo: widget.data['numero'] ?? 'Não disponível'),
                        const SizedBox(height: 7),
                        Secao(titulo: "Reclamante", conteudo: widget.data['Reclamante'] ?? 'Não disponível'),
                        const SizedBox(height: 7),
                        Secao(titulo: "Advogado do Reclamante", conteudo: widget.data['AdvogadoReclamante'] ?? 'Não disponível'),
                        const SizedBox(height: 16),
                        Secao(titulo: "Reclamado", conteudo: widget.data['Reclamado'] ?? 'Não disponível'),
                        const SizedBox(height: 7),
                        Secao(titulo: "Advogado do Reclamado", conteudo: widget.data['AdvogadoReclamado'] ?? 'Não disponível'),
                        const SizedBox(height: 16),
                        Secao(titulo: "Tipo", conteudo: widget.data['Tipo'] ?? 'Não disponível'),
                        const SizedBox(height: 16),
                        Secao(titulo: "Status", conteudo: widget.data['Status'] ?? 'Não disponível'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Secao extends StatelessWidget {
  final String titulo;
  final String conteudo;

  const Secao({super.key, required this.titulo, required this.conteudo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(titulo, style: const TextStyle(color: Color(0xFF030430), fontSize: 18, fontWeight: FontWeight.bold)),
          Text(conteudo, style: const TextStyle(color: Color(0xFF8C8C8C), fontSize: 14)),
        ],
      ),
    );
  }
}