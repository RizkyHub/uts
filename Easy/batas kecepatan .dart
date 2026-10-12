import 'dart:io';

void main() {
  print('========================================================');
  print('       PROGRAM PENGECEKAN BATAS KECEPATAN KENDARAAN     ');
  print('                (LEVEL EASY - SOAL 3)                   ');
  print('========================================================');
  print('Batas Kecepatan Maksimal: 80 km/jam');
  print('--------------------------------------------------------');

  stdout.write('Masukkan kecepatan kendaraan (km/jam): ');
  String? input = stdin.readLineSync();

  if (input == null || input.trim().isEmpty) {
    print('\nError: Kecepatan kendaraan tidak boleh kosong!');
    return;
  }

  double? kecepatan = double.tryParse(input.trim().replaceAll(',', '.'));

  if (kecepatan == null || kecepatan < 0) {
    print('\nError: Kecepatan harus berupa angka valid (>= 0)!');
    return;
  }

  print('\n==================== STATUS KECEPATAN ==================');
  print('Kecepatan Kendaraan : ${formatAngka(kecepatan)} km/jam');
  print('--------------------------------------------------------');

  if (kecepatan > 80) {
    print('Status : "Melebihi Batas Kecepatan"');
    print('Peringatan: Harap kurangi kecepatan demi keselamatan berkendara!');
  } else {
    print('Status : Kecepatan Aman (Dalam Batas Wajar)');
  }
  print('========================================================');
}

/// Menghilangkan desimal .0 jika angka berupa bilangan bulat
String formatAngka(double val) {
  if (val == val.truncateToDouble()) {
    return val.toInt().toString();
  }
  return val.toString();
}
