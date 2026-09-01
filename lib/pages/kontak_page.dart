import 'package:flutter/material.dart';
import '../models/kontak.dart';

class KontakPage extends StatelessWidget {
  final List<Kontak> kontak;

  const KontakPage({
    super.key,
    required this.kontak,
  });

  @override
  Widget build(BuildContext context) {

    // JIKA BELUM ADA KONTAK
    if (kontak.isEmpty) {
      return const Center(
        child: Text(
          'Belum ada kontak',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      );
    }

    // JIKA SUDAH ADA KONTAK
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: kontak.length,

      itemBuilder: (context, index) {
        final data = kontak[index];

        return Container(
          margin: const EdgeInsets.only(bottom: 15),
          padding: const EdgeInsets.all(16),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
          ),

          child: Row(
            children: [
              Container(
                width: 55,
                height: 55,

                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF4568DC),
                      Color(0xFF7048E8),
                    ],
                  ),

                  borderRadius: BorderRadius.circular(18),
                ),

                child: const Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 30,
                ),
              ),

              const SizedBox(width: 15),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [
                    Text(
                      data.nama,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      data.email,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 3),

                    Text(
                      data.nomor,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}