import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventPath extends StatelessWidget {
  final bool isPast;
  final Widget childWidget; // Adicionei o tipo Widget para melhorar a tipagem

  const EventPath({
    Key? key,
    required this.isPast,
    required this.childWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isPast ? Color(0xFFFFFFFF) : Color(0xFF053261),
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.blueAccent, // Cor da borda
          width: 3.0,        // Espessura da borda
        ),
      ),
      padding: EdgeInsets.all(25.0),
      margin: EdgeInsets.all(20.0),
      child: childWidget,
    );
  }
}
