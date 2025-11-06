import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text('Profil Pengguna'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('images/avatar.jpg'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Sinta Nur Fiamanila Najwa',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text('Pengembang Aplikasi'),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.email, color: Colors.pinkAccent),
              title: const Text('sinta@example.com'),
            ),
            ListTile(
              leading: const Icon(Icons.phone, color: Colors.pinkAccent),
              title: const Text('0812-3456-7890'),
            ),
            ListTile(
              leading: const Icon(Icons.location_on, color: Colors.pinkAccent),
              title: const Text('Rembang, Jawa Tengah'),
            ),
          ],
        ),
      ),
    );
  }
}
