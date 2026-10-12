import 'dart:io';

void main() {
  print('========================================================');
  print('       PROGRAM PENGECEKAN PERSENTASE BATERAI HP         ');
  print('                (LEVEL EASY - SOAL 5)                   ');
  print('========================================================');

  stdout.write('Masukkan persentase baterai smartphone (0 - 100)% : ');
  String? input = stdin.readLineSync();

  if (input == null || input.trim().isEmpty) {
    print('\nError: Persentase baterai tidak boleh kosong!');
    return;
  }

  // Menghapus tanda persen jika pengguna mengetikkan '%'
  String cleanInput = input.replaceAll('%', '').replaceAll(',', '.').trim();
  double? baterai = double.tryParse(cleanInput);

  if (baterai == null || baterai < 0 || baterai > 100) {
    print('\nError: Masukkan angka persentase baterai yang valid (0 - 100)!');
    return;
  }

  print('--------------------------------------------------------');
  print('Level Baterai : ${formatAngka(baterai)}%');
  print('--------------------------------------------------------');

  // Ketentuan: Jika baterai kurang dari 20%, tampilkan "Segera Isi Daya"
  if (baterai < 20) {
    print('Peringatan: "Segera Isi Daya"');
    print('Kondisi   : Daya baterai lemah! Segera hubungkan ke pengisi daya.');
  } else {
    print('Status    : Baterai Aman / Cukup');
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
