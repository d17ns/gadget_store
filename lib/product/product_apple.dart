import 'package:flutter/material.dart';

// class Apple untuk membuat tampilan item pada menu Apple
class Apple extends StatelessWidget {
  const Apple({Key? key, required this.imageURI, required this.itemTitle, required this.itemPrice,}) : super(key: key);
  final String imageURI;
  final String itemTitle;
  final String itemPrice;

  @override
  Widget build(BuildContext context) {
    // fungsi untuk membuat Card pada halaman menu Apple
    return Card(
      clipBehavior: Clip.hardEdge,
      color: Colors.lightBlue.shade200,
      elevation: 5,
      child: Column(
        children: <Widget>[
          // fungsi untuk menampilkan image pada setiap Card
          Image(
            image: AssetImage(imageURI),
            height: 250,
            width: 200,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // fungsi untuk memberikan text dengan variabel itemTitle
                // pada setiap Card
                Text(
                  itemTitle,
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
                // fungsi untuk memberikan text dengan variabel itemPrice
                // pada setiap Card
                Text(
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
