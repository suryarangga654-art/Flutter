import 'package:flutter/material.dart';

class ListViewCustom extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.custom(
  childrenDelegate: SliverChildBuilderDelegate(
    (context, index) {
      return ListTile(title: Text('Item $index'));
    },
    childCount: 20,
  ),
);
  }
}