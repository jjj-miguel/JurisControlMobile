import 'package:flutter/material.dart';
import 'package:teste1/About/About.dart';
import 'package:teste1/About/About2.dart';

class scroll_1 extends StatelessWidget {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        scrollDirection: Axis.horizontal,

        children:[
          About(),
          About2(),
        ],
      ),
    );
  }
}
class scroll_2 extends StatelessWidget {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        reverse: true,
        children:[
          About2(),
          About(),
        ],
      ),
    );
  }
}
