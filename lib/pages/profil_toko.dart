import 'package:flutter/material.dart';

class ProfilTokoPage extends StatelessWidget {
  const ProfilTokoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF4F6), // Warna lembut pink muda
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text('Profil Toko'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Container(
              width: double.infinity, // ✅ ini yang bikin kontainer lebar penuh
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.pinkAccent.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment:
                    CrossAxisAlignment.center, // ✅ isi di tengah
                children: const [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('images/profil_toko.jpg'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Sinta Florist',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.pinkAccent,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Alamat: Jl. Mawar No. 12, Rembang, Jawa Tengah',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Telepon: 0821-5678-1234',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Email: sintaflorist@gmail.com',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Deskripsi',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Toko Bunga Sinta menyediakan berbagai jenis bunga segar dan '
                    'rangkaian buket untuk berbagai acara seperti ulang tahun, '
                    'pernikahan, dan ucapan spesial. Kami berkomitmen memberikan '
                    'pelayanan terbaik untuk setiap pelanggan.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, height: 1.4),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
