class Dosen {
  final String nama;
  final String? jabatan; // Boleh kosong (nullable)
  final String email;
  final String noHp;
  final List<String> mataKuliah;
  final String fotoAsset; // Path ke foto di assets

  Dosen({
    required this.nama,
    this.jabatan, // Dibuat opsional
    required this.email,
    required this.noHp,
    required this.mataKuliah,
    required this.fotoAsset,
  });
}