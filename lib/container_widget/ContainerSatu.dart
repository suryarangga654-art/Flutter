import 'package:flutter/material.dart';

class ContainerSatu extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.only(top: 10, left: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.lime,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black),
        image: DecorationImage(
          image: AssetImage("assets/image/gambar.png"),
          fit: BoxFit.cover,
        ),
        ),
      child: Text(
        "helllo faizal lagi ngapain"
        ),
    );
  }
}