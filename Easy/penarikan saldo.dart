import 'dart:io';

void main() {
  print('========================================================');
  print('          PROGRAM PENARIKAN SALDO REKENING              ');
  print('                (LEVEL EASY - SOAL 4)                   ');
  print('========================================================');

  stdout.write('Masukkan saldo rekening (Rp)           : ');
  String? saldoStr = stdin.readLineSync();

  stdout.write('Masukkan jumlah uang yang ingin ditarik : ');
  String? tarikStr = stdin.readLineSync();

  if (saldoStr == null || saldoStr.trim().isEmpty ||
      tarikStr == null || tarikStr.trim().isEmpty) {
    print('\nError: Saldo dan nominal penarikan tidak boleh kosong!');
    return;
  }

  double? saldo = double.tryParse(cleanNumber(saldoStr));
  double? penarikan = double.tryParse(cleanNumber(tarikStr));

  if (saldo == null || saldo < 0) {
    print('\nError: Saldo rekening harus berupa angka yang valid!');
    return;
  }

  if (penarikan == null || penarikan <= 0) {
    print('\nError: Jumlah penarikan harus lebih dari 0!');
    return;
  }

  print('\n==================== STATUS TRANSAKSI ==================');
  print('Saldo Awal       : Rp ${formatRupiah(saldo)}');
  print('Jumlah Penarikan : Rp ${formatRupiah(penarikan)}');
  print('--------------------------------------------------------');

  // Ketentuan: Jika penarikan tidak melebihi saldo -> "Transaksi Berhasil", jika tidak -> "Saldo Tidak Cukup"
  if (penarikan <= saldo) {
    double sisaSaldo = saldo - penarikan;
    print('Status           : "Transaksi Berhasil"');
    print('Sisa Saldo       : Rp ${formatRupiah(sisaSaldo)}');
  } else {
    print('Status           : "Saldo Tidak Cukup"');
    print('Kekurangan Dana  : Rp ${formatRupiah(penarikan - saldo)}');
  }
  print('========================================================');
}

/// Menghapus simbol mata uang dan pemisah ribuan
String cleanNumber(String input) {
  return input
      .replaceAll('Rp', '')
      .replaceAll('rp', '')
      .replaceAll('.', '')
      .replaceAll(',', '')
      .trim();
}

/// Format nominal ke pemisah ribuan
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
