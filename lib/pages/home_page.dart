import 'package:flutter/material.dart';
import 'package:rpl2/list_grid_view/LayoutInstagram.dart';
import 'package:rpl2/list_grid_view/ListViewBasic.dart';
import 'package:rpl2/pages/about_page.dart';
import 'package:rpl2/pages/form_page.dart';
import 'package:rpl2/pages/input_page.dart';
import 'package:rpl2/pages/text_form_filed.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Halaman Home'),
          const SizedBox(height: 16),

          // ElevatedButton (yang sudah ada)
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return  BelajarForm();
                  },
                ),
              );
            },
            child: const Text('Elevated: Pergi ke formulir'),
          ),

          const SizedBox(height: 8),

          // OutlinedButton
          OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return FormPage();
                  },
                ),
              );
            },
            child: const Text(' Pergi ke list view'),
          ),

          const SizedBox(height: 8),

          // TextButton
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/layoutinstagram');
            },
            child: const Text('Pergi ke Instagram'),
          ),
        ],
      ),
    );
  }
}