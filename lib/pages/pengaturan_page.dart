import 'package:flutter/material.dart';

class PengaturanPage extends StatefulWidget {
  const PengaturanPage({super.key});

  @override
  State<PengaturanPage> createState() => _PengaturanPageState();
}

class _PengaturanPageState extends State<PengaturanPage> {
  bool notifikasiAktif = true;
  bool modeGelap = false;
  String preferensiAkun = "Publik";

  void _ubahPreferensi() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Ubah Preferensi Akun"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile<String>(
              title: const Text("Publik"),
              value: "Publik",
              groupValue: preferensiAkun,
              onChanged: (value) {
                setState(() => preferensiAkun = value!);
                Navigator.pop(context);
              },
            ),
            RadioListTile<String>(
              title: const Text("Privat"),
              value: "Privat",
              groupValue: preferensiAkun,
              onChanged: (value) {
                setState(() => preferensiAkun = value!);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Halaman Pengaturan', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFFC70039),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Center(
            child: Column(
              children: [
                Icon(Icons.settings, size: 80, color: Color(0xFFFF528A)),
                SizedBox(height: 10),
                Text(
                  'Pengaturan Aplikasi',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  'Kelola notifikasi, tema, dan preferensi akun Anda di sini.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          const Divider(),

          // 🔔 Notifikasi
          SwitchListTile(
            title: const Text("Aktifkan Notifikasi"),
            subtitle: const Text("Izinkan aplikasi mengirimkan pemberitahuan"),
            value: notifikasiAktif,
            activeColor: const Color(0xFFC70039),
            onChanged: (value) {
              setState(() => notifikasiAktif = value);
            },
            secondary: const Icon(Icons.notifications_active, color: Color(0xFFFF528A)),
          ),

          const Divider(),

          // 🌙 Tema
          SwitchListTile(
            title: const Text("Mode Gelap"),
            subtitle: const Text("Aktifkan tema gelap untuk aplikasi"),
            value: modeGelap,
            activeColor: const Color(0xFFC70039),
            onChanged: (value) {
              setState(() => modeGelap = value);
            },
            secondary: const Icon(Icons.dark_mode, color: Color(0xFFFF528A)),
          ),

          const Divider(),

          // 👤 Preferensi Akun
          ListTile(
            leading: const Icon(Icons.person, color: Color(0xFFFF528A)),
            title: const Text("Preferensi Akun"),
            subtitle: Text("Status akun: $preferensiAkun"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 18),
            onTap: _ubahPreferensi,
          ),
        ],
      ),
    );
  }
}
