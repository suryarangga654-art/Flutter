import 'package:flutter/material.dart';
import 'package:rpl2/container_widget/LatihanSatu.dart';
import 'package:rpl2/container_widget/LatihanDua.dart';
import 'package:rpl2/container_widget/LatihanTiga.dart';
import 'package:rpl2/list_grid_view/LayoutInstagram.dart';
import 'package:rpl2/pages/about_page.dart';
import 'package:rpl2/pages/home_page.dart';
import 'package:rpl2/routes/app_routes.dart';
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
      initialRoute: '/',
      routes: AppRoutes.routes,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}

class HelloWidget extends StatelessWidget {
  const new({
    super.key,
  });

  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ElectroHub Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1B4332), // Forest Green theme matching design
          primary: const Color(0xFF1B4332),
        ),
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        fontFamily: 'sans-serif',
      ),
      initialRoute: AppRoutes.onboarding,
      routes: AppRoutes.routes,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}