import 'package:flutter/material.dart';

class LatihanDua extends StatelessWidget {

  @override
   Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 300,
        width: 200,
        color: Colors.blueAccent,
        child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(width: 100, height: 100, decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/gambar.png"),
            fit: BoxFit.cover,
          ),
        ),),
            Column(
            children: [
              Text("Nama: Faizal"),
              Text("Kelas: XI RPL 2"),
              Text("NIS: 123456789"),
          ],
        ),
        ],
            ),
      ),
    );
  }
}