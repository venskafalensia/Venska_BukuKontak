import 'package:flutter/material.dart';
import '../models/kontak.dart';

class TambahKontakPage extends StatefulWidget {
  final Function(Kontak) tambahKontak;

  const TambahKontakPage({
    super.key,
    required this.tambahKontak,
  });

  @override
  State<TambahKontakPage> createState() =>
      _TambahKontakPageState();
}

class _TambahKontakPageState
    extends State<TambahKontakPage> {

  final namaController = TextEditingController();
  final emailController = TextEditingController();
  final nomorController = TextEditingController();

  void simpanKontak() {
    if (namaController.text.isEmpty ||
        emailController.text.isEmpty ||
        nomorController.text.isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Semua data harus diisi!',
          ),
        ),
      );

      return;
    }

    widget.tambahKontak(
      Kontak(
        nama: namaController.text,
        email: emailController.text,
        nomor: nomorController.text,
      ),
    );

    Navigator.pop(context);
  }

  Widget input({
    required String label,
    required String hint,
    required IconData icon,
    required TextEditingController controller,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF444A59),
          ),
        ),

        const SizedBox(height: 8),

        TextField(
          controller: controller,
          keyboardType: keyboardType,

          decoration: InputDecoration(
            hintText: hint,

            prefixIcon: Icon(
              icon,
              color: const Color(0xFF6547DD),
            ),

            filled: true,
            fillColor: const Color(0xFFF0F0F6),

            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    namaController.dispose();
    emailController.dispose();
    nomorController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFF5F5FB),

      appBar: AppBar(
        title: const Text(
          'Tambah Kontak',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

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
        padding: const EdgeInsets.all(22),

        child: Container(
          padding: const EdgeInsets.all(22),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.circular(28),
          ),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.all(13),

                    decoration: BoxDecoration(
                      color:
                          const Color(0xFFEAE8FF),
                      borderRadius:
                          BorderRadius.circular(15),
                    ),

                    child: const Icon(
                      Icons.person_add,
                      color: Color(0xFF6547DD),
                    ),
                  ),

                  const SizedBox(width: 15),

                  const Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [
                      Text(
                        'Tambah Kontak Baru',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight:
                              FontWeight.bold,
                          color:
                              Color(0xFF353A4A),
                        ),
                      ),

                      SizedBox(height: 4),

                      Text(
                        'Masukkan data kontak',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 30),

              input(
                label: 'Nama Lengkap',
                hint: 'Masukkan nama lengkap',
                icon: Icons.person_outline,
                controller: namaController,
              ),

              const SizedBox(height: 20),

              input(
                label: 'Email',
                hint: 'Masukkan email',
                icon: Icons.email_outlined,
                controller: emailController,
                keyboardType:
                    TextInputType.emailAddress,
              ),

              const SizedBox(height: 20),

              input(
                label: 'Nomor Handphone',
                hint: 'Masukkan nomor handphone',
                icon: Icons.phone_outlined,
                controller: nomorController,
                keyboardType:
                    TextInputType.phone,
              ),

              const SizedBox(height: 28),

              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton.icon(
                  onPressed: simpanKontak,

                  icon: const Icon(
                    Icons.save,
                    color: Colors.white,
                  ),

                  label: const Text(
                    'Simpan Kontak',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  style:
                      ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFF6547DD),

                    shape:
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(17),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}