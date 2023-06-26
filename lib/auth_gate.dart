import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'home.dart';

/* class AuthGate sebagai widget untuk autentikasi user menggunakan email dengan
 * menu login, registrasi, dan lupa password */
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    /* widget untuk monitor perubahan status autentikasi user dengan menggunakan
     * FireBaseAuth.instance.authStateChanges */
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        /* fungsi untuk menampilkan halaman utama autentikasi seperti login,
         * registrasi, dan lupa password jika snapshot tidak memiliki data atau
         * user belum login */
        if (!snapshot.hasData) {
          return SignInScreen(
            providerConfigs: const [
              EmailProviderConfiguration(),
            ],
            headerBuilder: (context, constraints, shrinkOffset) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset('assets/gadgetstore.png'),
                ),
              );
            },
            subtitleBuilder: (context, action) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: action == AuthAction.signIn
                    ? const Text('Welcome to GADGET STORE, please sign in!')
                    : const Text('Welcome to GADGET STORE, please sign up!'),
              );
            },
            footerBuilder: (context, action) {
              return const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  'By signing in, you agree to our terms and conditions.',
                  style: TextStyle(color: Colors.grey),
                ),
              );
            },
            sideBuilder: (context, shrinkOffset) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset('assets/gadgetstore.png'),
                ),
              );
            },
          );
        }
        /* jika snapshot memiliki data atau user sudah login, maka saat membuka
         * aplikasi akan langsung diarahkan ke halaman dari widget Home */
        return const Home();
      },
    );
  }
}