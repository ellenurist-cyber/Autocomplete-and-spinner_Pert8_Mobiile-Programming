import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../theme_color.dart';

class Pertemuan9 extends StatefulWidget {
  const Pertemuan9({super.key});

  @override
  State<Pertemuan9> createState() => _Pertemuan9State();
}

class _Pertemuan9State extends State<Pertemuan9> {
  DateTime? _tanggalTerpilih;
  TimeOfDay? _waktuTerpilih;

  Future<void> _pilihTanggal(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _tanggalTerpilih ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryBrown,
              onPrimary: Colors.white,
              onSurface: AppColors.darkGrey,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primaryBrown,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _tanggalTerpilih) {
      setState(() {
        _tanggalTerpilih = picked;
      });
    }
  }

  Future<void> _pilihWaktu(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _waktuTerpilih ?? TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryBrown,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: AppColors.darkGrey,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primaryBrown,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _waktuTerpilih) {
      setState(() {
        _waktuTerpilih = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softCream,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Informasi Modul
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
                    "Pertemuan 9: Picker Komponen",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Implementasi DatePicker & TimePicker untuk Form Dinamis",
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // Input Tanggal
            const Text(
              "Pengaturan Tanggal Kegiatan",
              style: TextStyle(
                color: AppColors.darkGrey,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () => _pilihTanggal(context),
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.lightBrown, width: 1.5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _tanggalTerpilih == null
                          ? "Ketuk untuk memilih tanggal..."
                          : DateFormat(
                              'dd MMMM yyyy',
                            ).format(_tanggalTerpilih!),
                      style: TextStyle(
                        color: _tanggalTerpilih == null
                            ? Colors.grey
                            : AppColors.darkGrey,
                        fontSize: 15,
                      ),
                    ),
                    const Icon(
                      Icons.calendar_month,
                      color: AppColors.primaryBrown,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),

            // Input Waktu
            const Text(
              "Pengaturan Waktu / Jam",
              style: TextStyle(
                color: AppColors.darkGrey,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () => _pilihWaktu(context),
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.lightBrown, width: 1.5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _waktuTerpilih == null
                          ? "Ketuk untuk mengatur jam..."
                          : _waktuTerpilih!.format(context),
                      style: TextStyle(
                        color: _waktuTerpilih == null
                            ? Colors.grey
                            : AppColors.darkGrey,
                        fontSize: 15,
                      ),
                    ),
                    const Icon(
                      Icons.access_time_filled,
                      color: AppColors.primaryBrown,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 35),

            // Card Resume Hasil Pilihan
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
                        Icons.event_available,
                        color: AppColors.primaryBrown,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Resume Jadwal Kegiatan",
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
                    "Tanggal Terpilih: ${_tanggalTerpilih == null ? 'Belum dikonfigurasi' : DateFormat('EEEE, dd MMMM yyyy').format(_tanggalTerpilih!)}",
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.darkGrey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Waktu Pelaksanaan: ${_waktuTerpilih == null ? 'Belum ditentukan' : _waktuTerpilih!.format(context)} WIB",
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
                Navigator.pop(context); // Kembali ke halaman dashboard utama
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
