import 'package:flutter/material.dart';

class LatihanTiga extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 120,
          width: 500,
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 162, 172, 162),
          ),
          child: Text(
        "Persib Bandung"
        ,style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,),
              ),
        ),
        Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 120,
          width: 150,
          color: Colors.black,
          child: Center(
        child: Container(
          height: 110,
          width: 110,
  
          child: Center(
        child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(width: 100, height: 100, decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/gambar.png"),
            fit: BoxFit.cover,
          ),
        ),),
          ]
        ),)
        ),
        ),
        ),
        Container(
          height: 120,
          width: 150,
          color: Colors.black,
          child: Center(
        child: Container(
          height: 110,
          width: 110,
          child: Center(
        child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(width: 100, height: 100, decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/gambar.png"),
            fit: BoxFit.cover,
          ),
        ),),
          ]
        ),)
        ),
        ),
        ),
      ],
    ),
        Container(
          height: 150,
          width: 430,
          color: const Color.fromARGB(255, 188, 21, 21),
          child: Center(
        child: Container(
          height: 100,
          width: 350,
          color: Colors.blueAccent,
          child: Center(
        child: Text(
        "Login"
        ,style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,),
          ),
              ),
        ),
        ),
        ),
       Container(
          height: 150,
          width: 430,
          color: Colors.black,
          child: Center(
        child: Container(
          height: 100,
          width: 350,
          color: Colors.blueAccent,
          child: Center(
        child: Text(
        "Login"
        ,style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,),
          ),
              ),
        ),
        ),
        ),
      ],
    )
    );
    
  }
}