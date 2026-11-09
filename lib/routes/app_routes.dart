import 'package:flutter/material.dart';
import 'package:rpl2/list_grid_view/LayoutInstagram.dart';
import 'package:rpl2/pages/about_page.dart';
import 'package:rpl2/pages/home_page.dart';
import 'package:rpl2/pages/text_form_filed.dart';
import 'package:rpl2/pages/form_page.dart';
import 'package:rpl2/pages/input_page.dart';
import 'package:rpl2/pages/output_page.dart';
class AppRoutes {
  static const home = '/';
  static const about = '/about';
  static const layoutinstagram = '/layoutinstagram';
  static const formulir = '/formulir';
  static const form = '/form';
  static const inputFrom = '/input';

  static Map<String, WidgetBuilder> routes = { 
    home: (context) => HomePage(),
    about: (context) => AboutPage(),
    layoutinstagram:(context) => Layoutinstagram(),
    formulir:(context) => TextFormFiled(),
    form:(context) => FormPage(),
    inputFrom:(context) => BelajarForm(),
  };
}