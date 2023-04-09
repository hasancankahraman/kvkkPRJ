// ignore_for_file: avoid_print, prefer_const_constructors, use_build_context_synchronously, unnecessary_null_comparison, unused_local_variable

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../db/post.dart';
import '../db/product.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late Isar isar;

  List<Post> posts = [];

  List<dynamic> products = [
    {
      "id": 1,
      "name": " Kamuoyu Duyurusu (Veri İhlali Bildirimi)",
      "content": "İhlalden etkilenen tahmini kişi sayısı",
      "price": 71422.0,
      "image":
          "https://www.pngkit.com/png/full/257-2579960_logo-sahibinden.png",
      "category": "Veri İhlali Bildirimi",
    },
    {
      "id": 2,
      "name": "Kamuoyu Duyurusu (Veri İhlali Bildirimi)",
      "content": "İhlalden etkilenen tahmini kişi sayısı",
      "price": 500098.0,
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/5/58/Getir_logo.png",
      "category": "Veri İhlali Bildirimi",
    },
    {
      "id": 3,
      "name": "Kamuoyu Duyurusu (Veri İhlali Bildirimi)",
      "content": "İhlalden etkilenen tahmini kişi sayısı",
      "price": 10000.0,
      "image":
          "https://voltmotor.com.tr/wp-content/uploads/2021/06/akbank-logo.jpg",
      "category": "Veri İhlali Bildirimi",
    },
    {
      "id": 4,
      "name": "Kamuoyu Duyurusu (Veri İhlali Bildirimi)",
      "content": "İhlalden etkilenen tahmini kişi sayısı",
      "price": 40000.0,
      "image":
          "https://www.medipol.edu.tr/sites/default/files/2022-07/Logo_01.png",
      "category": "Veri İhlali Bildirimi",
    },
    {
      "id": 5,
      "name": "Kamuoyu Duyurusu (Veri İhlali Bildirimi)",
      "content": "İhlalden etkilenen tahmini kişi sayısı",
      "price": 71422.0,
      "image":
          "https://i.pinimg.com/originals/29/7f/48/297f489a586db43c20441ad305b0978a.png",
      "category": "Veri İhlali Bildirimi",
    },
    {
      "id": 6,
      "name": "Kamuoyu Duyurusu (Veri İhlali Bildirimi)",
      "content": "İhlalden etkilenen tahmini kişi sayısı",
      "price": 80000.0,
      "image": "https://upload.wikimedia.org/wikipedia/tr/2/24/Ibb_amblem.png",
      "category": "Veri İhlali Bildirimi",
    },
    {
      "id": 7,
      "name": "Kamuoyu Duyurusu (Veri İhlali Bildirimi)",
      "content": "İhlalden etkilenen tahmini kişi sayısı",
      "price": 100000.0,
      "image": "https://logowik.com/content/uploads/images/647_toyota.jpg",
      "category": "Veri İhlali Bildirimi",
    },
    {
      "id": 8,
      "name": "Kamuoyu Duyurusu (Veri İhlali Bildirimi)",
      "content": "İhlalden etkilenen tahmini kişi sayısı",
      "price": 3500000.0,
      "image":
          "https://bedaid.com/en/wp-content/uploads/2015/08/Referanslar-%C4%B0stanbul-%C3%96zel-Erdem-Hastanesi-Logo.png",
      "category": "Veri İhlali Bildirimi",
    },
    {
      "id": 9,
      "name": "Kamuoyu Duyurusu (Veri İhlali Bildirimi)",
      "content": "İhlalden etkilenen tahmini kişi sayısı",
      "price": 2000000.0,
      "image":
          "https://www.medilife.com.tr/_DEFAULT/assets/images/profile-no.png?v=20230328225729",
      "category": "Veri İhlali Bildirimi",
    },
    {
      "id": 10,
      "name": "Kamuoyu Duyurusu (Veri İhlali Bildirimi)",
      "content": "İhlalden etkilenen tahmini kişi sayısı",
      "price": 973375.0,
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/Uber_logo_2018.svg/2560px-Uber_logo_2018.svg.png",
      "category": "Veri İhlali Bildirimi",
    },
  ];

  List<Product> dbProducts = [];
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  addProduct(String title, String category, String description,
      String imagePath, String content, double price) async {
    Product newProduct = Product()
      ..category = category
      ..description = description
      ..favorite = false
      ..imgUrl = imagePath
      ..price = price
      ..imgUrl = imagePath
      ..price = price
      ..tags = ["tag1", "tag2", "tag3"]
      ..title = title;

    await isar.writeTxn(() async {
      var addedId = await isar.products.put(newProduct);
      print(addedId);
      getAllProducts();
      if (addedId != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Veri İhlali Bildirimi Başarıyla Eklendi.'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Veri İhlali Bildirimi Eklenirken Hata Oluştu.'),
          ),
        );
      }
    });
  }

  editProduct(int id, String title, String category, String description,
      String content, String imagePath, double price) async {
    Product newProduct = Product()
      ..id = id
      ..category = category
      ..description = description
      ..favorite = false
      ..imgUrl = imagePath
      ..price = price
      ..imgUrl = imagePath
      ..content = content
      ..price = price
      ..tags = ["tag1", "tag2", "tag3"]
      ..title = title;

    await isar.writeTxn(() async {
      var addedId = await isar.products.put(newProduct);
      print(addedId);
      getAllProducts();
      if (addedId != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Veri İhlali Bildirimi Başarıyla Eklendi.'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Veri İhlali Bildirimi Eklenirken Hata Oluştu.'),
          ),
        );
      }
    });
  }

  deleteProduct(int id) async {
    isar.writeTxn(() async {
      var result = await isar.products.delete(id);
      if (result) {
        print('Veri İhlali Silindi');
        getAllProducts();
      } else {
        print('Veri İhlali Silinmedi');
      }
    });
  }

  getFromServer() {
    for (int i = 0; i < products.length; i++) {
      addProduct(
          products[i]["name"],
          products[i]["category"],
          products[i]["content"],
          products[i]["image"],
          "",
          products[i]["price"]);
    }
  }

  switchFavorite(Product product) async {
    Product updatedProduct = product;

    updatedProduct.favorite = !updatedProduct.favorite;

    await isar.writeTxn(() async {
      await isar.products.put(updatedProduct);
      getAllProducts();
    });
  }

  getAllProducts() async {
    dbProducts = await isar.products.where().findAll();
    setState(() {});
  }

  getFavoriteProducts() async {
    dbProducts = await isar.products.filter().favoriteEqualTo(true).findAll();
    setState(() {});
  }

  openConnection() async {
    try {
      isar = await Isar.open([PostSchema, ProductSchema]);
      if (isar.isOpen) {
        print('Bağantı Başarılı');
        getAllProducts();
      } else {
        print('Bağlanadı');
      }
    } catch (e) {
      print('Bağlanma Hatası:');
      print(e);
    }
  }

  closeConnection() async {
    try {
      var result = await isar.close();
      if (result) {
        print('Bağlantınız Başarıyla Kapandı.');
      } else {
        print('Bağlantınız Kapanmadı');
      }
    } catch (e) {
      print('Hata:');
      print(e);
    }
  }

  @override
  void initState() {
    openConnection();
    super.initState();
  }

  @override
  void dispose() {
    closeConnection();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String title = '';
    String content = '';
    String imagePath = '';

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Veri İhlali'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Veri İhlali Başlık'),
              onChanged: (value) => title = value,
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(labelText: 'Veri İhlali İçerik'),
              onChanged: (value) => content = value,
            ),
            SizedBox(height: 16),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      getFromServer();
                    },
                    child: Text('Yeni Veri İhlali Bildirimi Ekle'),
                  ),
                  SizedBox(height: 16), // Ara boşluk ekleyin
                  ElevatedButton(
                    onPressed: () {
                      getFavoriteProducts();
                    },
                    child: Text('Yalnız İlgili Olduğunuz Konuları Göster'),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      getAllProducts();
                    },
                    child: Text('Hepsini Göster'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: dbProducts
                        .map(
                          (e) => Container(
                            padding: EdgeInsets.all(15),
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey, width: 2),
                            ),
                            //color: Colors.black
                            child: Column(
                              children: [
                                Image.network(e.imgUrl!),
                                Text("${e.id}   ${e.title}"),
                                Text("${e.description}"),
                                Text("Yaklaşık ${e.price} Kişi"),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(9.0),
                                      child: ElevatedButton(
                                          onPressed: () {
                                            switchFavorite(e);
                                          },
                                          child: e.favorite
                                              ? Text('İlgimi Çekmiyor')
                                              : Text('İlgiliyim')),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(9.0),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          //addProduct();
                                        },
                                        child: Icon(Icons.edit),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          deleteProduct(e.id);
                                        },
                                        child: Icon(Icons.delete),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                        .toList()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
