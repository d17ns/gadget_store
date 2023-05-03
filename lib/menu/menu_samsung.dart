import 'package:flutter/material.dart';
import 'package:gadget_store/item/item_library.dart';
import 'package:gadget_store/product/product_samsung.dart';

// class SamsungMenu untuk menampilkan halaman pada menu Samsung
class SamsungMenu extends StatefulWidget {
  const SamsungMenu({super.key});

  @override
  State<SamsungMenu> createState() => _SamsungMenuState();
}

class _SamsungMenuState extends State<SamsungMenu> {
  // fungsi untuk memanggil list object samsung dari file item_library.dart
  // object dideklarasikan dengan nama variabel items
  final List items = samsung;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      // fungsi untuk membuat layout scroll view
      child: CustomScrollView(
        slivers: [
          // fungsi untuk membuat tampilan List
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              // fungsi untuk memanggil class Samsung dari file product_samsung.dart
              return Samsung(
                // fungsi untuk memanggil value dari setiap object samsung
                imageURI: items[index]['image'],
                itemTitle: items[index]['name'],
                itemPrice: items[index]['price'],
              );
            }, childCount: items.length),
          )
        ],
      ),
    );
  }
}
