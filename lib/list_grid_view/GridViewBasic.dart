import 'package:flutter/material.dart';

class GridViewBasic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //medi query fungsinya untuk menentukan ketnggian dan kelebaran
    // dari layout yang kita buat agar responsive
    var mediaQuery = MediaQuery.of(context);
    final double widthScreen = mediaQuery.size.width;
    final double heightScreen = mediaQuery.size.height;

    return GridView.count(
  crossAxisCount: 2,        // jumlah kolom
  crossAxisSpacing: 10,     // jarak horizontal antar item
  mainAxisSpacing: 10, 
  childAspectRatio: widthScreen / heightScreen,   // perbandingan lebar : tinggi
  padding: const EdgeInsets.all(10),
  children: [
    Container(color: Colors.red, child: const Center(child: Text('1'))),
    Container(color: Colors.green, child: const Center(child: Text('2'))),
    Container(color: Colors.blue, child: const Center(child: Text('3'))),
    Container(color: Colors.orange, child: const Center(child: Text('4'))),
  ],
);
  }
}