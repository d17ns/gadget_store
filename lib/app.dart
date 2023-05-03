import 'package:flutter/material.dart';

import 'home.dart';
import 'login.dart';

// class GadgetStore sebagai class utama dari app
class GadgetStore extends StatelessWidget {
  const GadgetStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GADGET STORE',
      // initialRoute berfungsi sebagai route yang pertama kali dipanggil saat app dibuka
      initialRoute: '/login',
      routes: {
        // '/login' memanggil class LoginPage dari file login.dart untuk dijalankan pertama kali saat app dibuka
        '/login': (BuildContext context) => const LoginPage(),
        // '/' route memanggil class Home dari file home.dart untuk dijalankan setelah route /login
        '/': (BuildContext context) => const Home(),
      },
    );
  }
}