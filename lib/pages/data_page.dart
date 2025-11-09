import 'package:flutter/material.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  // Daftar bunga dan harga
  final List<Map<String, dynamic>> bungaList = [
    {'nama': 'Mawar Merah', 'harga': 50000},
    {'nama': 'Anggrek', 'harga': 75000},
    {'nama': 'Tulip', 'harga': 60000},
    {'nama': 'Lili', 'harga': 55000},
    {'nama': 'Matahari', 'harga': 45000},
  ];

  int totalHarga = 0;
  String? metodeBayar;
  String? bankDipilih;

  void _prosesBayar() {
    if (metodeBayar == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Silakan pilih metode pembayaran terlebih dahulu!")),
      );
      return;
    }
    if (metodeBayar == "Transfer" && bankDipilih == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Silakan pilih bank terlebih dahulu!")),
      );
      return;
    }

    // Jika semua sudah dipilih, tampilkan halaman sukses
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SuccessPage(
          total: totalHarga,
          metode: metodeBayar!,
          bank: bankDipilih,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Bunga', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFFC70039),
      ),
      body: Column(
        children: [
          // Daftar bunga
          Expanded(
            child: ListView.builder(
              itemCount: bungaList.length,
              itemBuilder: (context, index) {
                final bunga = bungaList[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    title: Text(
                      bunga['nama'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Harga: Rp ${bunga['harga']}'),
                    trailing: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFC70039),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Beli'),
                      onPressed: () {
                        setState(() {
                          totalHarga += (bunga['harga'] as num).toInt();
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '${bunga['nama']} berhasil ditambahkan. Total: Rp $totalHarga',
                            ),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),

          // Total belanja + metode bayar
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.grey.shade200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total Belanja:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Rp $totalHarga',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Pilihan metode bayar
                const Text(
                  "Pilih Metode Pembayaran:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<String>(
                        title: const Text("Cash"),
                        value: "Cash",
                        groupValue: metodeBayar,
                        onChanged: (value) {
                          setState(() {
                            metodeBayar = value;
                            bankDipilih = null;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<String>(
                        title: const Text("Transfer"),
                        value: "Transfer",
                        groupValue: metodeBayar,
                        onChanged: (value) {
                          setState(() {
                            metodeBayar = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),

                // Jika transfer → pilih bank
                if (metodeBayar == "Transfer") ...[
                  const SizedBox(height: 10),
                  const Text(
                    "Pilih Bank:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Pilih Bank",
                    ),
                    value: bankDipilih,
                    items: const [
                      DropdownMenuItem(value: "BCA", child: Text("Bank BCA")),
                      DropdownMenuItem(value: "BRI", child: Text("Bank BRI")),
                      DropdownMenuItem(value: "BNI", child: Text("Bank BNI")),
                      DropdownMenuItem(value: "Mandiri", child: Text("Bank Mandiri")),
                    ],
                    onChanged: (value) {
                      setState(() {
                        bankDipilih = value;
                      });
                    },
                  ),
                ],

                const SizedBox(height: 20),

                // Tombol bayar
                Center(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.payment),
                    label: const Text(
                      "Bayar Sekarang",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC70039),
                      padding:
                          const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: totalHarga == 0 ? null : _prosesBayar,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Halaman sukses transaksi
class SuccessPage extends StatelessWidget {
  final int total;
  final String metode;
  final String? bank;

  const SuccessPage({
    super.key,
    required this.total,
    required this.metode,
    this.bank,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:
            const Text("Transaksi Sukses", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFFC70039),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle, color: Color(0xFFFF528A), size: 100),
              const SizedBox(height: 20),
              const Text(
                "Pembayaran Berhasil!",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                "Metode: $metode${bank != null ? ' ($bank)' : ''}",
                style: const TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(height: 10),
              Text(
                "Total: Rp $total",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFC70039),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Kembali",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
