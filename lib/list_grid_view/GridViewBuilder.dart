import 'package:flutter/material.dart';

class GridViewBuilder extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final List<String> data = List.generate(20, (i) => 'Item ${i + 1}');
    return GridView.builder(
  padding: const EdgeInsets.all(10),
  itemCount: data.length,
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
    childAspectRatio: 1,   // perbandingan lebar : tinggi
  ),
  itemBuilder: (context, index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(child: Text(data[index])),
    );
  },
);
  }
}