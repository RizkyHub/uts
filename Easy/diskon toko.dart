import 'dart:io';

void main() {
  print('========================================================');
  print('          PROGRAM PENGHITUNG DISKON TOKO                ');
  print('                (LEVEL EASY - SOAL 1)                   ');
  print('========================================================');
  print('Ketentuan Diskon:');
  print('- Diskon 10% jika total belanja minimal Rp 500.000');
  print('--------------------------------------------------------');

  stdout.write('Masukkan total belanja (Rp): ');
  String? input = stdin.readLineSync();

  if (input == null || input.trim().isEmpty) {
    print('\nError: Total belanja tidak boleh kosong!');
    return;
  }

  // Bersihkan input format rupiah jika ada
  String cleanInput = input
      .replaceAll('Rp', '')
      .replaceAll('rp', '')
      .replaceAll('.', '')
      .replaceAll(',', '')
      .trim();
  double? totalBelanja = double.tryParse(cleanInput);

  if (totalBelanja == null || totalBelanja < 0) {
    print('\nError: Total belanja harus berupa angka valid (>= 0)!');
    return;
  }

  double diskon = 0.0;
  if (totalBelanja >= 500000) {
    diskon = totalBelanja * 0.10;
  }

  double totalBayar = totalBelanja - diskon;

  print('\n==================== RINCIAN BELANJA ===================');
  print('Total Belanja Awal   : Rp ${formatRupiah(totalBelanja)}');
  if (diskon > 0) {
    print('Diskon (10%)         : Rp ${formatRupiah(diskon)}');
  } else {
    print('Diskon (0%)          : Rp 0 (Belanja belum mencapai Rp 500.000)');
  }
  print('--------------------------------------------------------');
  print('Total yang Harus Dibayar : Rp ${formatRupiah(totalBayar)}');
  print('========================================================');
}

/// Fungsi pembantu untuk memformat angka nominal ke pemisah ribuan
String formatRupiah(double nominal) {
  bool isInteger = nominal == nominal.roundToDouble();
  String fixedStr = isInteger ? nominal.toInt().toString() : nominal.toStringAsFixed(2);
  List<String> parts = fixedStr.split('.');
  String integerPart = parts[0];
  String decimalPart = parts.length > 1 ? ',${parts[1]}' : '';

  RegExp reg = RegExp(r'\B(?=(\d{3})+(?!\d))');
  String formattedInteger = integerPart.replaceAllMapped(reg, (Match match) => '.');

  return '$formattedInteger$decimalPart';
}
