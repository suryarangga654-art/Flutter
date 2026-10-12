import 'package:flutter/material.dart';

class LatihanSatu extends StatelessWidget {

  @override
   Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      child: Container(
      height: 200,
      width: 300,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color.fromARGB(255, 15, 15, 15),width: 8),
      ),
      child: Text(
        "SMK ASSALAAM BANDUNG",textAlign: TextAlign.center
        ,style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,),
          ),
    ),
    );
  }
}