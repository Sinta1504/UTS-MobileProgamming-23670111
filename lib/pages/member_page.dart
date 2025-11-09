import 'package:flutter/material.dart';

class MemberPage extends StatefulWidget {
  const MemberPage({super.key});

  @override
  State<MemberPage> createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  final _formKey = GlobalKey<FormState>();

  // Controller untuk setiap input
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController noHpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();

  // Data hasil simpan
  String? nama, email, noHp, alamat;

  void _simpanData() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        nama = namaController.text;
        email = emailController.text;
        noHp = noHpController.text;
        alamat = alamatController.text;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Data member berhasil disimpan!"),
          backgroundColor: Color(0xFFC70039),
          duration: Duration(seconds: 2),
        ),
      );

      // Kosongkan form setelah disimpan
      namaController.clear();
      emailController.clear();
      noHpController.clear();
      alamatController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Daftar Member', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFFC70039),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(Icons.group, color: Color(0xFFFF528A), size: 80),
            const SizedBox(height: 10),
            const Text(
              "Buat Akun Member",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Form input member
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: namaController,
                    decoration: const InputDecoration(
                      labelText: 'Nama Lengkap',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Nama tidak boleh kosong' : null,
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Email tidak boleh kosong' : null,
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: noHpController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'No. Handphone',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.phone),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'No. HP tidak boleh kosong' : null,
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: alamatController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: 'Alamat',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.home),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Alamat tidak boleh kosong' : null,
                  ),
                  const SizedBox(height: 25),

                  ElevatedButton.icon(
                    icon: const Icon(Icons.save),
                    label: const Text(
                      "Simpan",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC70039),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: _simpanData,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Menampilkan data member yang sudah disimpan
            if (nama != null)
              Card(
                color: Colors.pink.shade50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("📋 Data Member:",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Text("Nama: $nama"),
                      Text("Email: $email"),
                      Text("No. HP: $noHp"),
                      Text("Alamat: $alamat"),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
