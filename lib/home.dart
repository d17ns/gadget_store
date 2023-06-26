// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gadget_store/menu/samsung_menu.dart';
import 'package:gadget_store/menu/xiaomi_menu.dart';

/* class Home sebagai widget yang berfungsi untuk mengatur halaman utama dalam
 * aplikasi, tepatnya halaman yang ditampilkan setelah user melakukan login */
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _currentPage = 0;

  /* fungsi untuk membuat fungsi _signOut() */
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void _signOut() async {
    await _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    /* fungsi untuk memanggil membuat pilihan menu pada BottomNavigationBar
     * untuk menampilkan halaman widget dari menu yang dipilih */
    final List<Widget> pages = [
      const SamsungMenu(),
      const XiaomiMenu(),
    ];
    /* widget untuk mengatur tampilan AppBar dan BottomNavigationBar */
    return Scaffold(
        appBar: AppBar(
          /* fungsi untuk membuat title dalam AppBar */
          title: const Text(
            "GADGET STORE",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
          ),
          /* fungsi untuk membuat menu Sign Out di bagian kanan AppBar
           * GestureDetector digunakan untuk memanggil fungsi _signOut() saat
           * Icon atau Text di-tap */
          actions: [
            GestureDetector(
              onTap: () {
                _signOut();
              },
              child: Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Row(
                children: [
                  Icon(Icons.logout),
                  SizedBox(width: 6),
                  Text('Sign Out',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
                ),
              ),
            ),
          ],
          backgroundColor: Colors.lightBlue.shade100,
        ),
        /* fungsi untuk mengatur tampilan dari BottomNavigationBar
         * membuat 2 Item, yaitu menu Samsung dan Xiaomi dengan Icon dan Text */
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.android),
              label: 'Samsung',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.android),
              label: 'Xiaomi',
            ),
          ],
          selectedItemColor: Colors.lightBlueAccent,
          currentIndex: _currentPage,
          onTap: (index) {
            setState(() {
              _currentPage = index;
            });
          },
        ),
        /* fungsi untuk menampilkan halaman aktif yang dipilih dari menu
         * BottomNavigationBar */
        body: pages.elementAt(_currentPage));
  }
}