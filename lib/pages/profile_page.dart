import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF4F6), // Warna lembut pink muda
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text('Profil Pengguna'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Container(
              width: double.infinity, // biar kontainer memenuhi layar
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('images/avatar.jpg'),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Sinta Nur Fiamanila Najwa',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.pinkAccent,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Pengembang Aplikasi',
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Divider(thickness: 1, color: Colors.pinkAccent),
                  SizedBox(height: 10),

                  // Email
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.email, color: Colors.pinkAccent),
                      SizedBox(width: 8),
                      Text('sinta@example.com', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  SizedBox(height: 10),

                  // Telepon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.phone, color: Colors.pinkAccent),
                      SizedBox(width: 8),
                      Text('0812-3456-7890', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  SizedBox(height: 10),

                  // Lokasi
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on, color: Colors.pinkAccent),
                      SizedBox(width: 8),
                      Text(
                        'Rembang, Jawa Tengah',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
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
