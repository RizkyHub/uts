import 'dart:io';

void main() {
  print('========================================================');
  print('          PROGRAM SELEKSI PENERIMAAN KARYAWAN           ');
  print('               (LEVEL ADVANCE - SOAL 1)                 ');
  print('========================================================');
  print('Ketentuan Seleksi:');
  print('1. Lolos Seleksi    : Usia 21-35 thn, Min S1, Nilai Tes >= 70');
  print('2. Dipertimbangkan  : Usia 21-35 thn, Pendidikan D3, Nilai Tes >= 85');
  print('3. Tidak Lolos      : Di luar kondisi di atas');
  print('--------------------------------------------------------');

  // Input Usia
  stdout.write('Masukkan Usia pelamar (tahun)           : ');
  String? usiaStr = stdin.readLineSync();

  // Input Pendidikan
  stdout.write('Masukkan Pendidikan terakhir (D3/S1/S2/S3/dll): ');
  String? pendidikan = stdin.readLineSync();

  // Input Nilai Tes
  stdout.write('Masukkan Nilai tes (0 - 100)            : ');
  String? nilaiStr = stdin.readLineSync();

  if (usiaStr == null || usiaStr.trim().isEmpty ||
      pendidikan == null || pendidikan.trim().isEmpty ||
      nilaiStr == null || nilaiStr.trim().isEmpty) {
    print('\nError: Semua data harus diisi!');
    return;
  }

  int? usia = int.tryParse(usiaStr.trim());
  double? nilaiTes = double.tryParse(nilaiStr.trim().replaceAll(',', '.'));
  String pend = pendidikan.trim().toUpperCase();

  if (usia == null || usia <= 0) {
    print('\nError: Usia tidak valid!');
    return;
  }

  if (nilaiTes == null || nilaiTes < 0 || nilaiTes > 100) {
    print('\nError: Nilai tes tidak valid (harus 0 - 100)!');
    return;
  }

  // Cek jenjang pendidikan minimal S1
  bool isMinS1 = pend == 'S1' || pend == 'S2' || pend == 'S3';
  bool isD3 = pend == 'D3';
  bool usiaValid = usia >= 21 && usia <= 35;

  String hasil;
  String keterangan;

  if (usiaValid && isMinS1 && nilaiTes >= 70) {
    hasil = 'Lolos Seleksi';
    keterangan = 'Memenuhi semua kriteria utama (Usia 21-35, Min S1, Nilai tes >= 70).';
  } else if (usiaValid && isD3 && nilaiTes >= 85) {
    hasil = 'Dipertimbangkan';
    keterangan = 'Pendidikan D3 namun nilai tes istimewa (>= 85) dan usia memenuhi syarat.';
  } else {
    hasil = 'Tidak Lolos';
    List<String> alasan = [];
    if (!usiaValid) alasan.add('usia di luar rentang 21-35 tahun');
    if (!isMinS1 && !(isD3 && nilaiTes >= 85)) {
      alasan.add('kualifikasi pendidikan & nilai tes tidak mencukupi');
    }
    if (nilaiTes < 70) alasan.add('nilai tes kurang dari 70');
    keterangan = 'Tidak memenuhi syarat: ${alasan.join(', ')}.';
  }

  print('\n==================== HASIL SELEKSI ====================');
  print('Usia                 : $usia tahun');
  print('Pendidikan Terakhir  : $pend');
  print('Nilai Tes            : ${nilaiTes.toStringAsFixed(nilaiTes.truncateToDouble() == nilaiTes ? 0 : 2)}');
  print('--------------------------------------------------------');
  print('Status Kelulusan     : "$hasil"');
  print('Keterangan           : $keterangan');
  print('========================================================');
}
