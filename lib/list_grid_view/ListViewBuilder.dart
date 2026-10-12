import 'package:flutter/material.dart';

class ListViewBuilder extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final List<String> nama = ['Andi', 'Budi', 'Citra', 'Dewi', 'Eko'];
    return ListView.builder(
  itemCount: nama.length,
  itemBuilder: (context, index) {
    return ListTile(
      leading: CircleAvatar(child: Text('${index + 1}')),
      title: Text(nama[index]),
      onTap: () => print('Klik ${nama[index]}'),
    );
  },
    );
  }
}