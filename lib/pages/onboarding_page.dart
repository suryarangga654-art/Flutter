import 'dart:ui';
import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final featured = AppRoutes.electronicProducts[0];

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A), // Deep space cyber dark theme
      body: Stack(
        children: [
          // Background immersive image
          Positioned.fill(
            child: Image.network(
              'https://images.unsplash.com/photo-1550009158-9ebf69173e03?w=800&auto=format&fit=crop&q=80',
              fit: BoxFit.cover,
            ),
          ),
          // Dark gradient overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.5),
                    const Color(0xFF0F172A).withOpacity(0.92),
                  ],
                ),
              ),
            ),
          ),
          // Ambient liquid glowing orbs
          Positioned(
            top: 100,
            left: -40,
            child: Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF6366F1).withOpacity(0.35),
              ),
            ),
          ),
          Positioned(
            bottom: 200,
            right: -50,
            child: Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFEC4899).withOpacity(0.3),
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Transform Your Cyber\nSpace, Effortlessly.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Discover cutting-edge electronic items tailored to your style with liquid glass performance.',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.75),
                      fontSize: 15,
                    ),
                  ),
                  const Spacer(),
                  // Floating Preview Card with Liquid Glassmorphism
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                      child: Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: Colors.white.withOpacity(0.25)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.indigo.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Text(
                                    'AUDIO TECH',
                                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [Color(0xFF6366F1), Color(0xFFEC4899)],
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.arrow_forward, size: 14, color: Colors.white),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              featured['name'],
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                const Text('Available Color: ', style: TextStyle(color: Colors.white70, fontSize: 12)),
                                Container(width: 8, height: 8, decoration: const BoxDecoration(color: Colors.cyan, shape: BoxShape.circle)),
                                const SizedBox(width: 4),
                                Container(width: 8, height: 8, decoration: const BoxDecoration(color: Colors.indigo, shape: BoxShape.circle)),
                                const SizedBox(width: 4),
                                Container(width: 8, height: 8, decoration: const BoxDecoration(color: Colors.purple, shape: BoxShape.circle)),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '\$${featured['price'].toStringAsFixed(2)}',
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF38BDF8)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, AppRoutes.home);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
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
                          constraints: const BoxConstraints(minHeight: 56),
                          child: const Text(
                            'Get Started',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
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