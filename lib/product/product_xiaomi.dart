import 'package:flutter/material.dart';

// class Xiaomi untuk membuat tampilan item pada menu Xiaomi
class Xiaomi extends StatelessWidget {
  const Xiaomi({Key? key, required this.imageURI, required this.itemTitle, required this.itemPrice}) : super(key: key);
  final String imageURI;
  final String itemTitle;
  final String itemPrice;

  @override
  Widget build(BuildContext context) {
    // fungsi untuk membuat Card pada halaman menu Xiaomi
    return Card(
      clipBehavior: Clip.hardEdge,
      color: Colors.lightBlue.shade200,
      elevation: 5,
      child: Column(
        children: <Widget>[
          // fungsi untuk menampilkan image pada setiap Card
          Image(
            height: 200,
            width: 150,
            image: AssetImage(imageURI),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  // fungsi untuk memberikan text dengan variabel itemTitle
                  // pada setiap Card
                  itemTitle,
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
                Text(
                  // fungsi untuk memberikan text dengan variabel itemPrice
                  // pada setiap Card
                    "Rp $itemPrice",
                    style: const TextStyle(fontSize: 16, color: Colors.black54)
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}