import 'package:flutter/material.dart';
import 'package:rpl2/list_grid_view/LayoutInstagram.dart';
import 'package:rpl2/pages/about_page.dart';
import 'package:rpl2/pages/home_page.dart';
import 'package:rpl2/pages/text_form_filed.dart';

class AppRoutes {
  static const home = '/';
  static const about = '/about';
  static const layoutinstagram = '/layoutinstagram';
  static const formulir = '/formulir';

  static Map<String, WidgetBuilder> routes = { 
    home: (context) => HomePage(),
    about: (context) => AboutPage(),
    layoutinstagram:(context) => Layoutinstagram(),
    formulir:(context) => TextFormFiled(),
  };
}