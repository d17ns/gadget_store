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
import 'package:gadget_store/menu/menu_apple.dart';
import 'package:gadget_store/menu/menu_samsung.dart';
import 'package:gadget_store/menu/menu_xiaomi.dart';


// class Home sebagai class utama yang menampilkan seluruh halaman Home
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

// class _HomeState yang berisikan fungsi-fungsi bagaimana widget dan UI
// pada halaman Home dibuat
class _HomeState extends State<Home> {
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    // fungsi untuk membuat 3 pilihan menu pada Navigation Bar
    // ketiga menu tersebut dipanggil dari masing-masing class, yaitu
    // AppleMenu() dari file menu_apple
    // SamsungMenu() dari file menu_samsung
    // XiaomiMenu() dari file menu_xiaomi
    final List<Widget> pages = [
      const AppleMenu(),
      const SamsungMenu(),
      const XiaomiMenu(),
    ];
    return Scaffold(
      // fungsi untuk membuat AppBar dengan title GADGET STORE
        appBar: AppBar(
          title: const Text(
            "GADGET STORE",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
          ),
          backgroundColor: Colors.lightBlue.shade200,

        ),
        // fungsi untuk membuat Bottom Navigation Bar dengan masing-masing label yaitu
        // Apple, Samsung, dan Xiaomi beserta icon-nya
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.apple),
              label: 'Apple',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.android),
              label: 'Samsung',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.android),
              label: 'Xiaomi',
            ),
          ],
          // fungsi untuk mengubah warna pada saat menu tersebut disentuh
          selectedItemColor: Colors.lightBlueAccent,
          currentIndex: _currentPage,
          onTap: (index) {
            setState(() {
              _currentPage = index;
            });
          },
        ),
        body: pages.elementAt(_currentPage));
  }
}
