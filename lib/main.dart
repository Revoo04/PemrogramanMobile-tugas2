import 'package:flutter/material.dart';
import 'data_dosen.dart';
import 'models/dosen.dart';
import 'halaman_detail_dosen.dart'; // Impor halaman detail

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hilangin banner debug
      title: 'Profil Dosen',
      theme: ThemeData(
        primarySwatch: Colors.indigo, // Ganti warna biar keren
      ),
      home: const HalamanDaftarDosen(),
    );
  }
}

class HalamanDaftarDosen extends StatelessWidget {
  const HalamanDaftarDosen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Dosen SI UIN Jambi'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0), // Kasih padding
        itemCount: daftarDosen.length, // Otomatis jadi 8
        itemBuilder: (context, index) {
          final Dosen dosen = daftarDosen[index];

          return Card(
            elevation: 4.0, // Kasih bayangan
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Bikin pinggirnya tumpul
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(10.0), // Padding di dalam card
              leading: CircleAvatar(
                backgroundImage: AssetImage(dosen.fotoAsset),
                radius: 35, // Gedein fotonya dikit
              ),
              title: Text(
                dosen.nama,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                // Tampilin jabatan (kalo ada) dan email
                "${dosen.jabatan ?? 'Dosen Pengajar'}\n${dosen.email}",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              isThreeLine: true, // WAJIB, biar subtitle-nya muat 2 baris
              trailing: const Icon(Icons.arrow_forward_ios_rounded, color: Colors.indigo),
              onTap: () {
                // Pindah halaman pakai Navigator
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HalamanDetailDosen(dosen: dosen),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}