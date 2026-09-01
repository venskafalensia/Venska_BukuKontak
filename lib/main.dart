import 'package:flutter/material.dart';

import 'models/kontak.dart';
import 'pages/kontak_page.dart';
import 'pages/tambah_kontak_page.dart';
import 'pages/favorit_page.dart';
import 'pages/tentang_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Buku Kontak',

      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF5F5FB),
      ),

      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  // KOSONG DI AWAL
  final List<Kontak> kontak = [];

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  void tambahKontak(Kontak kontakBaru) {
    setState(() {
      kontak.add(kontakBaru);
    });
  }

  void bukaTambahKontak() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TambahKontakPage(
          tambahKontak: tambahKontak,
        ),
      ),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // =========================
      // DRAWER MENU
      // =========================
      drawer: Drawer(
        child: Column(
          children: [

            // HEADER DRAWER
            Container(
              width: double.infinity,
              height: 180,
              padding: const EdgeInsets.all(25),

              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF4568DC),
                    Color(0xFF7048E8),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),

              child: const Align(
                alignment: Alignment.bottomLeft,

                child: Text(
                  'BUKU KONTAK',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // KONTAK
            ListTile(
              leading: const Icon(
                Icons.contacts,
                color: Color(0xFF6547DD),
              ),
              title: const Text('Kontak'),

              onTap: () {
                Navigator.pop(context);
                tabController.animateTo(0);
              },
            ),

            // TAMBAH KONTAK
            ListTile(
              leading: const Icon(
                Icons.add,
                color: Color(0xFF6547DD),
              ),
              title: const Text('Tambah Kontak'),

              onTap: () {
                Navigator.pop(context);
                bukaTambahKontak();
              },
            ),

            // FAVORIT
            ListTile(
              leading: const Icon(
                Icons.star,
                color: Color(0xFF6547DD),
              ),
              title: const Text('Favorit'),

              onTap: () {
                Navigator.pop(context);
                tabController.animateTo(1);
              },
            ),

            // TENTANG
            ListTile(
              leading: const Icon(
                Icons.info,
                color: Color(0xFF6547DD),
              ),
              title: const Text('Tentang'),

              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const TentangPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),

      // =========================
      // APPBAR UTAMA
      // =========================
      appBar: AppBar(
        title: const Text(
          'BUKU KONTAK',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

        centerTitle: false,

        // WARNA ICON GARIS TIGA
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
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),

        // TAB KONTAK DAN FAVORIT
        bottom: TabBar(
          controller: tabController,

          indicatorColor: Colors.white,

          labelColor: Colors.white,

          unselectedLabelColor: Colors.white70,

          tabs: const [
            Tab(
              icon: Icon(Icons.contacts),
              text: 'Kontak',
            ),

            Tab(
              icon: Icon(Icons.star),
              text: 'Favorit',
            ),
          ],
        ),
      ),

      // =========================
      // ISI HALAMAN
      // =========================
      body: TabBarView(
        controller: tabController,
        children: [
          KontakPage(
            kontak: kontak,
          ),

          const FavoritPage(),
        ],
      ),

      // =========================
      // TOMBOL +
      // =========================
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF6547DD),

        onPressed: bukaTambahKontak,

        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}