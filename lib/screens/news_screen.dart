// ignore_for_file: avoid_print, prefer_const_constructors, use_build_context_synchronously, unnecessary_null_comparison, unused_local_variable

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../db/post.dart';
import '../db/product.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late Isar isar;

  List<Post> posts = [];

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  addPost(String title, String content, String imagePath) async {
    Post newPost = Post()
      ..title = title
      ..content = content
      ..imagePath = imagePath;

    await isar.writeTxn(() async {
      var addedId = await isar.posts.put(newPost);
      print(addedId);
      getAllNews();
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

  editPost(int id, String title, String content, String imagePath) async {
    Post newPost = Post()
      ..id = id
      ..title = title
      ..content = content
      ..imagePath = imagePath;

    await isar.writeTxn(() async {
      var addedId = await isar.posts.put(newPost);
      getAllNews();
    });
  }

  deletePost(int id) async {
    isar.writeTxn(() async {
      var result = await isar.posts.delete(id);
      if (result) {
        print('Veri İhlali Silindi');
        getAllNews();
      } else {
        print('Veri İhlali Silinmedi');
      }
    });
  }

  getAllNews() async {
    posts = await isar.posts.where().findAll();
    setState(() {});
  }

  openConnection() async {
    try {
      isar = await Isar.open([PostSchema, ProductSchema]);
      if (isar.isOpen) {
        print('Bağantı Başarılı');
        getAllNews();
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
              child: ElevatedButton(
                onPressed: () {
                  getAllNews();
                  addPost(title, content, imagePath);
                  getAllNews();
                  getAllNews();
                },
                child: Text('Yeni Veri İhlali Bildirimi Ekle'),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: posts
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
                                Text("${e.id} ${e.title}"),
                                Text(e.content!),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(9.0),
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: Icon(Icons.heart_broken),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(9.0),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          editPost(
                                              e.id,
                                              "REVİZE EDİLDİ  ${e.title} ",
                                              "REVİZE EDİLDİ  ${e.content}",
                                              "");
                                        },
                                        child: Icon(Icons.edit),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          deletePost(e.id);
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
