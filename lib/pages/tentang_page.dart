import 'package:flutter/material.dart';

class TentangPage extends StatelessWidget {
  const TentangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFF5F5FB),

      appBar: AppBar(
        title: const Text(
          'Tentang Saya',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

        centerTitle: true,

        iconTheme: const IconThemeData(
          color: Colors.white,
        ),

        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF4568DC),
                Color(0xFF7048E8),
              ],
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),

        child: Column(
          children: [

            const SizedBox(height: 15),

            // FOTO PRIBADI
            Container(
              padding: const EdgeInsets.all(5),

              decoration: const BoxDecoration(
                shape: BoxShape.circle,

                gradient: LinearGradient(
                  colors: [
                    Color(0xFF4568DC),
                    Color(0xFF7048E8),
                  ],
                ),
              ),

              child: const CircleAvatar(
                radius: 75,

                backgroundImage: AssetImage(
                  'assets/images/foto_pribadi.jpeg',
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Venska Fellicia Pertiwi',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color(0xFF353A4A),
              ),
            ),

            const SizedBox(height: 7),

            const Text(
              'Siswi Rekayasa Perangkat Lunak',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 30),

            // CARD DATA
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(25),
              ),

              child: const Column(
                children: [

                  Row(
                    children: [
                      Icon(
                        Icons.school_outlined,
                        color: Color(0xFF6547DD),
                      ),

                      SizedBox(width: 15),

                      Text(
                        'SMKN 5 Surakarta',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),

                  Divider(height: 30),

                  Row(
                    children: [
                      Icon(
                        Icons.class_outlined,
                        color: Color(0xFF6547DD),
                      ),

                      SizedBox(width: 15),

                      Text(
                        'Kelas XII RPL B',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),

                  Divider(height: 30),

                  Row(
                    children: [
                      Icon(
                        Icons.code,
                        color: Color(0xFF6547DD),
                      ),

                      SizedBox(width: 15),

                      Text(
                        'Rekayasa Perangkat Lunak',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(25),
              ),

              child: const Text(
                'Aplikasi Buku Kontak ini dibuat sebagai '
                'tugas mata pelajaran Pemrograman Perangkat '
                'Bergerak. Aplikasi ini digunakan untuk '
                'menyimpan dan mengelola data kontak '
                'dengan lebih mudah.',
                textAlign: TextAlign.center,

                style: TextStyle(
                  color: Color(0xFF555A68),
                  height: 1.6,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}