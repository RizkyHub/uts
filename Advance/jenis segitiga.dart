import 'dart:io';

void main() {
  print('========================================================');
  print('        PROGRAM KLASIFIKASI JENIS SEGITIGA              ');
  print('               (LEVEL ADVANCE - SOAL 4)                 ');
  print('========================================================');
  print('Aturan Segitiga:');
  print('- Jumlah sembarang dua sisi harus lebih besar dari sisi lainnya.');
  print('- Jenis: Sama Sisi, Sama Kaki, atau Sembarang.');
  print('--------------------------------------------------------');

  stdout.write('Masukkan panjang sisi a : ');
  String? aStr = stdin.readLineSync();

  stdout.write('Masukkan panjang sisi b : ');
  String? bStr = stdin.readLineSync();

  stdout.write('Masukkan panjang sisi c : ');
  String? cStr = stdin.readLineSync();

  if (aStr == null || aStr.trim().isEmpty ||
      bStr == null || bStr.trim().isEmpty ||
      cStr == null || cStr.trim().isEmpty) {
    print('\nError: Ketiga panjang sisi harus diisi!');
    return;
  }

  double? a = double.tryParse(aStr.trim().replaceAll(',', '.'));
  double? b = double.tryParse(bStr.trim().replaceAll(',', '.'));
  double? c = double.tryParse(cStr.trim().replaceAll(',', '.'));

  if (a == null || b == null || c == null) {
    print('\nError: Panjang sisi harus berupa angka yang valid!');
    return;
  }

  print('\n==================== HASIL ANALISIS ====================');
  print('Sisi a : ${formatSisi(a)}');
  print('Sisi b : ${formatSisi(b)}');
  print('Sisi c : ${formatSisi(c)}');
  print('--------------------------------------------------------');

  // Validasi segitiga: semua sisi harus > 0 dan memenuhi pertidaksamaan segitiga
  bool isValidSegitiga = (a > 0 && b > 0 && c > 0) &&
      (a + b > c) &&
      (a + c > b) &&
      (b + c > a);

  if (!isValidSegitiga) {
    print('Hasil : "Bukan Segitiga"');
    print('Alasan: Ketiga sisi tidak memenuhi syarat pembentukan segitiga (jumlah dua sisi harus > sisi lainnya).');
  } else {
    String jenis;
    if (a == b && b == c) {
      jenis = 'Sama Sisi';
    } else if (a == b || a == c || b == c) {
      jenis = 'Sama Kaki';
    } else {
      jenis = 'Sembarang';
    }

    print('Hasil : "$jenis"');
    print('Status: Valid membentuk segitiga.');
  }
  print('========================================================');
}

/// Menghilangkan angka .0 jika nilai merupakan bilangan bulat
String formatSisi(double val) {
  if (val == val.truncateToDouble()) {
    return val.toInt().toString();
  }
  return val.toString();
}
