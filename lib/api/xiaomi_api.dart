import 'package:http/http.dart' as http;
import 'dart:convert';

/* class XiaomiApi yang berfungsi untuk mengambil data dari Json server dengan URL
 * di bawah melalui HTTP Request */
class XiaomiApi {
  Future<List<Xiaomi>?> fetchData() async {
    final response = await http.get(Uri.parse("https://my-json-server.typicode.com/d17ns/demo/xiaomi"));
    /* jika request berhasil, maka jSonData akan diubah menjadi objek Xiaomi dan
     * kemudian dikonversi menjadi list data */
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => Xiaomi.fromJson(item)).toList();
    }
    return null;
  }
}

/* class Xiaomi berisikan properti dari objek Xiaomi yang berhasil diambil dan
 * tidak dapat diubah */
class Xiaomi {
  final int id;
  final String image;
  final String name;
  final String price;

  Xiaomi({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
  });

  /* fungsi untuk inisialisasi objek Xiaomi dengan menggunakan properti yang
   * ada di dalam data Json server */
  factory Xiaomi.fromJson(Map<String, dynamic> json) {
    return Xiaomi(
      id: json["id"],
      image: json["image"],
      name: json["name"],
      price: json["price"],
    );
  }
}