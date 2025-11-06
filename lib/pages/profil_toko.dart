import 'package:flutter/material.dart';

class ProfilTokoPage extends StatelessWidget {
  const ProfilTokoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text('Profil Toko'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/profil_toko.jpg'),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Sinta Florist',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Alamat: Jl. Mawar No. 12, Rembang, Jawa Tengah'),
            SizedBox(height: 5),
            Text('Telepon: 0821-5678-1234'),
            SizedBox(height: 5),
            Text('Email: sintaflorist@gmail.com'),
            SizedBox(height: 10),
            Text('Deskripsi:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              'Toko Bunga Sinta menyediakan berbagai jenis bunga segar dan rangkaian buket '
              'untuk berbagai acara seperti ulang tahun, pernikahan, dan ucapan spesial.',
            ),
          ],
        ),
      ),
    );
  }
}
