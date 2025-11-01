import 'package:flutter/material.dart';

class DaftarBungaPage extends StatelessWidget {
  const DaftarBungaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> bungaList = [
      {"nama": "Bunga Mawar Merah", "harga": "Rp 25.000 / tangkai"},
      {"nama": "Bunga Tulip Kuning", "harga": "Rp 35.000 / tangkai"},
      {"nama": "Bunga Melati Putih", "harga": "Rp 15.000 / ikat"},
      {"nama": "Bunga Anggrek Ungu", "harga": "Rp 50.000 / pot"},
      {"nama": "Bunga Matahari", "harga": "Rp 30.000 / tangkai"},
      {"nama": "Bunga Lavender", "harga": "Rp 20.000 / ikat"},
    ];

    return Scaffold(
      backgroundColor: const Color(0xfffff0f5),
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text(
          "Daftar Bunga 💐",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: bungaList.length,
        itemBuilder: (context, index) {
          final bunga = bungaList[index];
          return Card(
            color: Colors.white,
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: const Icon(
                Icons.local_florist,
                color: Colors.pinkAccent,
                size: 36,
              ),
              title: Text(
                bunga["nama"],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.pinkAccent,
                ),
              ),
              subtitle: Text(
                bunga["harga"],
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ),
          );
        },
      ),
    );
  }
}
