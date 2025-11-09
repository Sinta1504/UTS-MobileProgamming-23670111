import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'data_page.dart';
import 'pengaturan_page.dart';
import 'member_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  // Fungsi menu item
  Widget menuItem(
      BuildContext context, IconData icon, String title, Widget page) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: const Color(0xFFC70039)),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFC70039),
        elevation: 0,
        title: const Text(
          'Dashboard',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color(0xFFC70039),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Halo, Sinta 👋',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Selamat datang di aplikasi Sinta Florist',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Banner
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/images/banner.jpg',
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 25),

            // Judul Menu
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Menu Utama',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade700,
                ),
              ),
            ),
            const SizedBox(height: 15),

            // Menu Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // biar tampil 2 kolom
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 1,
                ),
                children: [
                  // ✅ Menu Profil
                  menuItem(context, Icons.person, 'Profil Pengguna',
                      const ProfilPage()),

                  // ✅ Menu Data Bunga
                  menuItem(
                      context, Icons.list_alt, 'Lihat Data', const DataPage()),

                  // ✅ Menu Pengaturan
                  menuItem(context, Icons.settings, 'Pengaturan Aplikasi',
                      const PengaturanPage()),

                  // ✅ Menu Member
                  menuItem(context, Icons.group, 'Member', const MemberPage()),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
