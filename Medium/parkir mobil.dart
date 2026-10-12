import 'dart:io';

void main() {
  print('========================================================');
  print('          PROGRAM PENGHITUNG TARIF PARKIR MOBIL         ');
  print('               (LEVEL MEDIUM - SOAL 4)                  ');
  print('========================================================');
  print('Ketentuan Tarif Parkir:');
  print('- 2 jam pertama      : Rp 5.000');
  print('- Setiap jam berikutnya : Tambahan Rp 2.000 / jam');
  print('- Lebih dari 8 jam   : Tarif maksimal Rp 20.000');
  print('--------------------------------------------------------');

  stdout.write('Masukkan durasi parkir (dalam jam) : ');
  String? input = stdin.readLineSync();

  if (input == null || input.trim().isEmpty) {
    print('\nError: Durasi parkir tidak boleh kosong!');
    return;
  }

  double? durasiInput = double.tryParse(input.trim().replaceAll(',', '.'));

  if (durasiInput == null || durasiInput <= 0) {
    print('\nError: Durasi parkir harus lebih dari 0 jam!');
    return;
  }

  // Pembulatan ke atas untuk durasi parkir jika ada menit tambahan
  int durasiJam = durasiInput.ceil();

  int biaya = 0;
  String rincian = '';

  if (durasiJam > 8) {
    biaya = 20000;
    rincian = 'Durasi parkir lebih dari 8 jam (Dikenakan tarif maksimal)';
  } else if (durasiJam <= 2) {
    biaya = 5000;
    rincian = '2 jam pertama';
  } else {
    int jamTambahan = durasiJam - 2;
    int biayaTambahan = jamTambahan * 2000;
    biaya = 5000 + biayaTambahan;
    rincian = 'Rp 5.000 (2 jam pertama) + ($jamTambahan jam x Rp 2.000)';
  }

  print('\n==================== RINCIAN BIAYA =====================');
  print('Durasi Parkir Input : $durasiInput jam');
  print('Durasi Dihitung     : $durasiJam jam');
  print('Keterangan          : $rincian');
  print('--------------------------------------------------------');
  print('Total Biaya Parkir  : Rp ${formatRupiah(biaya)}');
  print('========================================================');
}

/// Fungsi pembantu untuk memformat angka nominal ke pemisah ribuan
String formatRupiah(int nominal) {
  RegExp reg = RegExp(r'\B(?=(\d{3})+(?!\d))');
  return nominal.toString().replaceAllMapped(reg, (Match match) => '.');
}
