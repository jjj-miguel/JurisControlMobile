import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class TimelineExample extends StatefulWidget {
  const TimelineExample({Key? key}) : super(key: key);

  @override
  _TimelineExampleState createState() => _TimelineExampleState();
}

class _TimelineExampleState extends State<TimelineExample> {
  int _selectedIndex = -1; // Índice do card selecionado (-1 significa nenhum)

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
              itemCount: 20,
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
                                'Conclusos os autos para despacho (genérica) a Daniele Pimentel de Lira - Item ${index + 1}',
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
                                    '29/10/2024',
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
