import 'package:flutter/material.dart';
import 'package:gadget_store/api/samsung_api.dart';

/* class SamsungMenu sebagai widget yang akan menampilkan halaman berupa daftar
 * produk Samsung dalam bentuk ListView */
class SamsungMenu extends StatefulWidget {
  const SamsungMenu({Key? key}) : super(key: key);

  @override
  State<SamsungMenu> createState() => _SamsungMenuState();
}

class _SamsungMenuState extends State<SamsungMenu> {
  /* deklarasi variable samsung yang digunakan untuk menyimpan data produk
   * isLoaded = false menunjukkan data masih kosong */
  List<Samsung>? samsung;
  bool isLoaded = false;

  /* fungsi untuk mengambil data menggunakan SamsungApi
   * setelah data berhasil diambil, maka isLoaded = true karena variabel samsung
   * sudah menyimpan data yang berhasil diambil */
  void getSamsung() async {
    samsung = await SamsungApi().fetchData();
    setState(() {
      isLoaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    getSamsung();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      /* fungsi untuk membuat tampilan Loading ketika proses memuat data */
      child: isLoaded ? buildListView() : Center(child: CircularProgressIndicator()),
    );
  }

  /* widget untuk mengatur halaman menu Samsung dengan menggunakan ListView */
  Widget buildListView() {
    return ListView.builder(
      /* menentukan jumlah item atau data daru variabel samsung untuk ditampilkan
       * di dalam layout */
      itemCount: samsung?.length ?? 0,
      itemBuilder: (context, index) {
        /* fungsi untuk membuat setiap item ditampilkan dalam sebuah Card */
        return Card(
          color: Colors.lightBlue.shade100,
          elevation: 7,
          child: Padding(
            padding: const EdgeInsets.all(8),
            /* fungsi Row membuat tampilan Horizontal yang sejajar untuk Image
             * dan Text di dalam Card */
            child: Row(
              children: [
                /* fungsi untuk mengatur tampilan gambar di dalam Card */
                Image(
                  image: NetworkImage(samsung![index].image),
                  height: 200,
                  width: 150,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  /* fungsi untuk mengatur tampilan teks di dalam Card */
                  children: [
                    Text(samsung![index].name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Rp ${samsung![index].price}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}