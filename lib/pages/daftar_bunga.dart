import 'package:flutter/material.dart';

class DaftarBungaPage extends StatelessWidget {
  const DaftarBungaPage({super.key});

  final List<Map<String, String>> bungaList = const [
    {'nama': 'Bunga Mawar', 'harga': 'Rp 25.000'},
    {'nama': 'Bunga Tulip', 'harga': 'Rp 30.000'},
    {'nama': 'Bunga Melati', 'harga': 'Rp 15.000'},
    {'nama': 'Bunga Anggrek', 'harga': 'Rp 40.000'},
    {'nama': 'Bunga Lavender', 'harga': 'Rp 28.000'},
    {'nama': 'Bunga Sakura', 'harga': 'Rp 35.000'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text('Daftar Bunga'),
      ),
      body: ListView.builder(
        itemCount: bungaList.length,
        itemBuilder: (context, index) {
          final bunga = bungaList[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: const Icon(
                Icons.local_florist,
                color: Colors.pinkAccent,
              ),
              title: Text(bunga['nama']!),
              subtitle: Text('Harga: ${bunga['harga']}'),
            ),
          );
        },
      ),
    );
  }
}
