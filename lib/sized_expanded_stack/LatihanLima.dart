import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LatihanLima(),
  ));
}

class LatihanLima extends StatelessWidget {
  const LatihanLima({super.key});

  static const Color biru = Color(0xFF1D9BF0);
  static const Color abu = Color(0xFF71767B);

  // Tombol bulat transparan di atas banner
  Widget tombolBulat(String isi) {
    return Container(
      height: 40,
      width: 40,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Color(0x99000000),
        shape: BoxShape.circle,
      ),
      child: Text(
        isi,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double statusBar = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ===== BANNER + TOMBOL + FOTO PROFIL =====
          Stack(
            children: [
              // Banner (warna langit)
              Container(
                height: 110 + statusBar,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image/gambar.png'),
                    fit: BoxFit.cover,
                    alignment: Alignment(0, -0.2),
                  ),
                ),
              ),

              // Tombol back (kiri) dan search + more (kanan)
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                    top: statusBar + 8, left: 12, right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    tombolBulat('←'),
                    Row(
                      children: [
                        tombolBulat('⌀'),
                        const SizedBox(width: 8),
                        tombolBulat('🔍'),
                        const SizedBox(width: 8),
                        tombolBulat('•••'),
                      ],
                    ),
                  ],
                ),
              ),

              // Foto profil (lingkaran putih, border hitam)
              Container(
                margin: EdgeInsets.only(top: 70 + statusBar, left: 12),
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 4),
                  image: const DecorationImage(
                    image: AssetImage('assets/image/gambar.png'),
                    fit: BoxFit.cover,
                    alignment: Alignment.centerLeft,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // ===== INFO PROFIL =====
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Kapten',
                  style: TextStyle(
                    color: Color(0xFFE7E9EA),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                const Text(
                  '@kangcandra_',
                  style: TextStyle(color: abu, fontSize: 15),
                ),
                const SizedBox(height: 14),

                // Lokasi
                Row(
                  children: const [
                    Text('📍', style: TextStyle(fontSize: 14)),
                    SizedBox(width: 4),
                    Text(
                      'Bandung, Jawa Barat',
                      style: TextStyle(color: abu, fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Link
                Row(
                  children: const [
                    Text('🔗', style: TextStyle(fontSize: 14)),
                    SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        'medium.com/@faizal...',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: biru, fontSize: 15),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Born + Joined
                Row(
                  children: const [
                    Expanded(
                      flex: 5,
                      child: Row(
                        children: [
                          Text('🎈', style: TextStyle(fontSize: 14)),
                          SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              'Born August 3, 1998',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: abu, fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      flex: 6,
                      child: Row(
                        children: [
                          Text('📅', style: TextStyle(fontSize: 14)),
                          SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              'Joined November 2013',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: abu, fontSize: 15),
                            ),
                          ),
                          Text('›',
                              style: TextStyle(color: abu, fontSize: 20)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}