import 'package:flutter/material.dart';
import 'models/dosen.dart'; // Impor model Dosen

class HalamanDetailDosen extends StatelessWidget {
  final Dosen dosen;

  const HalamanDetailDosen({Key? key, required this.dosen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Profil"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // HARUS DI DALAM COLUMN
          children: [
            // Header Foto
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.indigo[50],
              child: Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage(dosen.fotoAsset),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      dosen.nama,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (dosen.jabatan != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          dosen.jabatan!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.indigo[700],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),

            // Bagian Info Kontak
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Info Kontak',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Divider(),
                  InfoRow(
                    icon: Icons.email_rounded,
                    label: 'Email',
                    value: dosen.email,
                  ),
                  InfoRow(
                    icon: Icons.phone_android_rounded,
                    label: 'No. HP / WA',
                    value: dosen.noHp,
                  ),
                  const SizedBox(height: 20),

                  // Bagian Mata Kuliah
                  const Text(
                    'Mata Kuliah yang Diampu',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Divider(),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: dosen.mataKuliah.map((matkul) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          children: [
                            Icon(Icons.check_circle_outline, size: 18, color: Colors.grey[700]),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                matkul,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget bantuan
class InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoRow({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.indigo, size: 20),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
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