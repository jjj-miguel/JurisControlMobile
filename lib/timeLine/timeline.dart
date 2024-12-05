import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TimelineExample extends StatefulWidget {
  final int processoId;

  const TimelineExample({Key? key, required this.processoId}) : super(key: key);

  @override
  _TimelineExampleState createState() => _TimelineExampleState();
}

class _TimelineExampleState extends State<TimelineExample> {
  int _selectedIndex = -1; // Índice do card selecionado (-1 significa nenhum)
  List<dynamic> timelineData = [];

  @override
  void initState() {
    super.initState();
    fetchTimelineData();
  }

  Future<void> fetchTimelineData() async {
    final String apiUrl = 'https://api.baserow.io/api/database/rows/table/402642/?user_field_names=true';
    final String apiToken = 'mK1hTBbMzDoQFHMcupCEDVg4ctfIPjF7';

    try {
      final response = await http.get(
        Uri.parse('$apiUrl&filter_processoRelacionado_equals=${widget.processoId}'),
        headers: {
          'Authorization': 'Token $apiToken',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          timelineData = data['results'];
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao carregar a linha do tempo.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao se conectar com o servidor.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Processos',
            style: TextStyle(color: Colors.white), // Cor do texto
          ),
          backgroundColor: Color(0xFF030430), // Cor de fundo ajustada
          centerTitle: true, // Centraliza o título
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white), // Cor da seta para voltar
            onPressed: () {
              Navigator.pop(context); // Volta para a tela anterior
            },
          ),
        ),
        body: SingleChildScrollView(
          child: FixedTimeline.tileBuilder(
            theme: TimelineThemeData(
              nodePosition: 0.05,
              connectorTheme: ConnectorThemeData(thickness: 4),
            ),
            builder: TimelineTileBuilder.connected(
              itemCount: timelineData.length,
              connectorBuilder: (_, __, ___) =>
                  SolidLineConnector(color: Color(0xFF14165A)),
              indicatorBuilder: (_, index) => Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _selectedIndex == index
                          ? Colors.white // Bola amarela se selecionada
                          : Colors.white, // Bola azul padrão
                    ),
                  ),
                  Icon(
                    Icons.circle, // Ícone a ser exibido dentro da bola
                    size: 28,
                    color: _selectedIndex == index
                        ? Colors.yellowAccent // Cor do ícone quando selecionado
                        : Color(0xFF14165A), // Cor do ícone padrão
                  ),
                ],
              ),
              contentsBuilder: (_, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    // Atualiza o índice do item selecionado
                    _selectedIndex = _selectedIndex == index ? -1 : index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 20),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            color: _selectedIndex == index
                                ? Colors.white
                                : Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: _selectedIndex == index
                                  ? Colors.blue
                                  : Color(0xFF14165A),
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                timelineData[index]['Registro'] ?? 'Registro não disponível',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    timelineData[index]['Data'] ?? 'Data não disponível',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Icon(Icons.check_circle,
                                      color: Colors.green, size: 20),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}