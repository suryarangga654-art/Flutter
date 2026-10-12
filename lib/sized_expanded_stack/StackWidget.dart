import 'package:flutter/material.dart';

class Stackwidget extends StatelessWidget {
  const Stackwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(width: 200, height: 200, color: Colors.red),
        Positioned(
          bottom: 10,
          right: 10,
          child: Icon(Icons.face_3, color: Colors.white),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: Text("label", style: TextStyle(color: Colors.white)),
        ),
        Positioned(
          right: 25,
          top: 25,
          left: 25,
          child: Container(color: Colors.blue, width: 100, height: 100),
        ),
      ],
    );
  }
}