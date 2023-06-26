import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'firebase_options.dart';
import 'app.dart';

/* fungsi utama yang akan dieksekusi saat aplikasi dijalankan */
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /* fungsi untuk inisialisasi Firebase dalam aplikasi */
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /* menggunakan Email sebagai metode yang digunakan untuk autentikasi user */
  FlutterFireUIAuth.configureProviders([
    const EmailProviderConfiguration(),
  ]);

  /* aplikasi akan menjalankan widget GadgetStore sebagai widget utama */
  runApp(const GadgetStore());
}