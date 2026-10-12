import 'dart:io';

void main() {
  print('========================================================');
  print('         PROGRAM PENGHITUNG TARIF RESERVASI HOTEL       ');
  print('               (LEVEL ADVANCE - SOAL 5)                 ');
  print('========================================================');
  print('Ketentuan Diskon:');
  print('1. Member:');
  print('   - 1 - 2 malam      : Diskon 10%');
  print('   - 3 - 5 malam      : Diskon 15%');
  print('   - Lebih dari 5 mlm : Diskon 25%');
  print('2. Non-Member:');
  print('   - Lebih dari 5 mlm : Diskon 10%');
  print('   - Selain itu       : Tidak ada diskon (0%)');
  print('3. Potongan Tambahan:');
  print('   - Potongan Rp 200.000 jika total setelah diskon > Rp 3.000.000');
  print('--------------------------------------------------------');

  stdout.write('Masukkan harga kamar per malam (Rp) : ');
  String? hargaStr = stdin.readLineSync();

  stdout.write('Masukkan jumlah malam menginap      : ');
  String? malamStr = stdin.readLineSync();

  stdout.write('Apakah pelanggan Member? (Y/N)      : ');
  String? memberStr = stdin.readLineSync();

  if (hargaStr == null || hargaStr.trim().isEmpty ||
      malamStr == null || malamStr.trim().isEmpty ||
      memberStr == null || memberStr.trim().isEmpty) {
    print('\nError: Semua data harus diisi!');
    return;
  }

  // Sanitasi input harga
  String cleanHarga = hargaStr
      .replaceAll('Rp', '')
      .replaceAll('rp', '')
      .replaceAll('.', '')
      .replaceAll(',', '')
      .trim();
  double? hargaKamar = double.tryParse(cleanHarga);
  int? jumlahMalam = int.tryParse(malamStr.trim());

  if (hargaKamar == null || hargaKamar <= 0) {
    print('\nError: Harga kamar per malam tidak valid!');
    return;
  }

  if (jumlahMalam == null || jumlahMalam <= 0) {
    print('\nError: Jumlah malam menginap harus lebih dari 0!');
    return;
  }

  String memberInput = memberStr.trim().toUpperCase();
  bool isMember = memberInput == 'Y' || memberInput == 'YES' || memberInput == 'MEMBER';

  // 1. Total Awal
  double totalAwal = hargaKamar * jumlahMalam;

  // 2. Persentase Diskon
  double diskonPersen = 0.0;
  if (isMember) {
    if (jumlahMalam <= 2) {
      diskonPersen = 10.0;
    } else if (jumlahMalam <= 5) {
      diskonPersen = 15.0;
    } else {
      diskonPersen = 25.0;
    }
  } else {
    if (jumlahMalam > 5) {
      diskonPersen = 10.0;
    } else {
      diskonPersen = 0.0;
    }
  }

  double nominalDiskon = totalAwal * (diskonPersen / 100);
  double setelahDiskon = totalAwal - nominalDiskon;

  // 3. Potongan Tambahan
  double potonganTambahan = 0.0;
  if (setelahDiskon > 3000000) {
    potonganTambahan = 200000.0;
  }

  // 4. Total Pembayaran
  double totalPembayaran = setelahDiskon - potonganTambahan;

  print('\n================== RINCIAN PEMBAYARAN ==================');
  print('Harga Kamar per Malam : Rp ${formatRupiah(hargaKamar)}');
  print('Lama Menginap         : $jumlahMalam malam');
  print('Status Pelanggan      : ${isMember ? 'Member' : 'Non-Member'}');
  print('--------------------------------------------------------');
  print('Total Awal            : Rp ${formatRupiah(totalAwal)}');
  print('Diskon (${diskonPersen.toInt()}%)          : Rp ${formatRupiah(nominalDiskon)}');
  print('Total Setelah Diskon  : Rp ${formatRupiah(setelahDiskon)}');
  print('Potongan Tambahan     : Rp ${formatRupiah(potonganTambahan)} ${potonganTambahan > 0 ? "(Transaksi > Rp 3.000.000)" : "(Tidak memenuhi syarat)"}');
  print('--------------------------------------------------------');
  print('TOTAL PEMBAYARAN      : Rp ${formatRupiah(totalPembayaran)}');
  print('========================================================');
}

/// Fungsi pembantu untuk memformat nominal ke format Rupiah
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
