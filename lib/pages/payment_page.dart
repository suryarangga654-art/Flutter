import 'dart:ui';
import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class PaymentPage extends StatefulWidget {
  final Map<String, dynamic> product;
  final int quantity;
  final double totalPrice;

  const PaymentPage({
    super.key,
    required this.product,
    required this.quantity,
    required this.totalPrice,
  });

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final TextEditingController _cashController = TextEditingController();
  String errorMessage = '';
  String selectedMethod = 'cash'; // 'cash' or 'qris'

  @override
  void dispose() {
    _cashController.dispose();
    super.dispose();
  }

  void _processPayment() {
    if (selectedMethod == 'cash') {
      final double? cashInput = double.tryParse(_cashController.text);
      if (cashInput == null) {
        setState(() => errorMessage = 'Please enter a valid cash amount.');
        return;
      }
      if (cashInput < widget.totalPrice) {
        setState(() => errorMessage = 'Insufficient cash. Total is \$${widget.totalPrice.toStringAsFixed(2)}');
        return;
      }

      final double change = cashInput - widget.totalPrice;

      Navigator.pushNamed(
        context,
        AppRoutes.receipt,
        arguments: {
          'product': widget.product,
          'quantity': widget.quantity,
          'totalPrice': widget.totalPrice,
          'paymentMethod': 'Cash (Tendered: \$${cashInput.toStringAsFixed(2)})',
          'cashPaid': cashInput,
          'change': change,
        },
      );
    } else {
      // QRIS Instant Success
      Navigator.pushNamed(
        context,
        AppRoutes.receipt,
        arguments: {
          'product': widget.product,
          'quantity': widget.quantity,
          'totalPrice': widget.totalPrice,
          'paymentMethod': 'QRIS Digital Scan',
          'cashPaid': widget.totalPrice,
          'change': 0.0,
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: Stack(
        children: [
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // App Bar with Liquid Glass
                  Row(
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
                        'Select Payment Method',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      const SizedBox(width: 48),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Total Amount Due Card
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                      child: Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: Colors.indigo.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.indigo.withOpacity(0.4)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total Amount Due:',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white70),
                            ),
                            Text(
                              '\$${widget.totalPrice.toStringAsFixed(2)}',
                              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF38BDF8)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Payment Method Switcher Tabs
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => selectedMethod = 'cash'),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: selectedMethod == 'cash' ? const Color(0xFF6366F1) : Colors.white.withOpacity(0.08),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: selectedMethod == 'cash' ? Colors.transparent : Colors.white.withOpacity(0.15),
                              ),
                            ),
                            child: const Text(
                              '💵 Cash Input',
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => selectedMethod = 'qris'),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: selectedMethod == 'qris' ? const Color(0xFF6366F1) : Colors.white.withOpacity(0.08),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: selectedMethod == 'qris' ? Colors.transparent : Colors.white.withOpacity(0.15),
                              ),
                            ),
                            child: const Text(
                              '📱 QRIS Scan',
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Conditional Section based on Payment Method
                  if (selectedMethod == 'cash') ...[
                    const Text(
                      'Enter Cash Amount:',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                        child: TextField(
                          controller: _cashController,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                          decoration: InputDecoration(
                            prefixText: '\$ ',
                            prefixStyle: const TextStyle(color: Color(0xFF38BDF8)),
                            hintText: '0.00',
                            hintStyle: const TextStyle(color: Colors.white38),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.08),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (errorMessage.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Text(errorMessage, style: const TextStyle(color: Colors.pinkAccent, fontSize: 13)),
                    ],
                  ] else ...[
                    Expanded(
                      child: SingleChildScrollView(
                        child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                              child: Container(
                                padding: const EdgeInsets.all(24),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(24),
                                  border: Border.all(color: Colors.white.withOpacity(0.2)),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.qr_code_2, size: 100, color: Colors.white),
                                    const SizedBox(height: 8),
                                    const Text(
                                      'Scan QRIS with E-Wallet / Mobile Banking',
                                      style: TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 4),
                                    const Text(
                                      'GoPay, OVO, Dana, BCA Mobile',
                                      style: TextStyle(color: Color(0xFF38BDF8), fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],

                  const Spacer(),

                  // Confirm Payment Button
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: _processPayment,
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
                          child: Text(
                            selectedMethod == 'cash' ? 'Pay with Cash' : 'Confirm QRIS Payment',
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
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