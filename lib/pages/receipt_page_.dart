import 'dart:ui';
import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class ReceiptPage extends StatelessWidget {
  final Map<String, dynamic> product;
  final int quantity;
  final double totalPrice;
  final double cashPaid;
  final double change;

  const ReceiptPage({
    super.key,
    required this.product,
    required this.quantity,
    required this.totalPrice,
    required this.cashPaid,
    required this.change,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: Stack(
        children: [
          // Ambient background glow orbs
          Positioned(
            top: -60,
            left: -40,
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
            bottom: 80,
            right: -50,
            child: Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFEC4899).withOpacity(0.25),
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  // Success Check Icon with Gradient Circle
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF6366F1), Color(0xFFEC4899)],
                      ),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF6366F1).withOpacity(0.4),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.check, size: 36, color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Payment Successful!',
                    style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'CyberElectro Store Official Receipt',
                    style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 14),
                  ),
                  const SizedBox(height: 20),

                  // Receipt Card with Liquid Glassmorphism
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(color: Colors.white.withOpacity(0.15)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 15,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Center(
                                child: Text(
                                  '--- CASH PAYMENT RECEIPT ---',
                                  style: TextStyle(color: Colors.white60, fontWeight: FontWeight.bold, letterSpacing: 1.2, fontSize: 12),
                                ),
                              ),
                              const Divider(height: 30, color: Colors.white24),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Item Name:', style: TextStyle(color: Colors.white60)),
                                  Text(product['name'], style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Category:', style: TextStyle(color: Colors.white60)),
                                  Text(product['category'], style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Quantity:', style: TextStyle(color: Colors.white60)),
                                  Text('$quantity unit(s)', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Unit Price:', style: TextStyle(color: Colors.white60)),
                                  Text('\$${product['price'].toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                ],
                              ),
                              const Divider(height: 30, color: Colors.white24),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Total Due:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white)),
                                  Text('\$${totalPrice.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF38BDF8))),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Cash Tendered:', style: TextStyle(color: Colors.white60)),
                                  Text('\$${cashPaid.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Change Return:', style: TextStyle(color: Colors.white60)),
                                  Text('\$${change.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF34D399))),
                                ],
                              ),
                              const Spacer(),
                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      AppRoutes.home,
                                      (route) => false,
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
                                      constraints: const BoxConstraints(minHeight: 50),
                                      child: const Text(
                                        'Back to Home',
                                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}