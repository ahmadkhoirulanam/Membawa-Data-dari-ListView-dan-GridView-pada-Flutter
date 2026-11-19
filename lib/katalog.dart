import 'package:flutter/material.dart';

class Katalog extends StatelessWidget {
  const Katalog({super.key});

  // Data produk (gambar diambil dari internet)
  static const List<Map<String, String>> items = [
    {
      'nama': 'Tas Ransel Laptop',
      'kategori': 'Tas',
      'harga': 'Rp 350.000',
      'gambar': 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png',
      'deskripsi': 'Tas ransel muat laptop hingga 15 inci, cocok untuk kuliah dan kerja.',
    },
    {
      'nama': 'Kaos Slim Fit Pria',
      'kategori': 'Pakaian',
      'harga': 'Rp 120.000',
      'gambar': 'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_t.png',
      'deskripsi': 'Kaos bahan katun lembut, nyaman dipakai sehari-hari.',
    },
    {
      'nama': 'Jaket Katun Pria',
      'kategori': 'Pakaian',
      'harga': 'Rp 425.000',
      'gambar': 'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_t.png',
      'deskripsi': 'Jaket hangat untuk musim hujan dan perjalanan jauh.',
    },
    {
      'nama': 'Kemeja Casual',
      'kategori': 'Pakaian',
      'harga': 'Rp 180.000',
      'gambar': 'https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_t.png',
      'deskripsi': 'Kemeja casual slim fit, cocok untuk acara santai.',
    },
    {
      'nama': 'Gelang Rantai Perak',
      'kategori': 'Aksesoris',
      'harga': 'Rp 275.000',
      'gambar':
          'https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_t.png',
      'deskripsi': 'Gelang rantai model naga, bahan perak berkualitas.',
    },
    {
      'nama': 'Hardisk Eksternal 2TB',
      'kategori': 'Elektronik',
      'harga': 'Rp 950.000',
      'gambar': 'https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_t.png',
      'deskripsi': 'Penyimpanan portable USB 3.0, cepat dan ringkas.',
    },
  ];

  // Widget judul untuk tiap bagian
  Widget _judul(String teks, IconData ikon) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
      child: Row(
        children: [
          Icon(ikon, color: Colors.blue),
          const SizedBox(width: 8),
          Text(
            teks,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // Gambar produk dari internet, dengan loading dan cadangan jika gagal
  static Widget _gambar(String url, {double? size}) {
    return Image.network(
      url,
      width: size,
      height: size,
      fit: BoxFit.contain,
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return SizedBox(
          width: size,
          height: size,
          child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
        );
      },
      errorBuilder: (context, error, stack) => SizedBox(
        width: size,
        height: size,
        child: const Icon(Icons.image_not_supported, color: Colors.grey),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          "Katalog Produk",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.shopping_cart, color: Colors.white),
          ),
        ],
      ),
      body: Column(
        children: [
          // Setengah atas: judul + ListView vertikal
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _judul('Daftar Produk', Icons.list),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return Card(
                        color: Colors.white,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          onTap: () => _bukaDetail(context, item),
                          contentPadding: const EdgeInsets.all(8),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: _gambar(item['gambar']!, size: 60),
                          ),
                          title: Text(
                            item['nama']!,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['deskripsi']!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item['harga']!,
                                style: const TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          trailing: Chip(
                            label: Text(
                              item['kategori']!,
                              style: const TextStyle(fontSize: 10),
                            ),
                            backgroundColor: Colors.blue[50],
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          // Setengah bawah: judul + GridView
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _judul('Galeri Produk', Icons.grid_view),
                Expanded(
                  child: GridView.count(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    crossAxisCount: 2,
                    childAspectRatio: 0.85,
                    children: List.generate(items.length, (index) {
                      final item = items[index];
                      return Card(
                        color: Colors.white,
                        elevation: 2,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: InkWell(
                          onTap: () => _bukaDetail(context, item),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  color: Colors.white,
                                  padding: const EdgeInsets.all(8),
                                  child: _gambar(item['gambar']!),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['nama']!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      item['deskripsi']!,
                                      style: const TextStyle(
                                        fontSize: 11,
                                        color: Colors.black54,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      item['harga']!,
                                      style: const TextStyle(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Pindah ke halaman detail sambil membawa data produk yang diklik
  void _bukaDetail(BuildContext context, Map<String, String> item) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailProduk(produk: item)),
    );
  }
}

// Halaman detail produk (menerima data dari halaman Katalog)
class DetailProduk extends StatelessWidget {
  final Map<String, String> produk;

  const DetailProduk({super.key, required this.produk});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          produk['nama']!,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        children: [
          // Gambar besar
          Container(
            color: Colors.white,
            height: 300,
            padding: const EdgeInsets.all(24),
            child: Katalog._gambar(produk['gambar']!),
          ),
          // Informasi produk
          Container(
            color: Colors.white,
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Chip(
                  label: Text(produk['kategori']!),
                  backgroundColor: Colors.blue[50],
                ),
                const SizedBox(height: 8),
                Text(
                  produk['nama']!,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  produk['harga']!,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(height: 32),
                const Text(
                  'Deskripsi Produk',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  produk['deskripsi']!,
                  style: const TextStyle(fontSize: 14, height: 1.5),
                ),
              ],
            ),
          ),
        ],
      ),
      // Tombol beli di bagian bawah
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            icon: const Icon(Icons.add_shopping_cart),
            label: const Text('Tambah ke Keranjang'),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${produk['nama']} ditambahkan ke keranjang'),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
