import 'package:flutter/material.dart';
import 'package:gadget_store/auth_gate.dart';

/* class GadgetStore yang berfungsi sebagai widget utama dari aplikasi */
class GadgetStore extends StatelessWidget {
  const GadgetStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* widget untuk mengatur tampilan aplikasi */
    return MaterialApp(
      /* fungsi untuk mengatur tema aplikasi */
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        useMaterial3: true,
      ),
      /* route untuk menentukan halaman utama aplikasi, yaitu halaman dari
       * widget AuthGate */
      home: const AuthGate(),
    );
  }
}