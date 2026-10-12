import 'package:flutter/material.dart';

class Sizeboxwidget extends StatelessWidget {
  const Sizeboxwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("baris 1"),
          SizedBox(height: 10),
          Text("baris 2"),
          SizedBox(
            width: 150,
            height: 50,
            child: ElevatedButton(onPressed: () {}, child: Text("tombol")),
        )
      ],)
    );
  }
}