import 'package:http/http.dart' as http;
import 'dart:convert';

/* class SamsungApi yang berfungsi untuk mengambil data dari Json server dengan URL
 * di bawah melalui HTTP Request */
class SamsungApi {
  Future<List<Samsung>?> fetchData() async {
    final response = await http.get(Uri.parse("https://my-json-server.typicode.com/d17ns/demo/samsung"));
    /* jika request berhasil, maka jSonData akan diubah menjadi objek Xiaomi dan
     * kemudian dikonversi menjadi list data */
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => Samsung.fromJson(item)).toList();
    }
    return null;
  }
}

/* class Samsung berisikan properti dari objek Samsung yang berhasil diambil dan
 * tidak dapat diubah */
class Samsung {
  final int id;
  final String image;
  final String name;
  final String price;

  Samsung({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
  });

  /* fungsi untuk inisialisasi objek Samsung dengan menggunakan properti yang
   * ada di dalam data Json server */
  factory Samsung.fromJson(Map<String, dynamic> json) {
    return Samsung(
      id: json["id"],
      image: json["image"],
      name: json["name"],
      price: json["price"],
    );
  }
}