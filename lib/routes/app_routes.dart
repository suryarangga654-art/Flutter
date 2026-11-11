import 'package:flutter/material.dart';
import 'package:rpl2/list_grid_view/LayoutInstagram.dart';
import 'package:rpl2/pages/about_page.dart';
import 'package:rpl2/pages/home_page.dart';
import 'package:rpl2/pages/onboarding_page.dart';
import 'package:rpl2/pages/receipt_page_.dart';
import 'package:rpl2/pages/text_form_filed.dart';
import 'package:rpl2/pages/form_page.dart';
import 'package:rpl2/pages/input_page.dart';
import 'package:rpl2/pages/output_page.dart';
import 'package:rpl2/pages/homes_page.dart';
import '../pages/detail_page.dart';
import '../pages/payment_page.dart';

class AppRoutes {
  static const onboarding = '/onboarding';
  static const home = '/';
  static const homes = '/homes';
  static const about = '/about';
  static const layoutinstagram = '/layoutinstagram';
  static const formulir = '/formulir';
  static const form = '/form';
  static const inputFrom = '/input';
  static const detail = '/detail';
  static const payment = '/payment';
  static const receipt = '/receipt';

  // Combined and fixed routes map without duplicate declarations
  static final Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePage(),
    homes: (context) => const HomesPage(),

    onboarding: (context) => const OnboardingPage(),
    about: (context) => const AboutPage(),
    layoutinstagram: (context) => const Layoutinstagram(),
    formulir: (context) => TextFormFiled(),
    form: (context) => const FormPage(),
    inputFrom: (context) => const BelajarForm(),
  };

  // Electronic store items list using List<Map> with 10 items
  static final List<Map<String, dynamic>> electronicProducts = [
    {
      'name': 'Pro Wireless Headphone',
      'category': 'Audio & Gadget',
      'price': 210.90,
      'originalPrice': 250.00,
      'image': 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&auto=format&fit=crop&q=80',
      'description': 'Immersive active noise cancelling headphone with Hi-Fi spatial audio, 40-hour battery life, and ultra-soft memory foam ear cushions.',
      'specs': ['Active ANC', 'Bluetooth 5.3', '40 Hrs Battery'],
    },
    {
      'name': 'Cyberpunk Mechanical Keyboard',
      'category': 'Computer Gear',
      'price': 129.50,
      'originalPrice': 159.00,
      'image': 'https://images.unsplash.com/photo-1587829741301-dc798b83add3?w=600&auto=format&fit=crop&q=80',
      'description': 'RGB Backlit hot-swappable mechanical gaming keyboard featuring custom linear switches and durable aluminum frame.',
      'specs': ['Hot-Swappable', 'RGB Per-Key', 'Wireless 2.4G'],
    },
    {
      'name': 'Ultra Retina Smartwatch',
      'category': 'Wearables',
      'price': 349.00,
      'originalPrice': 399.00,
      'image': 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=600&auto=format&fit=crop&q=80',
      'description': 'Advanced health tracking, ECG monitor, AMOLED always-on display, and rugged titanium aerospace case.',
      'specs': ['AMOLED Display', 'Heart Rate & ECG', 'Water Resistant'],
    },
    {
      'name': 'Mirrorless DSLR Camera 4K',
      'category': 'Photography',
      'price': 899.99,
      'originalPrice': 999.00,
      'image': 'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?w=600&auto=format&fit=crop&q=80',
      'description': 'Capture cinematic 4K videos and ultra-sharp 24MP photos with lightning-fast autofocus and dual card slots.',
      'specs': ['24.2 MP Sensor', '4K 60fps Video', 'In-Body Stabilization'],
    },
    {
      'name': 'Smart 4K OLED TV 55"',
      'category': 'Home Entertainment',
      'price': 650.00,
      'originalPrice': 750.00,
      'image': 'https://images.unsplash.com/photo-1593784991095-a205069470b6?w=600&auto=format&fit=crop&q=80',
      'description': 'Stunning self-lit pixels, Dolby Vision IQ, Dolby Atmos sound, and seamless smart streaming ecosystem.',
      'specs': ['OLED Panel', 'Dolby Vision', '120Hz Refresh'],
    },
    {
      'name': 'Ergonomic Gaming Mouse',
      'category': 'Computer Gear',
      'price': 79.99,
      'originalPrice': 99.00,
      'image': 'https://images.unsplash.com/photo-1615663245857-ac93bb7c39e7?w=600&auto=format&fit=crop&q=80',
      'description': 'Ultra-lightweight wireless gaming mouse with 25K optical sensor, optical switches, and zero latency.',
      'specs': ['25K DPI Sensor', 'Ultra Lightweight', 'Tri-Mode Connect'],
    },
    {
      'name': 'Studio Wireless Speaker',
      'category': 'Audio & Gadget',
      'price': 180.00,
      'originalPrice': 210.00,
      'image': 'https://images.unsplash.com/photo-1545454675-3531b543be5d?w=600&auto=format&fit=crop&q=80',
      'description': 'Room-filling spatial stereo sound with deep bass and waterproof rugged build for outdoor or indoor parties.',
      'specs': ['IPX7 Waterproof', '30W Output', '20 Hrs Playback'],
    },
    {
      'name': 'UltraWide Curved Monitor',
      'category': 'Computer Gear',
      'price': 499.00,
      'originalPrice': 550.00,
      'image': 'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?w=600&auto=format&fit=crop&q=80',
      'description': '34-inch QHD ultrawide curved gaming and productivity monitor with 144Hz refresh rate and HDR400.',
      'specs': ['34 Inch QHD', '144Hz Refresh', 'USB-C Hub'],
    },
    {
      'name': 'Portable Power Station',
      'category': 'Power & Gadgets',
      'price': 399.00,
      'originalPrice': 450.00,
      'image': 'https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=600&auto=format&fit=crop&q=80',
      'description': 'High capacity 500Wh lithium solar generator with AC outlets, USB-PD fast charging ports, and LED light.',
      'specs': ['500Wh Capacity', 'Pure Sine Wave', 'Solar Ready'],
    },
    {
      'name': 'Spatial Audio Earbuds',
      'category': 'Audio & Gadget',
      'price': 159.00,
      'originalPrice': 199.00,
      'image': 'https://images.unsplash.com/photo-1590658268037-6bf12165a8df?w=600&auto=format&fit=crop&q=80',
      'description': 'True wireless earbuds with dynamic head tracking, adaptive transparency mode, and crystal-clear mic array.',
      'specs': ['Adaptive ANC', 'Spatial Audio', 'MagSafe Case'],
    },
  ];

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case detail:
        final Map<String, dynamic> product = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => DetailPage(product: product),
        );
      case payment:
        final Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => PaymentPage(
            product: args['product'],
            quantity: args['quantity'],
            totalPrice: args['totalPrice'],
          ),
        );
      case receipt:
        final Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => ReceiptPage(
            product: args['product'],
            quantity: args['quantity'],
            totalPrice: args['totalPrice'],
            cashPaid: args['cashPaid'],
            change: args['change'],
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(child: Text('Halaman tidak ditemukan!')),
          ),
        );
    }
  }
}