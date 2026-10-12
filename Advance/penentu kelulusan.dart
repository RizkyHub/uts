import 'dart:io';

void main() {
  print('========================================================');
  print('        PROGRAM PENENTUAN KELULUSAN MAHASISWA           ');
  print('               (LEVEL ADVANCE - SOAL 3)                 ');
  print('========================================================');
  print('Ketentuan Kelulusan:');
  print('- Bobot: 30% Tugas + 30% UTS + 40% UAS');
  print('- Syarat Lulus: Nilai Akhir >= 60 DAN Kehadiran >= 75%');
  print('- Pengecualian: Jika UAS < 40, mahasiswa otomatis TIDAK LULUS');
  print('--------------------------------------------------------');

  stdout.write('Masukkan Nilai Tugas (0 - 100)    : ');
  String? tugasStr = stdin.readLineSync();

  stdout.write('Masukkan Nilai UTS (0 - 100)      : ');
  String? utsStr = stdin.readLineSync();

  stdout.write('Masukkan Nilai UAS (0 - 100)      : ');
  String? uasStr = stdin.readLineSync();

  stdout.write('Masukkan Kehadiran (%) (0 - 100)  : ');
  String? kehadiranStr = stdin.readLineSync();

  if (tugasStr == null || tugasStr.trim().isEmpty ||
      utsStr == null || utsStr.trim().isEmpty ||
      uasStr == null || uasStr.trim().isEmpty ||
      kehadiranStr == null || kehadiranStr.trim().isEmpty) {
    print('\nError: Semua input harus diisi!');
    return;
  }

  double? tugas = double.tryParse(tugasStr.trim().replaceAll(',', '.'));
  double? uts = double.tryParse(utsStr.trim().replaceAll(',', '.'));
  double? uas = double.tryParse(uasStr.trim().replaceAll(',', '.'));
  double? kehadiran = double.tryParse(kehadiranStr.trim().replaceAll(',', '.').replaceAll('%', ''));

  if (tugas == null || tugas < 0 || tugas > 100 ||
      uts == null || uts < 0 || uts > 100 ||
      uas == null || uas < 0 || uas > 100 ||
      kehadiran == null || kehadiran < 0 || kehadiran > 100) {
    print('\nError: Input harus berupa angka valid di antara 0 - 100!');
    return;
  }

  // Hitung Nilai Akhir: 30% Tugas + 30% UTS + 40% UAS
  double nilaiAkhir = (0.30 * tugas) + (0.30 * uts) + (0.40 * uas);

  String status;
  List<String> alasan = [];

  if (uas < 40) {
    status = 'Tidak Lulus';
    alasan.add('Nilai UAS di bawah 40 ($uas)');
  } else if (nilaiAkhir >= 60 && kehadiran >= 75) {
    status = 'Lulus';
  } else {
    status = 'Tidak Lulus';
    if (nilaiAkhir < 60) {
      alasan.add('Nilai akhir di bawah 60 (${nilaiAkhir.toStringAsFixed(2)})');
    }
    if (kehadiran < 75) {
      alasan.add('Kehadiran di bawah 75% (${kehadiran.toStringAsFixed(1)}%)');
    }
  }

  print('\n================== HASIL EVALUASI ======================');
  print('Nilai Tugas          : ${tugas.toStringAsFixed(2)} (Bobot 30%: ${(0.30 * tugas).toStringAsFixed(2)})');
  print('Nilai UTS            : ${uts.toStringAsFixed(2)} (Bobot 30%: ${(0.30 * uts).toStringAsFixed(2)})');
  print('Nilai UAS            : ${uas.toStringAsFixed(2)} (Bobot 40%: ${(0.40 * uas).toStringAsFixed(2)})');
  print('Persentase Kehadiran : ${kehadiran.toStringAsFixed(1)}%');
  print('--------------------------------------------------------');
  print('Nilai Akhir          : ${nilaiAkhir.toStringAsFixed(2)}');
  print('Status Kelulusan     : "$status"');
  if (alasan.isNotEmpty) {
    print('Catatan              : ${alasan.join(' dan ')}.');
  }
  print('========================================================');
}
