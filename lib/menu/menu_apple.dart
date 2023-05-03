import 'package:flutter/material.dart';
import 'package:gadget_store/item/item_library.dart';
import 'package:gadget_store/product/product_apple.dart';

// class AppleMenu untuk menampilkan halaman pada menu Apple
class AppleMenu extends StatelessWidget {
  const AppleMenu({super.key});
  // fungsi untuk memanggil list object apple dari file item_library.dart
  // object dideklarasikan dengan nama variabel items
  final List items = apple;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      // fungsi untuk membuat layout scroll view
      child: CustomScrollView(
        slivers: [
          // fungsi untuk membuat layout responsive dengan orientation landscape dan potrait
          MediaQuery.of(context).orientation == Orientation.landscape ? const _landscapeList() : const _portraitList()
        ],
      ),
    );
  }
}

// class _potraitList sebagai fungsi untuk responsive layout potrait
class _portraitList extends StatelessWidget {
  const _portraitList();
  // fungsi untuk memanggil list object apple dari file item_library.dart
  // object dideklarasikan dengan nama variabel items
  final List items = apple;

  @override
  Widget build(BuildContext context) {
    // fungsi untuk membuat tampilan List saat orientation potrait
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        // fungsi untuk memanggil class Apple dari file product_apple.dart
        return Apple(
          // fungsi untuk memanggil value dari setiap object apple
          imageURI: items[index]["image"],
          itemTitle: items[index]["name"],
          itemPrice: items[index]["price"],
        );
      }, childCount: items.length),
    );
  }
}

// class _landscapeList sebagai fungsi untuk responsive layout landscape
class _landscapeList extends StatelessWidget {
  const _landscapeList();
  // fungsi untuk memanggil list object apple dari file item_library.dart
  // object dideklarasikan dengan nama variabel items
  final List items = apple;

  @override
  Widget build(BuildContext context) {
    // fungsi untuk membuat tampilan Grid saat orientation landscape
    return SliverGrid(
        delegate: SliverChildBuilderDelegate(
              (context, index) {
                // fungsi untuk memanggil class Apple dari file product_apple.dart
            return Apple(
              // fungsi untuk memanggil value dari setiap object apple
              imageURI: items[index]["image"],
              itemTitle: items[index]["name"],
              itemPrice: items[index]["price"],
            );
          },
          childCount: items.length,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 1.2,
        ));
  }
}
