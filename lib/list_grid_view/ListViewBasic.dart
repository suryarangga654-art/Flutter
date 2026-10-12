import 'package:flutter/material.dart';

class ListViewBasic extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
  padding: const EdgeInsets.all(8),
  children: const [
    ListTile(leading: Icon(Icons.home), title: Text('Beranda')),
    ListTile(leading: Icon(Icons.person), title: Text('Profil')),
    ListTile(leading: Icon(Icons.settings), title: Text('Pengaturan')),
  ],
);
  }
}