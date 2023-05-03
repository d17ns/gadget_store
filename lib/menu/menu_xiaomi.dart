import 'package:flutter/material.dart';
import 'package:gadget_store/item/item_library.dart';
import 'package:gadget_store/product/product_xiaomi.dart';

// class XiaomiMenu untuk menampilkan halaman pada menu Xiaomi
class XiaomiMenu extends StatelessWidget {
  const XiaomiMenu({super.key});
  // fungsi untuk memanggil list object xiaomi dari file item_library.dart
  // object dideklarasikan dengan nama variabel items
  final List items = xiaomi;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        // fungsi untuk membuat layout scroll view
        child: CustomScrollView(
          slivers: [
            // fungsi untuk membuat tampilan Grid
            SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                // fungsi untuk memanggil class Xiaomi dari file product_xiaomi.dart
                return Xiaomi(
                  // fungsi untuk memanggil value dari setiap object xiaomi
                  imageURI: items[index]['image'],
                  itemTitle: items[index]['name'],
                  itemPrice: items[index]['price'],
                );
              }, childCount: items.length),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                // fungsi untuk membuat layout responsive dengan orientation landscape
                crossAxisCount: MediaQuery.of(context).orientation == Orientation.landscape ? 3 : 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                // fungsi untuk membuat layout responsive dengan orientation potrait
                childAspectRatio: MediaQuery.of(context).orientation == Orientation.portrait ? 158 / 194 : 1.2,
              ),
            )
          ],
        ));
  }
}