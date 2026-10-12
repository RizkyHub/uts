import 'dart:io';

void main() {
  print('========================================================');
  print('          PROGRAM PENGHITUNG INDEKS MASSA TUBUH         ');
  print('              BODY MASS INDEX (BMI) - SOAL 3            ');
  print('========================================================');
  print('Kategori BMI:');
  print('- BMI < 18.5        : Kurus');
  print('- 18.5 <= BMI <= 24.9 : Normal');
  print('- 25.0 <= BMI <= 29.9 : Kelebihan Berat Badan');
  print('- BMI >= 30.0       : Obesitas');
  print('--------------------------------------------------------');

  stdout.write('Masukkan berat badan (kg)   : ');
  String? beratStr = stdin.readLineSync();

  stdout.write('Masukkan tinggi badan (meter) [contoh: 1.70]: ');
  String? tinggiStr = stdin.readLineSync();

  if (beratStr == null || beratStr.trim().isEmpty ||
      tinggiStr == null || tinggiStr.trim().isEmpty) {
    print('\nError: Berat badan dan tinggi badan tidak boleh kosong!');
    return;
  }

  double? berat = double.tryParse(beratStr.trim().replaceAll(',', '.'));
  double? tinggi = double.tryParse(tinggiStr.trim().replaceAll(',', '.'));

  if (berat == null || berat <= 0) {
    print('\nError: Berat badan harus berupa angka lebih dari 0!');
    return;
  }

  if (tinggi == null || tinggi <= 0) {
    print('\nError: Tinggi badan harus berupa angka lebih dari 0!');
    return;
  }

  // Jika pengguna tidak sengaja memasukkan tinggi dalam satuan cm (misal: 170)
  if (tinggi > 3.0) {
    print('\n(Info: Terdeteksi input tinggi badan dalam cm, otomatis dikonversi ke meter: ${tinggi / 100} m)');
    tinggi = tinggi / 100;
  }

  // Rumus BMI: berat / (tinggi * tinggi)
  double bmi = berat / (tinggi * tinggi);

  String kategori = '';
  if (bmi < 18.5) {
    kategori = 'Kurus';
  } else if (bmi <= 24.9) {
    kategori = 'Normal';
  } else if (bmi <= 29.9) {
    kategori = 'Kelebihan Berat Badan';
  } else {
    kategori = 'Obesitas';
  }

  print('\n==================== HASIL PERHITUNGAN =================');
  print('Berat Badan  : ${berat.toStringAsFixed(1)} kg');
  print('Tinggi Badan : ${tinggi.toStringAsFixed(2)} m');
  print('--------------------------------------------------------');
  print('Nilai BMI    : ${bmi.toStringAsFixed(2)}');
  print('Kategori     : "$kategori"');
  print('========================================================');
}
