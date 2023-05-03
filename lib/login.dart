import 'package:flutter/material.dart';

// class LoginPage sebagai class utama yang menampilkan halaman Login
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

// class _LoginPageState yang berisikan fungsi-fungsi bagaimana widget dan UI
// pada halaman Login dibuat
class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 100.0),
            // fungsi untuk membuat kolom yang menampilkan logo pada halaman login
            // logo dipanggil dari direktori assets/gadgetstore.png
            Column(
              children: <Widget>[
                Image.asset(
                  'assets/gadgetstore.png',
                  height: 150,
                  width: 150,),
                const SizedBox(height: 10.0),
              ],
            ),
            const SizedBox(height: 40.0),
            // fungsi untuk membuat form input Username
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 16.0),
            // fungsi untuk membuat form input Password
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            OverflowBar(
              alignment: MainAxisAlignment.end,
              children: <Widget>[
                // fungsi untuk membuat tombol CANCEL
                TextButton(
                  child: const Text('CANCEL'),
                  onPressed: () {
                    _usernameController.clear();
                    _passwordController.clear();
                  },
                ),
                // fungsi untuk membuat tombol NEXT
                ElevatedButton(
                  child: const Text('NEXT'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}