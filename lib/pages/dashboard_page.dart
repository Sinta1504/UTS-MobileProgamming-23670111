import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text('Dashboard'),
        actions: const [Padding(padding: EdgeInsets.only(right: 16), child: Icon(Icons.notifications))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("images/banner.jpg"),
            const SizedBox(height: 16),
            const Text('Selamat Datang, Sinta 🌸',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _menuItem(context, Icons.person, 'Profil', '/profile'),
                _menuItem(context, Icons.local_florist, 'Daftar Bunga', '/daftar_bunga'),
                _menuItem(context, Icons.store, 'Profil Toko', '/profil_toko'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuItem(BuildContext context, IconData icon, String title, String route) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, route),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.pinkAccent),
          const SizedBox(height: 8),
          Text(title),
        ],
      ),
    );
  }
}
