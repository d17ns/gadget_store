import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// class Samsung untuk membuat tampilan item pada menu Samsung
class Samsung extends StatelessWidget {
  const Samsung({Key? key, required this.itemTitle, required this.itemPrice, required this.imageURI}) : super(key: key);
  final String itemTitle;
  final String itemPrice;
  final String imageURI;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // fungsi untuk membuat Card pada halaman menu Samsung
      child: Card(
        clipBehavior: Clip.hardEdge,
        color: Colors.lightBlue.shade200,
        elevation: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
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
            // fungsi untuk menampilkan image pada setiap Card
            Image(
              image: AssetImage(imageURI),
              height: 100,
              width: 120,
            )
          ],
        ),
      ),
    );
  }
}
