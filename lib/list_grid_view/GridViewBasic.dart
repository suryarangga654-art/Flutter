import 'package:flutter/material.dart';

class GridViewBasic extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GridView.count(
  crossAxisCount: 2,        // jumlah kolom
  crossAxisSpacing: 10,     // jarak horizontal antar item
  mainAxisSpacing: 10,      // jarak vertikal antar item
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