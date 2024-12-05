import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:teste1/Profile/profile.dart';
import 'package:teste1/SecoesdeProcessos/consultaPersonalizada.dart';

class ConsultPage extends StatefulWidget {
  const ConsultPage({super.key});

  @override
  State<ConsultPage> createState() => MyConsultPage();
}

class MyConsultPage extends State<ConsultPage> {
  final maskFormatter = MaskTextInputFormatter(mask: '####-####.###.####', filter: {'#': RegExp(r'[0-9]')});
  final TextEditingController _processoController = TextEditingController();

  Future<void> buscarProcesso(BuildContext context) async {
    final String numeroProcesso = _processoController.text;

    if (numeroProcesso.isNotEmpty) {
      // URL da API e Token
      final String apiUrl = 'https://api.baserow.io/api/database/rows/table/402641/?user_field_names=true';
      final String apiToken = 'mK1hTBbMzDoQFHMcupCEDVg4ctfIPjF7';

      try {
        final response = await http.get(
          Uri.parse('$apiUrl&filter_numero_equals=$numeroProcesso'),
          headers: {
            'Authorization': 'Token $apiToken',
            'Content-Type': 'application/json',
          },
        );

        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          if (data['results'].isNotEmpty) {
            // Verifique se o número do processo corresponde ao que foi digitado
            final processo = data['results'].firstWhere(
              (processo) => processo['numero'] == numeroProcesso,
              orElse: () => null,
            );

            if (processo != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => consultaPersonalizada(data: processo as Map<String, dynamic>),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Processo não encontrado! Tente novamente.')),
              );
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Processo não encontrado! Tente novamente.')),
            );
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Erro no servidor. Tente novamente mais tarde.')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao se conectar com o servidor.')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, preencha o campo número processual.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuButton(),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 30,
        ),
        backgroundColor: const Color(0xFF030430),
        title: const Text("Consultar Processo", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Column(
                children: [
                  Text(
                    "Informar o número processual único (NPU) do processo no formato XXXX-XXXX.XXX.XXXX",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Exemplo: 2024-0925.001.1000",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Número Processual:"),
                const SizedBox(height: 7),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: _processoController,
                    inputFormatters: [maskFormatter],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Color(0xFFD9D9D9),
                      labelText: 'XXXX-XXXX.XXX.XXXX',
                      labelStyle: TextStyle(),
                      contentPadding: EdgeInsets.all(10),
                    ),
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () => buscarProcesso(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF030430),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text(
                "Consultar",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFF030430),
                overlayColor: Colors.transparent,
              ),
              child: const Text(
                "Filtrar",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuButton extends StatefulWidget {
  const MenuButton({super.key});

  @override
  State<MenuButton> createState() => MyMenuButton();
}

class MyMenuButton extends State<MenuButton> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20),
            color: const Color(0xFF030430),
            alignment: Alignment.center,
            child: const Text("Menu", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  const Text(
                    "Matheus V. do Nascimento",
                    style: TextStyle(color: Color(0xFF030430), fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "matheus@gmail.com",
                    style: TextStyle(color: Color(0xFF6C75C3), fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(height: 15),
                  const Divider(height: 1),
                  const SizedBox(height: 15),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                          },
                          icon: const Icon(Icons.people),
                          color: const Color(0xFF030430),
                          style: const ButtonStyle(overlayColor: MaterialStatePropertyAll(Colors.transparent)),
                        ),
                        const Text(
                          "Perfil",
                          style: TextStyle(color: Color(0xFF030430), fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.logout_outlined),
                      color: const Color(0xFF030430),
                      style: const ButtonStyle(overlayColor: MaterialStatePropertyAll(Colors.transparent)),
                    ),
                    const Text(
                      "Sair",
                      style: TextStyle(color: Color(0xFF030430), fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}