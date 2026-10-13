import 'package:flutter/material.dart';

class ListViewBasic extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final data = List.generate(10, (i) => 'Item ${i + 1}');
    final List<String> ada = List.generate(20, (i) => 'Item ${i + 1}');
    var mediaQuery = MediaQuery.of(context);
    final double widthScreen = mediaQuery.size.width;
    final double heightScreen = mediaQuery.size.height;


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('instagram')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(12),
              child: Text('Pilihan', style: TextStyle(fontSize: 18)),
            ),
            SizedBox(
              height: 120,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 100,
                    decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFFD600),
                  Color(0xFFFF7A00),
                  Color(0xFFFF0069),
                  Color(0xFFD300C5),
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
                    child: Center(child: Text(data[index])),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 12),
              ),
            ),
            Expanded(
              child:  GridView.count(
  crossAxisCount: 1,        // jumlah kolom
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
),
),
          ],
        ),
      ),
    );
  }
}