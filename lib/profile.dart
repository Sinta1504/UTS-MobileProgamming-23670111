import 'package:flutter/material.dart';

class Profil_ku extends StatelessWidget {
  const Profil_ku({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff0f5),
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text(
          'Profil Toko Bunga Sinta 💐',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.pinkAccent,
              child: Icon(Icons.storefront, color: Colors.white, size: 60),
            ),
            const SizedBox(height: 20),
            const Text(
              "Toko Bunga Sinta",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Kami menyediakan bunga segar dan rangkaian indah untuk berbagai acara seperti ulang tahun, pernikahan, dan ucapan spesial 🌷🌻🌹",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 30),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: const [
                    ListTile(
                      leading: Icon(
                        Icons.location_on,
                        color: Colors.pinkAccent,
                      ),
                      title: Text("Jl. Melati No. 10, Semarang"),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.phone, color: Colors.pinkAccent),
                      title: Text("0812-5678-9090"),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(
                        Icons.access_time,
                        color: Colors.pinkAccent,
                      ),
                      title: Text("Buka Setiap Hari 08.00 - 20.00 WIB"),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              label: const Text(
                "Kembali ke Beranda",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
