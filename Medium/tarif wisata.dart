import 'dart:io';

void main() {
  print('========================================================');
  print('       PROGRAM PENENTUAN TARIF TEMPAT WISATA            ');
  print('               (LEVEL MEDIUM - SOAL 1)                  ');
  print('========================================================');
  print('Ketentuan Tarif Tiket:');
  print('- Usia < 5 tahun     : Gratis (Rp 0)');
  print('- Usia 5 - 12 tahun  : Rp 15.000');
  print('- Usia 13 - 59 tahun : Rp 30.000');
  print('- Usia >= 60 tahun   : Rp 20.000');
  print('--------------------------------------------------------');

  stdout.write('Masukkan usia pengunjung (tahun): ');
  String? input = stdin.readLineSync();

  if (input == null || input.trim().isEmpty) {
    print('\nError: Usia tidak boleh kosong!');
    return;
  }

  int? usia = int.tryParse(input.trim());

  if (usia == null || usia < 0) {
    print('\nError: Masukkan angka usia yang valid (>= 0)!');
    return;
  }

  int tarif = 0;
  String kategori = '';

  if (usia < 5) {
    kategori = 'Balita (< 5 tahun)';
    tarif = 0;
  } else if (usia <= 12) {
    kategori = 'Anak-anak (5 - 12 tahun)';
    tarif = 15000;
  } else if (usia <= 59) {
    kategori = 'Dewasa (13 - 59 tahun)';
    tarif = 30000;
  } else {
    kategori = 'Lansia (>= 60 tahun)';
    tarif = 20000;
  }

  print('\n==================== RINCIAN TIKET =====================');
  print('Usia Pengunjung : $usia tahun');
  print('Kategori        : $kategori');
  print('--------------------------------------------------------');
  if (tarif == 0) {
    print('Tarif Tiket     : Gratis (Rp 0)');
  } else {
    print('Tarif Tiket     : Rp ${formatRupiah(tarif)}');
  }
  print('========================================================');
}

/// Fungsi pembantu untuk memformat angka nominal ke pemisah ribuan
String formatRupiah(int nominal) {
  RegExp reg = RegExp(r'\B(?=(\d{3})+(?!\d))');
  return nominal.toString().replaceAllMapped(reg, (Match match) => '.');
}
