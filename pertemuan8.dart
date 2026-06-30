import 'package:flutter/material.dart';
import '../theme_color.dart';

class Pertemuan8 extends StatefulWidget {
  const Pertemuan8({super.key});

  @override
  State<Pertemuan8> createState() => _Pertemuan8State();
}

class _Pertemuan8State extends State<Pertemuan8> {
  final List<String> _kategoriSaran = [
    'Administrasi Keuangan',
    'Data Pokok Pendidikan (Dapodik)',
    'Kurikulum Merdeka',
    'Sarana & Prasarana',
    'Laporan BOS',
  ];
  String? _kategoriTerpilih;

  final List<String> _daftarTugas = [
    'Input SPP Keuangan',
    'Verifikasi Verval PD',
    'Sinkronisasi Dapodik Dasar',
    'Penyusunan Anggaran BOSP',
    'Rekapitulasi Absensi Guru',
    'Pembaruan Data E-Ijazah',
  ];

  String _aktivitasTerpilih = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softCream,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Materi
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primaryBrown,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pertemuan 8: Komponen UI Lanjutan",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Implementasi AutoComplete & Spinner (Dropdown) di Flutter",
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // 1. KOMPONEN SPINNER
            const Text(
              "Pilih Kategori Tugas (Spinner/Dropdown)",
              style: TextStyle(
                color: AppColors.darkGrey,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.lightBrown, width: 1.5),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _kategoriTerpilih,
                  hint: const Text("Ketuk untuk memilih kategori..."),
                  isExpanded: true,
                  icon: const Icon(
                    Icons.arrow_drop_down_circle,
                    color: AppColors.primaryBrown,
                  ),
                  dropdownColor: Colors.white,
                  style: const TextStyle(
                    color: AppColors.darkGrey,
                    fontSize: 15,
                  ),
                  items: _kategoriSaran.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _kategoriTerpilih = newValue;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 25),

            // 2. KOMPONEN AUTOCOMPLETE
            const Text(
              "Cari / Ketik Nama Aktivitas (AutoComplete)",
              style: TextStyle(
                color: AppColors.darkGrey,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text.isEmpty) {
                  return const Iterable<String>.empty();
                }
                return _daftarTugas.where((String option) {
                  return option.toLowerCase().contains(
                    textEditingValue.text.toLowerCase(),
                  );
                });
              },
              fieldViewBuilder:
                  (context, controller, focusNode, onFieldSubmitted) {
                    controller.addListener(() {
                      if (_aktivitasTerpilih != controller.text) {
                        setState(() {
                          _aktivitasTerpilih = controller.text;
                        });
                      }
                    });

                    return TextField(
                      controller: controller,
                      focusNode: focusNode,
                      decoration: InputDecoration(
                        hintText: "Contoh: Ketik 'Dapodik' atau 'Keuangan'...",
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: const Icon(
                          Icons.search,
                          color: AppColors.primaryBrown,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: AppColors.lightBrown,
                            width: 1.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: AppColors.primaryBrown,
                            width: 2,
                          ),
                        ),
                      ),
                    );
                  },
              onSelected: (String selection) {
                setState(() {
                  _aktivitasTerpilih = selection;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Aktivitas dipilih: $selection"),
                    backgroundColor: AppColors.primaryBrown,
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
            ),
            const SizedBox(height: 35),

            // Card Hasil Resume Pilihan
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.assignment_turned_in,
                        color: AppColors.primaryBrown,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Resume Pilihan Form",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.darkGrey,
                        ),
                      ),
                    ],
                  ),
                  const Divider(color: AppColors.lightBrown, thickness: 1),
                  const SizedBox(height: 8),
                  Text(
                    "Kategori Terpilih: ${_kategoriTerpilih ?? 'Belum memilih'}",
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.darkGrey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Pencarian Aktivitas: ${_aktivitasTerpilih.isEmpty ? 'Belum memilih aktivitas' : _aktivitasTerpilih}",
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.darkGrey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // PERBAIKAN: Tombol Kembali ke Dashboard Utama
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.darkGrey, // Warna coklat gelap
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                // Berfungsi untuk menutup halaman/tab saat ini dan kembali ke menu utama
                Navigator.pop(context);
              },
              icon: const Icon(Icons.dashboard_customize, color: Colors.white),
              label: const Text(
                "Kembali ke Dashboard",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
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
