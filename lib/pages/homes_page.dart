import 'dart:ui';
import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class HomesPage extends StatefulWidget {
  const HomesPage({super.key});

  @override
  State<HomesPage> createState() => _HomesPageState();
}

class _HomesPageState extends State<HomesPage> {
  int _currentIndex = 0;
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final products = AppRoutes.electronicProducts;
    final filteredProducts = products.where((p) {
      return p['name'].toLowerCase().contains(_searchQuery.toLowerCase()) ||
          p['category'].toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    final heroProduct = products[0];

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A), // Deep futuristic dark space base
      body: Stack(
        children: [
          // Background ambient glowing liquid orbs for glassmorphism
          Positioned(
            top: -80,
            left: -50,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF6366F1).withOpacity(0.35),
              ),
            ),
          ),
          Positioned(
            top: 200,
            right: -60,
            child: Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFEC4899).withOpacity(0.25),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 50,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF10B981).withOpacity(0.2),
              ),
            ),
          ),

          // Main Foreground Content
          SafeArea(
            child: Column(
              children: [
                // Top Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'CyberElectro',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 0.5,
                            ),
                          ),
                          Text(
                            'Liquid Glass Store',
                            style: TextStyle(fontSize: 12, color: Colors.white60),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          // Quick Inspect Button
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                              child: Container(
                                margin: const EdgeInsets.only(right: 8),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: Colors.white.withOpacity(0.2)),
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.flash_on, color: Colors.amberAccent, size: 20),
                                  tooltip: 'Quick Inspect',
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      AppRoutes.detail,
                                      arguments: heroProduct,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          // Bag Button
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: Colors.white.withOpacity(0.2)),
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.shopping_bag_outlined, color: Colors.white),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      AppRoutes.detail,
                                      arguments: heroProduct,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    children: [
                      // Hero Banner with Glassmorphism Overlay
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.detail,
                            arguments: heroProduct,
                          );
                        },
                        child: Container(
                          height: 220,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            image: DecorationImage(
                              image: NetworkImage(heroProduct['image']),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(28),
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withOpacity(0.9),
                                  Colors.black.withOpacity(0.2),
                                ],
                              ),
                            ),
                            padding: const EdgeInsets.all(20),
                            alignment: Alignment.bottomLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                      decoration: BoxDecoration(
                                        color: Colors.indigo.withOpacity(0.6),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Text(
                                        'FEATURED DEAL',
                                        style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      heroProduct['name'],
                                      style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 2),
                                    const Text(
                                      'Available Color: Cyan, Obsidian, Emerald',
                                      style: TextStyle(color: Colors.white70, fontSize: 11),
                                    ),
                                  ],
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(14),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(14),
                                        border: Border.all(color: Colors.white.withOpacity(0.3)),
                                      ),
                                      child: Text(
                                        '\$${heroProduct['price'].toStringAsFixed(2)}',
                                        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Liquid Glass Search Bar
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.white.withOpacity(0.2)),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.search, color: Colors.white60),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: TextField(
                                    onChanged: (val) => setState(() => _searchQuery = val),
                                    style: const TextStyle(color: Colors.white),
                                    decoration: const InputDecoration(
                                      hintText: 'Search liquid electronics...',
                                      hintStyle: TextStyle(color: Colors.white54),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [Color(0xFF6366F1), Color(0xFFEC4899)],
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Icon(Icons.tune, color: Colors.white, size: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      const Text(
                        'Liquid Electronics Catalog',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      const SizedBox(height: 14),

                      // Grid View of Electronic Items
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.74,
                        ),
                        itemCount: filteredProducts.length,
                        itemBuilder: (context, index) {
                          final product = filteredProducts[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.detail,
                                arguments: product,
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.08),
                                    borderRadius: BorderRadius.circular(24),
                                    border: Border.all(color: Colors.white.withOpacity(0.15)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        blurRadius: 10,
                                        offset: const Offset(0, 6),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                                              child: Image.network(
                                                product['image'],
                                                width: double.infinity,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Positioned(
                                              top: 8,
                                              right: 8,
                                              child: Container(
                                                padding: const EdgeInsets.all(6),
                                                decoration: BoxDecoration(
                                                  color: Colors.white.withOpacity(0.2),
                                                  shape: BoxShape.circle,
                                                ),
                                                child: const Icon(Icons.north_east, size: 14, color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              product['name'],
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.white),
                                            ),
                                            const SizedBox(height: 3),
                                            Text(
                                              product['category'],
                                              style: const TextStyle(color: Colors.white60, fontSize: 11),
                                            ),
                                            const SizedBox(height: 6),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  '\$${product['price'].toStringAsFixed(2)}',
                                                  style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF38BDF8), fontSize: 13),
                                                ),
                                                Container(
                                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                                  decoration: BoxDecoration(
                                                    gradient: const LinearGradient(
                                                      colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                                                    ),
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  child: const Text(
                                                    'View',
                                                    style: TextStyle(color: Colors.white, fontSize: 10),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Liquid Glass Bottom Navigation Bar
          Positioned(
            bottom: 16,
            left: 20,
            right: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(color: Colors.white.withOpacity(0.25)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: Icon(Icons.home_filled, color: _currentIndex == 0 ? const Color(0xFF38BDF8) : Colors.white60),
                        onPressed: () => setState(() => _currentIndex = 0),
                      ),
                      IconButton(
                        icon: Icon(Icons.grid_view_rounded, color: _currentIndex == 1 ? const Color(0xFF38BDF8) : Colors.white60),
                        onPressed: () => setState(() => _currentIndex = 1),
                      ),
                      IconButton(
                        icon: Icon(Icons.shopping_bag_outlined, color: _currentIndex == 2 ? const Color(0xFF38BDF8) : Colors.white60),
                        onPressed: () => setState(() => _currentIndex = 2),
                      ),
                      IconButton(
                        icon: Icon(Icons.person_outline, color: _currentIndex == 3 ? const Color(0xFF38BDF8) : Colors.white60),
                        onPressed: () => setState(() => _currentIndex = 3),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}