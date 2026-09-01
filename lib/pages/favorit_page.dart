import 'package:flutter/material.dart';

class FavoritPage extends StatelessWidget {
  const FavoritPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data kontak favorit
    final List<Map<String, String>> favorites = [
      {
        'name': 'Khansa Khairunnisa',
        'email': 'khansa@gmail.com',
        'phone': '085802772388',
      },
    ];

    if (favorites.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        final contact = favorites[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 10),
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: const CircleAvatar(
              backgroundColor: Color(0xFF6547DD),
              child: Icon(Icons.favorite, color: Colors.white),
            ),
            title: Text(
              contact['name'] ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Email: ${contact['email']}\nHP: ${contact['phone']}',
            ),
          ),
        );
      },
    );
  }
}