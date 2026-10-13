import 'package:flutter/material.dart';
import 'package:rpl2/container_widget/LatihanSatu.dart';
import 'package:rpl2/container_widget/LatihanDua.dart';
import 'package:rpl2/container_widget/LatihanTiga.dart';
import 'package:rpl2/list_grid_view/LayoutInstagram.dart';
import 'package:rpl2/row_column_widget/RowColumnWidget.dart';
import 'package:rpl2/row_column_widget/RowWidget.dart';
import 'package:rpl2/row_column_widget/ColumnWidget.dart';
import 'package:rpl2/sized_expanded_stack/ExpandedWidget.dart';
import 'package:rpl2/sized_expanded_stack/SizeBoxWidget.dart';
import 'package:rpl2/sized_expanded_stack/StackWidget.dart';
import 'package:rpl2/sized_expanded_stack/LatihanLima.dart';
import 'package:rpl2/sized_expanded_stack/LayoutSatu.dart';
import 'package:rpl2/sized_expanded_stack/LayoutDua.dart';
import 'package:rpl2/sized_expanded_stack/LayoutTiga.dart';
import 'package:rpl2/sized_expanded_stack/LatihanLayout.dart';
import 'package:rpl2/list_grid_view/ListViewBasic.dart';
import 'package:rpl2/list_grid_view/ListViewCustom.dart';
import 'package:rpl2/list_grid_view/ListViewBuilder.dart';
import 'package:rpl2/list_grid_view/ListViewSeparated.dart';
import 'package:rpl2/list_grid_view/GridViewBasic.dart';
import 'package:rpl2/list_grid_view/GridViewBuilder.dart';
import 'package:rpl2/list_grid_view/GridViewScreen.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Pertamaku",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      //  appBar: AppBar(
      //   title: Text('RPL 2'),
      //   backgroundColor: Colors.blue,
      //   centerTitle:true,
      //  ) , 
       body: Layoutinstagram()
      ),
    );
  }
}

class HelloWidget extends StatelessWidget {
  const new({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
     child: Text("Hello FLutter",style: TextStyle(
       color: Colors.indigo,
       fontSize: 24,
       fontWeight: FontWeight.bold,
       backgroundColor: Colors.amber,
       fontStyle: FontStyle.italic,
     ),
     ),
    );
  }
}