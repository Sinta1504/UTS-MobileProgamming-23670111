import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Saya', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFFC70039),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Center horizontal
          children: [
            // Area Header dengan Avatar
            Container(
              width: double.infinity,
              height: 220,
              decoration: const BoxDecoration(
                color: Color(0xFFFF528A),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  // Gunakan ClipOval agar gambar tidak blur dan proporsional
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/profile.jpg',
                      width: 150, // Ukuran ideal 150x150
                      height: 150,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high, // Supaya tajam
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),

            // Nama
            const Text(
              'Sinta Nur Fiamanila Najwa',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFC70039)),
            ),
            const SizedBox(height: 20),

            // InfoCard di tengah
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  InfoCard(
                      icon: Icons.badge,
                      label: 'NIM / ID',
                      value: '123456789'),
                  InfoCard(
                      icon: Icons.email,
                      label: 'Email',
                      value: 'sintaflorist@email.com'),
                  InfoCard(
                      icon: Icons.phone,
                      label: 'Telepon',
                      value: '+62 812 2345 6029'),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Chips info lain
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Chip(
                    label: Text('Prodi: Teknik Informatika',
                        style: TextStyle(color: Colors.white)),
                    backgroundColor: Colors.pinkAccent,
                  ),
                  SizedBox(width: 15),
                  Chip(
                    label: Text('Semester: 5',
                        style: TextStyle(color: Colors.white)),
                    backgroundColor: Colors.purpleAccent,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Tombol Kembali
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios, size: 20),
                label: const Text('Kembali ke Dashboard'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFC70039),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// Widget InfoCard
class InfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Icon(icon, color: Colors.grey.shade600, size: 28),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(fontSize: 13, color: Colors.grey),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
