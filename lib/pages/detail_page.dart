import 'dart:ui';
import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class DetailPage extends StatefulWidget {
  final Map<String, dynamic> product;

  const DetailPage({super.key, required this.product});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 1;
  int selectedColorIndex = 0;

  // List of dynamic image URLs corresponding to color variants (index 0: dark/black, index 1: silver/blue, index 2: rose/gold)
  late final List<String> colorVariantImages = [
    widget.product['image'], // default / primary color image
    'https://images.unsplash.com/photo-1546435770-a3e426bf472b?w=600&auto=format&fit=crop&q=80', // alternative color preview
    'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80', // third color preview
  ];

  @override
  Widget build(BuildContext context) {
    final double unitPrice = widget.product['price'];
    final double originalPrice = widget.product['originalPrice'];
    final double totalPrice = unitPrice * quantity;
    final currentImage = colorVariantImages[selectedColorIndex];

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: Stack(
        children: [
          // Ambient background glow orbs
          Positioned(
            top: -50,
            right: -30,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF6366F1).withOpacity(0.3),
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            left: -50,
            child: Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFEC4899).withOpacity(0.2),
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                // App Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Colors.white.withOpacity(0.2)),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.arrow_back, color: Colors.white),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        'Item Details',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Colors.white.withOpacity(0.2)),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.favorite_border, color: Colors.white),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    children: [
                      // Product Image with Glass Container that updates dynamically on color selection
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: ClipRRect(
                          key: ValueKey<int>(selectedColorIndex),
                          borderRadius: BorderRadius.circular(28),
                          child: Container(
                            height: 280,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(28),
                              image: DecorationImage(
                                image: NetworkImage(currentImage),
                                fit: BoxFit.cover,
                              ),
                              border: Border.all(color: Colors.white.withOpacity(0.15)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(width: 6, height: 6, decoration: BoxDecoration(color: Colors.white54, shape: BoxShape.circle)),
                          const SizedBox(width: 4),
                          Container(width: 16, height: 6, decoration: BoxDecoration(color: const Color(0xFF38BDF8), borderRadius: BorderRadius.circular(3))),
                          const SizedBox(width: 4),
                          Container(width: 6, height: 6, decoration: BoxDecoration(color: Colors.white54, shape: BoxShape.circle)),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Name & Pricing
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.product['name'],
                                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  widget.product['category'],
                                  style: const TextStyle(color: Colors.white60, fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '\$${originalPrice.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.white54,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                '\$${unitPrice.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF38BDF8),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Color Selector
                      const Text(
                        'Available Color :',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          for (int i = 0; i < 3; i++)
                            GestureDetector(
                              onTap: () => setState(() => selectedColorIndex = i),
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: selectedColorIndex == i ? const Color(0xFF38BDF8) : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                                child: CircleAvatar(
                                  radius: 14,
                                  backgroundColor: i == 0 ? Colors.cyan.shade700 : (i == 1 ? Colors.indigo.shade400 : Colors.purple.shade400),
                                ),
                              ),
                            ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Quantity Counter (Liquid Glass Card)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.08),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.white.withOpacity(0.15)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Quantity (Multi-Items)',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.remove, color: Colors.white, size: 18),
                                        onPressed: () {
                                          if (quantity > 1) setState(() => quantity--);
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Text(
                                          '$quantity',
                                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.add, color: Colors.white, size: 18),
                                        onPressed: () => setState(() => quantity++),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        'Description',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        widget.product['description'],
                        style: const TextStyle(color: Colors.white70, height: 1.4),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),

                // Bottom Buy Bar (Liquid Glass)
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.12),
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
                        border: Border.all(color: Colors.white.withOpacity(0.2)),
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('Total Price', style: TextStyle(color: Colors.white60, fontSize: 12)),
                              Text(
                                '\$${totalPrice.toStringAsFixed(2)}',
                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF38BDF8)),
                              ),
                            ],
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: SizedBox(
                              height: 54,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.payment,
                                    arguments: {
                                      'product': widget.product,
                                      'quantity': quantity,
                                      'totalPrice': totalPrice,
                                    },
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                ),
                                child: Ink(
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [Color(0xFF6366F1), Color(0xFFEC4899)],
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Container(
                                    alignment: Alignment.center,
                                    constraints: const BoxConstraints(minHeight: 54),
                                    child: const Text(
                                      'Proceed to Payment',
                                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}