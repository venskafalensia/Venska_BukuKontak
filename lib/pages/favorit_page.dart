import 'package:flutter/material.dart';

class FavoritPage extends StatelessWidget {
  const FavoritPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border,
            size: 70,
            color: Color(0xFF6547DD),
          ),

          SizedBox(height: 15),

          Text(
            'Belum ada kontak favorit.',
            style: TextStyle(
              fontSize: 17,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}