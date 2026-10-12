import 'package:flutter/material.dart';

class ListViewSeparated extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final List<String> nama = ['Andi', 'Budi', 'Citra', 'Dewi', 'Eko'];
    return ListView.separated(
  itemCount: nama.length,
  itemBuilder: (context, index) {
    return ListTile(title: Text(nama[index]));
  },
  separatorBuilder: (context, index) {
    return const Divider(thickness: 1);
  },
);
  }
}