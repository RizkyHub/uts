import 'dart:io';

void main() {
  print('========================================================');
  print('               PROGRAM AUTENTIKASI LOGIN                ');
  print('               (LEVEL MEDIUM - SOAL 5)                  ');
  print('========================================================');

  stdout.write('Masukkan Username : ');
  String? username = stdin.readLineSync();

  stdout.write('Masukkan Password : ');
  String? password = stdin.readLineSync();

  String u = username?.trim() ?? '';
  String p = password?.trim() ?? '';

  print('--------------------------------------------------------');

  // Ketentuan: username adalah "admin" dan password adalah "12345"
  if (u == 'admin' && p == '12345') {
    print('Status: Login Berhasil');
    print('Selamat datang, Administrator!');
  } else {
    print('Status: Login Gagal');
    print('Peringatan: Username atau password yang Anda masukkan salah.');
  }
  print('========================================================');
}
