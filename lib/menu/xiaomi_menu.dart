import 'package:flutter/material.dart';
import 'package:gadget_store/api/xiaomi_api.dart';

/* class XiaomiMenu sebagai widget yang akan menampilkan halaman berupa daftar
 * produk Xiaomi dalam bentuk GridView */
class XiaomiMenu extends StatefulWidget {
  const XiaomiMenu({Key? key}) : super(key: key);

  @override
  State<XiaomiMenu> createState() => _XiaomiMenuState();
}

class _XiaomiMenuState extends State<XiaomiMenu> {
  /* deklarasi variable xiaomi yang digunakan untuk menyimpan data produk
   * isLoaded = false menunjukkan data masih kosong */
  List<Xiaomi>? xiaomi;
  bool isLoaded = false;

  /* fungsi untuk mengambil data menggunakan XiaomiApi
   * setelah data berhasil diambil, maka isLoaded = true karena variabel xiaomi
   * sudah menyimpan data yang berhasil diambil */
  void getXiaomi() async {
    xiaomi = await XiaomiApi().fetchData();
    setState(() {
      isLoaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    getXiaomi();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      /* fungsi untuk membuat tampilan Loading ketika proses memuat data */
      child: isLoaded ? buildGridView() : Center(child: CircularProgressIndicator()),
    );
  }

  /* widget untuk mengatur halaman menu Xiaomi dengan menggunakan GridView */
  Widget buildGridView() {
    /* CustomScrollView berfungsi agar layout menjadi scrollable */
    return CustomScrollView(
      slivers: [
        /* fungsi untuk membuat Grid Layout untuk halaman menu Xiaomi */
        SliverGrid(
          delegate: SliverChildBuilderDelegate((context, index) {
            /* fungsi untuk mengambil item atau data dari variabel xiaomi */
            final item = xiaomi![index];
            /* fungsi untuk membuat setiap item ditampilkan dalam sebuah Card */
            return Card(
              color: Colors.lightBlue.shade100,
              elevation: 7,
              /* fungsi untuk membuat tampilan Column di dalam Card untuk item
               * Image dan Text */
              child: Column(
                children: [
                  /* fungsi untuk mengatur tampilan gambar di dalam Card */
                  Image.network(
                    item.image,
                    height: 200,
                    width: 150,
                  ),
                  const SizedBox(height: 10),
                  /* fungsi untuk mengatur tampilan teks name di dalam Card */
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  /* fungsi untuk mengatur tampilan teks price di dalam Card */
                  Text(
                    'Rp ${xiaomi![index].price}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
            /* fungsi untuk menentukan jumlah item atau dari variabel xiaomi
             * untuk ditampilkan dalam layout */
            childCount: xiaomi?.length ?? 0,
          ),
          /* fungsi untuk mengatur letak dan tampilan Grid Layout yang dinamis
           * dengan menyesuaikan orientasi layar landscape atau potrait ketika
           * aplikasi berjalan */
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
            MediaQuery.of(context).orientation == Orientation.landscape ? 3 : 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio:
            MediaQuery.of(context).orientation == Orientation.portrait ? 158 / 194 : 1.2,
          ),
        ),
      ],
    );
  }
}